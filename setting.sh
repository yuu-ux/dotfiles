sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

CURRENT_DIR=$(cd $(dirname $0); pwd)
ln -snf ${CURRENT_DIR}/.zshrc ${HOME}/.zshrc
for dir in *
do
    if [ -d ${dir} ]; then
        ln -snf ${CURRENT_DIR}/${dir} ${HOME}/.config/${dir}
    fi
done

mkdir ${CURRENT_DIR}/nvim/plugged
nvim +":PlugInstall" ${HOME}/dotfiles/nvim/init.lua
