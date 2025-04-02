alias v='nvim'
alias nor='/home/yehara/.local/bin/norminette'
alias cdso='cd /Users/ebarayuuga/Documents/so_long'
alias chrome='open /Applications/Google\ Chrome.app/'
alias docker-rm='docker rm -f `(docker ps -aq)`'
alias docker-rmi='docker rmi -f `(docker images -aq)`'
alias g++='clang++ -std=c++20'
# Created by `pipx` on 2024-08-09 13:57:16
export PATH="$PATH:/Users/ebarayuuga/.local/bin"
export PATH="/opt/X11/bin/:$PATH"
source ~/.zsh/git-prompt.sh
alias d='docker'
alias dc='docker compose'
alias LONG_MAX='echo 9223372036854775808'

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

setopt PROMPT_SUBST
PROMPT='%F{yellow}%D %*%f%F{blue}(%M)%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
%F{green}%n%f %% '

## lang
# export LANG=ja_JP.UTF-8
# export LC_ALL=ja_JP.UTF-8
# color
autoload -Uz colors
colors
local WHITE=$'%{\e[97m%}'
local RED=$'%{\e[91m%}'
local GREEN=$'%{\e[92m%}'
local YELLOW=$'%{\e[93m%}'
local BLUE=$'%{\e[94m%}'
local CYAN=$'%{\e[96m%}'
local CLEAR=$'%{\e[0m%}'

setopt auto_menu            # 補完キー（Tab, Ctrl+I) を連打するだけで順に補完候補を自動で補完する
setopt auto_param_slash     # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_keys      # カッコの対応などを自動的に補完する
setopt auto_list            # 補完候補が複数ある時に、一覧表示する
setopt list_packed          # 補完候補をできるだけ詰めて表示する
setopt list_types           # auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示
setopt mark_dirs            # ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt interactive_comments # コマンドラインでも # 以降をコメントと見なす
setopt magic_equal_subst    # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt always_last_prompt   # カーソル位置を保持したままファイル名一覧を順次補完する
setopt extended_glob        # 拡張グロブで補完する（ファイル名で #, ~, ^ の 3 文字を正規表現として扱う）
setopt globdots             # ドットの指定なしでも.から始まるファイルを補完する

# setting
setopt auto_cd              # 指定したコマンド名がなく、ディレクトリ名と一致した場合 cd する
setopt auto_pushd           # 移動したディレクトリを記録し、cd -[TAB]で候補を提示する
setopt pushd_ignore_dups    # auto_pushd で重複ディレクトリを記録しない
setopt hist_ignore_all_dups # 重複履歴を残さない
setopt auto_resume          # サスペンド中のプロセスと同じコマンド名を実行した場合はリジュームする
setopt nobeep nolistbeep    # ビープ音を鳴らさないようにする
setopt correct              # コマンドのスペルチェックをする
setopt ignore_eof           # Ctrl+D では終了しないようになる（exit, logout などを使う）
setopt long_list_jobs       # 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt multios              # 複数のリダイレクトやパイプなど、必要に応じて tee や cat の機能が使われる
setopt numeric_glob_sort    # ファイル名の展開で、辞書順ではなく数値的にソートされるようになる
setopt print_eightbit       # 8 ビット目を通すようになり、日本語のファイル名などを見れるようになる
setopt print_exit_value     # 戻り値が 0 以外の場合終了コードを表示する
setopt short_loops          # for, repeat, select, if, function などで簡略文法が使えるようになる
setopt prompt_subst         # 色を使う
unsetopt promptcr           # 文字列末尾に改行コードが無い場合でも表示する
setopt transient_rprompt    # コピペする際に右プロンプトを非表示にする
setopt notify

# history
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリー上のヒストリ数
SAVEHIST=100000           # ファイル上のヒストリ数
setopt extended_history   # zsh の開始・終了時刻をヒストリファイルに書き込む
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する
setopt hist_ignore_space  # コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
setopt hist_verify        # ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_no_store      # history (fc -l) コマンドをヒストリリストから取り除く。
setopt append_history     # 複数の zsh を同時に使う時など history ファイルに上書きせず追加する
autoload history-search-end

if [[ ${SET_LOCAL_LD_LIBRARY_PATH} -ne 1 && -d $HOME/local/bin ]]; then
  export SET_LOCAL_LD_LIBRARY_PATH=1
  export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
fi

# completion
autoload -Uz compinit
compinit -u
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 大文字と小文字の区別しない
zstyle ':completion:*:default' menu select=2

# Ctrl+rでヒストリーのインクリメンタルサーチ、Ctrl+sで逆順
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward

# コマンド途中からヒストリー検索
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^b" history-beginning-search-forward-end

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
zstyle ":chpwd:*" recent-dirs-default true
zstyle ':completion:*:*:cdr:*:*' menu selection
bindkey -e

# alias
alias ls='ls -F --color=auto'
alias la='ls -Fa --color=auto'
alias ll='ls -FalG --color=auto'
alias mysql='mysql --auto-rehash'
alias vi=$EDITOR

# global alias
alias -g L='| less'
alias -g G='| grep'
alias -g F='| fzf'
alias -g W='| wc -l'
alias -g T='| tail'
alias -g H='| head'

# 追加したパッケージのコマンドを優先
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

[[ -e /usr/share/terminfo/x/xterm-256color ]] && export TERM=screen-256color
[[ -e /lib/terminfo/x/xterm-256color ]] && export TERM=screen-256color

export PATH=$HOME/dotfiles/fzf-zsh-plugin/bin:${PATH}
source $HOME/dotfiles/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh
source $HOME/dotfiles/fzf-tab/fzf-tab.plugin.zsh
source $HOME/dotfiles/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
eval "$(~/.local/bin/mise activate zsh)"
bindkey '^l' autosuggest-accept
# Load Homebrew config script
source $HOME/.brewconfig.zsh

if [[ ! -d ~/.zsh-autopair ]]; then
  git clone https://github.com/hlissner/zsh-autopair ~/.zsh-autopair
fi

source ~/.zsh-autopair/autopair.zsh
autopair-init
