# git prompt インストール
mkdir -p "${HOME}/.zsh"
curl -o "${HOME}/.zsh/git-prompt.sh" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
git clone --depth 1 https://github.com/unixorn/fzf-zsh-plugin.git
git clone https://github.com/Aloxaf/fzf-tab ~/dotfiles/fzf-tab
git clone https://github.com/zsh-users/zsh-autosuggestions ~/dotfiles/.zsh/zsh-autosuggestions
# シンボリックリンク
mkdir -p "${HOME}/.config"
CURRENT_DIR=$(cd "$(dirname "$0")" && pwd)
ln -snf ${CURRENT_DIR}/.zshrc ${HOME}/.zshrc
ln -snf ${CURRENT_DIR}/.gitconfig ${HOME}/.gitconfig
for dir in *
do
    if [ ${dir} = 'tmux' ]; then
        ln -snf "${CURRENT_DIR}/${dir}/tmux.conf" "${HOME}/.tmux.conf"
    fi
    if [ -d ${dir} ]; then
        ln -snf ${CURRENT_DIR}/${dir} ${HOME}/.config/${dir}
    fi
done
