let g:centered_vim_session = '/tmp/vim.session'
let g:centered_pane = 0
let g:centered_scratch_pad = '/tmp/scratch.org'

 function! TogglePaneOffset(with_scratch)
   if exists("g:centered_offset")
     let l:centered_offset = g:centered_offset
   else
     let l:centered_offset = float2nr(&columns * 0.33)
   endif

   if g:centered_pane
     execute "source " . g:centered_vim_session
     let g:centered_pane = 0
   else
     execute "mks! " . g:centered_vim_session
     silent only
     lefta vnew
     setlocal bufhidden=delete
     setlocal nobuflisted
     setlocal noswapfile
     setlocal nonu
     if a:with_scratch
       execute "e " . g:centered_scratch_pad
     else
       setlocal buftype=nofile
       setlocal readonly
     endif
     execute "vertical resize " . l:centered_offset
     wincmd w
     let g:centered_pane = 1
   endif
 endfunction

nnoremap cnt :call TogglePaneOffset(1)<cr>
nnoremap cnn :call TogglePaneOffset(0)<cr>
