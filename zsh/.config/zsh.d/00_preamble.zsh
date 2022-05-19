# oh-my-zsh shit
export ZSH=$HOME/.oh-my-zsh
export ZSH_TMUX_AUTOSTART_ONCE=true
export ZSH_TMUX_UNICODE=true
plugins=(git asdf tmux)
source $ZSH/oh-my-zsh.sh

source "$HOME/.config/zsh.d/amuse.zsh-theme"

# asdf for local tooling
export IS_MAC=false
if [[ `uname` == "Darwin" ]]; then
	source /usr/local/opt/asdf/libexec/asdf.sh
	export IS_MAC=true
else
	source $HOME/.asdf/asdf.sh
fi

export IS_WSL=false
if [[ `uname -a` == *"microsoft"* ]]; then
	export IS_WSL=true
fi
