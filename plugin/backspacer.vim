" vim-backspacer
"
" Author: Yuki Yoshimine <yuki.uthman@gmail.com>
" Source: https://github.com/yuki-uthman/vim-backspacer


if exists("g:loaded_backspacer")
  finish
endif
let g:loaded_backspacer = 1

let s:save_cpo = &cpo
set cpo&vim

inoremap <silent><Plug>(backspacer-execute)  <CMD>call backspacer#execute()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
