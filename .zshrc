if [ -f ~/.torchbox_zshrc ]; then
    . ~/.torchbox_zshrc
fi

ZSH_THEME=robbyrussell

KEYTIMEOUT=1

plugins=(
    # git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    zsh-autosuggestions
    # git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    zsh-syntax-highlighting
    git
    colored-man-pages
    colorize
    pip
    python
    bundler
    vagrant
    aws
    command-not-found
    archlinux
    kubectl
    nvm
)

# Editor settings
# Prefer "vimx" over "vim". "vimx" is only specific to Fedora. It is VIM with
# X11 support.
if [ -x "$(command -v vimx)" ]; then
    export EDITOR=vimx
else
    export EDITOR=vim
fi
export VISUAL=$EDITOR
alias vim=$EDITOR
alias vi=$EDITOR

# Vagrant to use Virtualbox
export VAGRANT_DEFAULT_PROVIDER=virtualbox

# History
HISTSIZE=100000
SAVEHIST=$HISTSIZ

# ZSH plugins
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --keep-zshrc
source ~/.oh-my-zsh/oh-my-zsh.sh
