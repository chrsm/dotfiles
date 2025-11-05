#!/usr/bin/env bash

mkdir -p $HOME/.local/share/psysh
wget -O $HOME/.local/share/psysh/php_manual.sqlite http://psysh.org/manual/en/php_manual.sqlite

composer install
