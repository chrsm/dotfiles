source <(fzf --zsh)

# export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

function jump(){
	# find at least git root dir
	local gitroot=$(git -C $PWD rev-parse --show-toplevel 2>/dev/null)
	local args="--strip-cwd-prefix"
	if [ -z "$gitroot" ]; then
		gitroot=""
	else
		args=""
	fi

	builtin cd $(fd . $gitroot --type d $args | \
	  fzf --ansi \
	      --color "hl:-1:underline,hl+:-1:underline:reverse")
}

function search(){
	rg --no-require-git --color=always --line-number --no-heading --smart-case "${*:-}" | \
	  fzf --ansi \
	      --color "hl:-1:underline,hl+:-1:underline:reverse" \
	      --delimiter : \
	      --preview 'bat --color=always {1} --highlight-line {2}' \
	      --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
	      --bind 'enter:become(nvim {1} +{2})'
}
