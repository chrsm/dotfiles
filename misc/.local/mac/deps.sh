#!/bin/bash
set -euxo pipefail

function install_redeyes() {
	git clone https://github.com/tonylazarew/redeyes ~/.local/deps/redeyes
	cd ~/.local/deps/redeyes && git reset --hard 4a99bd0894e0078f3e742cab2279c8e2350b3b1b
	make && cp redeyes ~/.local/bin
}
