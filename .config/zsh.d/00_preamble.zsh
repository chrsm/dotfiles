# oh-my-zsh shit
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="amuse"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# asdf for local tooling
export IS_MAC=false
if [[ `uname` == "Darwin" ]]; then
	source /usr/local/opt/asdf/libexec/asdf.sh
	export IS_MAC=true
else 
	source /opt/asdf-vm/asdf.sh
fi

export IS_WSL=false
if [[ `uname -a` == *"microsoft"* ]]; then
	export IS_WSL=true
fi
