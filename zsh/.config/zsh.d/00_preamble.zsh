export IS_MAC=false
if [[ `uname` == "Darwin" ]]; then
	export IS_MAC=true
fi

export IS_WSL=false
if [[ `uname -a` == *"microsoft"* ]]; then
	export IS_WSL=true
fi

if [[ "$IS_MAC" = "true" ]] && [[ -d "/tmp" ]]; then
	export TMPDIR=/tmp
fi

# oh-my-zsh shit
zstyle ':omz:update' mode disabled
export ZSH=$HOME/.oh-my-zsh
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOSTART_ONCE=true
export ZSH_TMUX_UNICODE=true

plugins=(git tmux)
source $ZSH/oh-my-zsh.sh

source "$HOME/.config/zsh.d/amuse.zsh-theme"
