export LOCALBIN=$HOME/.local/bin
export GOPATH=$HOME/go
export RUST_SRC_PATH=$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/.local/lib"
export ORIG_PATH=$PATH
export LUAROCKS_PATH="$HOME/.luarocks/bin"

if [[ "$IS_MAC" == "false" ]]; then
	#export LUAROCKS_PATH="$(asdf where luaJIT)/bin:"
	export LUA_PATH="$(luarocks path --append --lr-path);./?.lua;./?/init.lua"
	export LUA_CPATH="$(luarocks path --append --lr-cpath)"
else
	# macs suck
	export LUA_PATH="$(luarocks path --append --lr-path);./?.lua;./?/init.lua"
	export LUA_CPATH="$(luarocks path --append --lr-cpath)"
fi


export COMPOSER_PATH="$HOME/.config/composer/vendor/bin"

function join_by {
  local d=${1-} f=${2-}
  if shift 2; then
    printf %s "$f" "${@/#/$d}"
  fi
}

export PATH=$(join_by : "$LOCALBIN" "$GOPATH/bin" "$HOME/.cargo/bin" "$LUAROCKS_PATH" "$COMPOSER_PATH" "$ORIG_PATH")
