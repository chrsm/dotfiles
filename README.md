# dotfiles

nothing useful to see here. just dotfiles.


# install

i'm dumb and will forget..

- mac: `brew install stow`
- nix: `yay -S stow`


## stow setup

```
git clone https://github.com/chrsm/dotfiles ~/.dotfiles
cd ~/.dotfiles
stow zsh
stow ssh
stow misc
stow neovim
```

## machine setup

```
~/.local/generic/setup.sh
```


## neovim

```
cd ~/.config/neovim && make
vim +PackerInstall +qall && vim +PackerCompile +qall
```
