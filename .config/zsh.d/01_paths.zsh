export LOCALBIN=$HOME/.local/bin
export GOPATH=$HOME/go
export RUST_SRC_PATH=$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/.local/lib"
export LUAROCKS_PATH="$(asdf where luaJIT)/bin"
export ORIG_PATH=$PATH
export PATH="$HOME/.asdf/shims:$LOCALBIN:$GOROOT/bin:$GOPATH/bin:$HOME/.cargo/bin:$HOME/.config/composer/vendor/bin:$LUAROCKS_PATH:$ORIG_PATH"


