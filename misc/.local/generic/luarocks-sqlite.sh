#!/bin/bash
set -e

folder=$(mktemp -d -t luasqlite-XXXXXX)
trap 'rm -rf -- "$folder"' EXIT
rs="luasql-sqlite3-2.6.0-1.rockspec"

wget -O $folder/$rs \
	https://raw.githubusercontent.com/keplerproject/luasql/master/rockspec/$rs

patch $folder/$rs luasqlite3.patch

pushd $folder
luarocks install $rs
popd

rm -rf -- "$folder"
