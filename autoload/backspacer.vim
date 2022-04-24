
function! backspacer#hello() abort
  echom "Hello"
endfunc

function! s:only_whitespace_before_cursor() abort
  let before_cursor = getline(".")[:col(".")-2]
  let match_pos = match(before_cursor, '\S')

  if match_pos >= 0
    return v:false
  else
    return v:true
  endif
endfunc

function! s:should_go_up() abort
  let prev_col = getcurpos()[2]
  exe "normal! a\<C-F>\<ESC>"
  let new_col = getcurpos()[2]

  if new_col >= prev_col
    return v:true
  else
    return v:false
  endif
endfunc


function! s:execute() abort

  if s:only_whitespace_before_cursor()
  else
    call feedkeys("\<BS>", "n")
    return
  endif

  if s:should_go_up()
    call feedkeys("0\<C-D>", "n")
    call feedkeys("\<BS>", "n")
    call feedkeys("\<C-F>", "n")
  endif

endfunc

function! backspacer#execute() abort
  call s:execute()
endfunc


