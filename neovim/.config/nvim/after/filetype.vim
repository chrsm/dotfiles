augroup filetypedetect
  au BufRead,BufNewFile *.yue if &ft == 'make' | set ft=yue | endif
augroup END
