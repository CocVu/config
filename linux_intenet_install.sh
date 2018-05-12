cd ~
dotfiles="~/dotfiles"
nmconfig="~/nmconfig"
zsh="~/oh-my-zsh"


if [ ! -f $dotfiles ]; then
    git clone git@github.com:CocVu/dotfiles.git
    cp ~/dotfiles/.spacemacs .
    cp ~/dotfiles/.vimrc .
fi

# install zsh
if [ ! -f $zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    sudo chsh -s /bin/zsh
    cp ~/dotfiles/.zshrc ~
fi

if [ ! -f $nmconfig ]; then
    git clone git@github.com:CocVu/config.git
    rm -r .config
    mv config ./config
fi
