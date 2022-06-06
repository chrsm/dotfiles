#!/bin/bash
set -e

# rocks that aren't buildable with luajit
LUA_ROCKS_NOJIT=(yuescript)
# luajit-compat-or-only rocks
LUA_ROCKS_JITOK=(luafilesystem inspect xmlua http lpeg lua-cjson busted luacheck)

for rock in "${LUA_ROCKS_NOJIT[@]}"
do
	asdf env lua luarocks install $rock
	
	# HACK! terrible idea but /shrug
	if [[ "$rock" == "yuescript" ]]; then
		cp "$(asdf env lua which yue)" ~/.local/bin/yue
	fi
done

for rock in "${LUA_ROCKS_JITOK[@]}"
do
	luarocks install $rock
done
