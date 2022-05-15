#!/bin/env bash
set -e

function download {
	local url=""
	if [[ "$IS_MAC" == "true" ]]; then
		url="https://github.com/sumneko/lua-language-server/releases/download/3.2.2/lua-language-server-3.2.2-darwin-x64.tar.gz"
	else
		url="https://github.com/sumneko/lua-language-server/releases/download/3.2.2/lua-language-server-3.2.2-linux-x64.tar.gz"
	fi

	wget -O $HOME/.local/lls/lls.tar.gz $url
}

(
	mkdir -p $HOME/.local/lls
	cd $HOME/.local/lls
	download
	tar xvfz lls.tar.gz
	rm lls.tar.gz
)

echo "extracted lua-language-server"
