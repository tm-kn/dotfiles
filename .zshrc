export PATH=$PATH:$HOME/bin:$HOME/go/bin


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

export BROWSER=firefox
export EDITOR=nvim
export VISUAL=$EDITOR
alias vim=$EDITOR
alias vi=$EDITOR

# Vagrant to use Virtualbox
export VAGRANT_DEFAULT_PROVIDER=virtualbox

# History
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T %z (%Z)] "
setopt EXTENDED_HISTORY

if [ -f ~/.torchbox_zshrc ]; then
    . ~/.torchbox_zshrc
fi

# ZSH plugins
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --keep-zshrc
source ~/.oh-my-zsh/oh-my-zsh.sh
