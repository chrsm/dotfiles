augroup filetypedetect
  au BufRead,BufNewFile *.yue if &ft == 'make' | set ft=yue | endif
  au BufRead,BufNewFile *.cr if &ft == 'cr' | set ft=crystal syntax=crystal | endif
augroup END
