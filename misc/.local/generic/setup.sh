#!/bin/bash
set -e

asdf_inst () {
	local p=$1
	local version="${2:-latest}"

	asdf plugin add $p || true
	asdf uninstall $p || true
	asdf install $p $version || true
	asdf global $p $version || true
	# not necessary but w/e
	asdf reshim $p $version || true
}

IS_MAC=false
if [[ `uname` == "Darwin" ]]; then
	IS_MAC=true
	if ! [ -x "$(command -v brew)" ]; then
		bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi
else
	if ! [ -x "$(command -v yay)" ]; then
		cd $HOME/.local
		mkdir deps
		cd deps
		# i use arch btw /s
		git clone https://aur.aurchlinux.org/yay.git && cd yay && makepkg -si
	fi
fi

# asdf
if ! [ -x "$(command -v asdf)" ]; then
	if [[ "$IS_MAC" == "true" ]]; then
		brew install asdf
	else
		git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0
	fi
fi

PLUGINS=(assh golang lua luaJIT openresty protoc tfsec)
for p in "${PLUGINS[@]}"
do
	asdf_inst $p
done

PLUGINS_NIGHTLY=(neovim)
for p in "${PLUGINS_NIGHTLY[@]}"
do
	asdf_inst $p nightly
done

# non-luajit rocks
LUA_ROCKS_NOJIT=(yuescript)
for rock in "${LUA_ROCKS_NOJIT[@]}"
do
	asdf env lua luarocks install $rock
	
	# HACK! terrible idea but /shrug
	if [[ "$rock" == "yuescript" ]]; then
		cp "$(asdf env lua which yue)" ~/.local/bin/yue
	fi
done

# luajit-compat-or-only rocks
LUA_ROCKS_JITOK=(luafilesystem inspect xmlua http lpeg lua-cjson busted luacheck)
for rock in "${LUA_ROCKS_JITOK[@]}"
do
	luarocks install $rock
done
