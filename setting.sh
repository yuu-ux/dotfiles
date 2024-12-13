# git prompt インストール
mkdir -p "${HOME}/.zsh"
curl -o "${HOME}/.zsh/git-prompt.sh" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
git clone --depth 1 https://github.com/unixorn/fzf-zsh-plugin.git
# シンボリックリンク
mkdir -p "${HOME}/.config"
CURRENT_DIR=$(cd "$(dirname "$0")" && pwd)
ln -snf ${CURRENT_DIR}/.zshrc ${HOME}/.zshrc
for dir in *
do
    if [ ${dir} = 'tmux' ]; then
        ln -snf "${CURRENT_DIR}/${dir}/tmux.conf" "${HOME}/.tmux.conf"
    fi
    if [ -d ${dir} ]; then
        ln -snf ${CURRENT_DIR}/${dir} ${HOME}/.config/${dir}
    fi
done

# コミットテンプレート追加
# TODO ファイル内ですでに指定されていたら追記しないように条件分岐したい
echo "
[commit]
  template = ~/dotfiles/.gitmessages" >> ${HOME}/.gitconfig

# デフォルトのエディタを変更
git config --global core.editor nvim
