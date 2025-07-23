#!/bin/bash
set -eux
set -o pipefail

_cb=$(git symbolic-ref --short HEAD)
_tl=$(git rev-parse --show-toplevel)
_mb=$(cat $_tl/.git/refs/remotes/origin/HEAD | sed 's/ref: refs\/remotes\/origin\///')

echo $_cb $_tl $_mb
echo "$_mb -> upd -> $_cb"

git checkout $_mb
git fetch --all --prune
git pull --rebase

git checkout $_cb
git rebase $_mb
