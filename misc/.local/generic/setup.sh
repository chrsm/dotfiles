#!/bin/bash
set -e

IS_MAC=false
if [[ `uname` == "Darwin" ]]; then
	IS_MAC=true
	if ! [ -x "$(command -v brew)" ]; then
		bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi

	$HOME/.local/mac/setup.sh
fi

# asdf
if ! [ -x "$(command -v asdf)" ]; then
	if [[ "$IS_MAC" == "true" ]]; then
		brew install asdf
	else
		git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0
	fi
fi

$HOME/.local/generic/asdf.sh
$HOME/.local/generic/luarocks.sh

