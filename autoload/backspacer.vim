
function! backspacer#hello() abort
  echom "Hello"
endfunc

function! s:execute() abort

  let before_cursor = getline(".")[:col(".")-2]
  let got_non_whitespace = match(before_cursor, '\S')

  if got_non_whitespace > 0
    call feedkeys("\<BS>", "n")
    return
  endif

  let prev_cur = getcurpos()
  exe "normal! a\<C-F>\<ESC>"
  let new_cur = getcurpos()

  if new_cur[2] >= prev_cur[2]
    call feedkeys("0\<C-D>", "n")
    call feedkeys("\<BS>", "n")
    call feedkeys("\<C-F>", "n")
  endif

endfunc

function! backspacer#execute() abort
  call s:execute()
endfunc


