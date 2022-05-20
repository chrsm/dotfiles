export LOCALBIN=$HOME/.local/bin
export GOPATH=$HOME/go
export RUST_SRC_PATH=$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/.local/lib"
export ORIG_PATH=$PATH

if [[ "$IS_MAC" == "false" ]]; then
	export LUAROCKS_PATH="$(asdf where luaJIT)/bin:"
	export LUA_PATH="$(luarocks path --append --lr-path);./?.lua;./?/init.lua"
	export LUA_CPATH="$(luarocks path --append --lr-cpath)"
else
	# macs suck
	export LUA_PATH="$(luarocks --lua-dir=/usr/local/opt/luajit path --append --lr-path);./?.lua;./?/init.lua"
	export LUA_CPATH="$(luarocks --lua-dir=/usr/local/opt/luajit path --append --lr-cpath)"
fi

export PATH="$LOCALBIN:$GOROOT/bin:$GOPATH/bin:$HOME/.cargo/bin:$LUAROCKS_PATH$ORIG_PATH"
