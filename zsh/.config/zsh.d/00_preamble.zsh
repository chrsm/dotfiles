# asdf for local tooling
export IS_MAC=false
if [[ `uname` == "Darwin" ]]; then
	export IS_MAC=true
else
	source $HOME/.asdf/asdf.sh
fi

export IS_WSL=false
if [[ `uname -a` == *"microsoft"* ]]; then
	export IS_WSL=true
fi

# oh-my-zsh shit
export ZSH=$HOME/.oh-my-zsh
export ZSH_TMUX_AUTOSTART_ONCE=true
export ZSH_TMUX_UNICODE=true

plugins=(git asdf tmux)
if [[ "$IS_MAC" = "true" ]]; then
	# macs suck
	plugins=(git tmux)
fi
source $ZSH/oh-my-zsh.sh

source "$HOME/.config/zsh.d/amuse.zsh-theme"
