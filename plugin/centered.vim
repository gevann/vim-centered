let g:centered_vim_session = '/tmp/vim.session'
let g:centered_pane = 0
let g:centered_buffer_num = ''
let g:centered_scratch_pad = '/tmp/scratch.org'

function! OffSet()
  if exists("g:centered_offset")
    let l:centered_offset = g:centered_offset
  else
    let l:centered_offset = float2nr(&columns * 0.33)
  endif
  return l:centered_offset
endfunction

function! TogglePaneOffset(with_scratch)
  if g:centered_pane
    execute "source " . g:centered_vim_session
    let g:centered_pane = 0
  else
    execute "mks! " . g:centered_vim_session
    silent only
    lefta vnew
    let g:centered_buffer_num = bufnr("%")
    if a:with_scratch
      execute "e " . g:centered_scratch_pad
    else
      setlocal buftype=nofile
      setlocal readonly
    endif
    setlocal bufhidden=delete
    setlocal nobuflisted
    setlocal noswapfile
    setlocal nonu
    execute "vertical resize " . OffSet()
    wincmd w
    let g:centered_pane = 1
  endif
endfunction

function! AdjustOffset()
  if g:centered_pane
    let l:old_switch_buf = &switchbuf
    let l:from_buf = bufnr("%")
    set switchbuf+=useopen
    execute "sb " . g:centered_buffer_num
    execute "vertical resize " . OffSet()
    execute "sb " . l:from_buf
    set switchbuf = l:old_switch_buf
  endif
endfunction

autocmd VimResized * :call AdjustOffset()

nnoremap cnt :call TogglePaneOffset(1)<cr>
nnoremap cnn :call TogglePaneOffset(0)<cr>
