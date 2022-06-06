#!/bin/bash
set -e

# list of all currently used asdf plugins
PLUGINS=(assh golang lua luaJIT openresty protoc tfsec delta bitwarden)
PLUGINS_NIGHTLY=(neovim)

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

for p in "${PLUGINS[@]}"
do
	asdf_inst $p
done

for p in "${PLUGINS_NIGHTLY[@]}"
do
	asdf_inst $p nightly
done
