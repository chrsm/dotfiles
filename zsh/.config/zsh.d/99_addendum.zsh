setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS

# anything that _needs_ to be per-env
if [[ -f "$HOME/.zshrc.local" ]]; then
	source $HOME/.zshrc.local
fi
