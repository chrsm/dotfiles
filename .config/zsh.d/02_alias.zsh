alias vim="nvim"
alias wvim="GOOS=windows nvim"

alias "git-patch"="git add -p"

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
fi

