# wsl crap
if [ -z "$WSLENV" ] && [[ "$OLDPWD" = "/c/Windows/System32" || "$OLDPWD" = "/c/Users/$USER" || "$OLDPWD" = "/c/Users/$USER/Desktop" ]]; then
    cd $HOME
fi

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="amuse"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/.shell_secrets
source $HOME/.paths
source $HOME/.alias
source $HOME/.dockerfuncs

setopt HIST_IGNORE_SPACE
setopt hist_expire_dups_first
setopt hist_ignore_dups

export EDITOR="nvim"
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++


