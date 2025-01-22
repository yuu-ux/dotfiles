-- グローバルな名前空間を汚さないようにモジュールとして定義
local M = {}

-- デバウンス用の変数をモジュール内に移動
local last_modified = 0

-- 関数シグネチャを解析する関数
local function regex_function(txt)
    local out = {}
    local i = 1
    while i <= #txt do
        local start = 0
        local temp = 0
        local parentheses = 0
        -- アルファベットやアンダースコアが見つかるまでスキップ
        while i <= #txt and not string.match(string.sub(txt, i, i), "[%w_]") do
            i = i + 1
        end
        start = i
        -- 関数名を解析
        while i <= #txt and string.match(string.sub(txt, i, i), "[%w_]") do
            i = i + 1
        end
        -- 開き括弧を見つけたら関数シグネチャとみなす
        if i <= #txt and string.sub(txt, i, i) == '(' then
            parentheses = 1
            i = i + 1
            temp = i
            -- 閉じ括弧が見つかるまで進む
            while i <= #txt and parentheses > 0 and string.sub(txt, i, i) ~= ';' do
                if string.sub(txt, i, i) == '(' then
                    parentheses = parentheses + 1
                elseif string.sub(txt, i, i) == ')' then
                    parentheses = parentheses - 1
                end
                i = i + 1
            end
            if parentheses == 0 then
                table.insert(out, {start = start, ending = i, signature = string.sub(txt, start, i)})
            end
            i = temp
        end
        i = i + 1
    end
    return out
end

-- 名前空間を作成
local namespace = vim.api.nvim_create_namespace('function_lines_counter')

-- バッファが変更された際、またはファイルが読み込まれた際に関数行数を表示
local function display_function_lines(bufnr)
    local file_name = vim.api.nvim_buf_get_name(bufnr)
    -- .cファイルのみを処理
    if not string.match(file_name, "%.c$") then
        return
    end

    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local txt = table.concat(lines, "\n")
    local all_res_regex = regex_function(txt)

    -- 既存のextmarkをクリア
    vim.api.nvim_buf_clear_namespace(bufnr, namespace, 0, -1)

    for _, res_regex in ipairs(all_res_regex) do
        local i = res_regex.ending + 1
        if string.sub(txt, i, i) == '{' then
            i = i + 1
            local brackets = 1
            -- 関数の終わり（閉じ括弧）を探す
            while brackets > 0 and i <= #txt do
                if string.sub(txt, i, i) == '{' then
                    brackets = brackets + 1
                elseif string.sub(txt, i, i) == '}' then
                    brackets = brackets - 1
                end
                i = i + 1
            end

            -- 関数内の行数をカウント
            local size = 0
            local start = res_regex.ending + 2
            local end_ = i - 1
            while start < end_ do
                if string.sub(txt, start, start) == '\n' then
                    size = size + 1
                end
                start = start + 1
            end

            -- 行番号を取得
            local row = #vim.split(string.sub(txt, 1, i-1), '\n') - 1
			-- 関数の下に描写するための帳尻合わせ
			-- 関数内部の行数のみ知りたいため、-1する
			row = row + 1
			size = size - 1

            -- 関数の下に行数を仮想テキストとして表示
            local virt_text = size > 25 and
                {{"--Function lines: " .. size .. "--", "ErrorMsg"}} or
                {{"--Function lines: " .. size .. "--", "Comment"}}

            vim.api.nvim_buf_set_extmark(bufnr, namespace, row, 0, {
                virt_text = virt_text,
                virt_text_pos = "eol"
            })
        end
    end
end

-- ファイルが変更されたときのイベントにフック
local function on_modified(bufnr)
    local current_time = vim.loop.now()
    if current_time - last_modified >= 200 then
        last_modified = current_time
        display_function_lines(bufnr)
    end
end

-- 初期化関数
function M.setup()
    -- バッファ読み込み時とテキスト変更時の自動コマンド
    local group = vim.api.nvim_create_augroup('FunctionLinesCounter', { clear = true })
    vim.api.nvim_create_autocmd({"BufReadPost", "TextChanged", "TextChangedI"}, {
        group = group,
        callback = function()
            local bufnr = vim.api.nvim_get_current_buf()
            on_modified(bufnr)
        end
    })
end

return M
