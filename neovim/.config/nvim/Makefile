.PHONY: all

NVIM = nvim --headless

all: build

build:
	yue init.yue -l
	cd lua && yue -l .

clean:
	rm init.lua
	cd lua && find . -type f -name '*.lua' -delete

install:
	$(NVIM) -c 'Lazy install' -c 'quitall'
