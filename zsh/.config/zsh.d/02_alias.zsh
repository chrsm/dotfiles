CLIP_IMPL="xsel -ib"

if [[ "$IS_MAC" == "true" ]]; then
	CLIP_IMPL="pbcopy"
elif [[ "$IS_WSL" == "true" ]]; then
	CLIP_IMPL="win32yank.exe"
fi

function gnvim {
	nvim --headless --listen localhost:6666 &

	if [[ "$IS_WSL" == "true" ]]; then
		neovide.exe --remote-tcp=localhost:6666
	else
		neovide --remote-tcp=localhost:6666
	fi
}

alias vim="nvim"
alias wvim="GOOS=windows nvim"

function note {
	(
		cd $HOME/notes
		vim +Telekasten
	)
}
alias notes=note

alias gow="GOOS=windows go"

alias dco="docker-compose"

alias clang++="clang++ -MJ compile_commands.json -fsanitize=address -Wall -Wextra -Wfloat-equal -std=c++17"
alias g++="g++ -Wall -Wextra -Wfloat-equal -std=c++17"

alias gitup="git fetch --all --prune ; git pull --rebase"
alias gitclean="git branch -vv | grep 'origin/.*: gone]' | awk '{print \$1}' | xargs git branch -D"

if [[ "$IS_MAC" == "true" ]]; then
	alias dash="open -a /Applications/Dash.app"
	alias firefox="open -a /Applications/Firefox.app"
	alias slack="open -a /Applications/Slack.app"
elif [[ "$IS_WSL" == "true" ]]; then
	alias firefox="/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe"
fi
# no alias needed for nix

alias gcppwd="gcloud auth print-access-token|tr -d '\n'|$CLIP_IMPL"
alias gcplogin="gcloud auth login --update-acp"

if [[ ! -f "$HOME/.local/bin/yue" ]]; then
	alias yue="asdf env lua yue"
fi

alias upd-nvim="asdf uninstall neovim nightly && asdf install neovim nightly"
