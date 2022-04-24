#!/bin/bash
set -e

asdf_inst () {
	local p=$1
	local version="${2:-latest}"

	asdf plugin add $p || true
	asdf install $p $version || true
	asdf global $p $version || true
	# not necessary but w/e
	asdf reshim $p $version || true
}

IS_MAC=false
if [[ `uname` == "Darwin" ]]; then
	IS_MAC=true
fi

# asdf
if ! [ -x "$(command -v asdf)" ]; then
	if [[ "$IS_MAC" == "true" ]]; then
		brew install asdf
	else
		cd $HOME/.local
		mkdir deps
		cd deps
		git clone https://aur.archlinux.org/asdf-vm.git && cd asdf-vm && makepkg -si
	fi
fi

PLUGINS=(assh golang lua luaJIT openresty protoc tfsec)
for p in "${PLUGINS[@]}"
do
	asdf_inst $p
done

asdf_inst neovim nightly
