.PHONY: all

all: build

build:
	yue init.yue
	cd lua && yue .

clean:
	rm init.lua
	cd lua && find . -type f -name '*.lua' -delete

install:
	nvim +PackerInstall +PackerCompile +qall
