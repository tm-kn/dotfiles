if [ -f ~/.torchbox_zshrc ]; then
    . ~/.torchbox_zshrc
fi

export ZSH=/usr/share/oh-my-zsh

ZSH_THEME=wedisagree

KEYTIMEOUT=1

export NVM_DIR="/usr/share/nvm"

plugins=(
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

HISTSIZE=100000
SAVEHIST=$HISTSIZ


source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
