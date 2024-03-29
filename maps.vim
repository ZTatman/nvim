:" Map undo \"u" to CTRL+Z, and redo to SHIFT+z
nnoremap <C-z> u
nnoremap zx <C-R>
inoremap <C-z> <C-O>u
inoremap zx <C-O><C-R>

" remap backspace
inoremap <C-w> <C-\><C-o>dB
inoremap <C-BS> <C-\><C-o>db

" Exit insert mode
inoremap <C-Space> <Esc>

" Write to buffer
inoremap <C-s> <C-O>:update<CR>

" FZF fuzzy search
nnoremap <silent> <C-_> :Files<CR>
nnoremap <silent> <C-r> :Rg<CR>

" Toggle Nvim Tree
nnoremap <C-b> :NvimTreeToggle<CR>
nnoremap <C-f> :NvimTreeFindFile<CR>

" Exit Terminal Mode
tnoremap <Esc> <C-\><C-n>

" increase the window size by a factor of 1.5 and decrease the window size by 0.67
" nnoremap <Leader>+ :exe "resize " . (winwidth(0) * 3/2)<CR>
" nnoremap <Leader>- :exe "resize " . (winwidth(0) * 2/3)<CR>
nnoremap <leader>= <c-w>=
nnoremap <leader>+ 10<c-w>>
nnoremap <leader>- 10<c-w><

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" Substitute command
nnoremap <leader>s :%s/

" Open $MYVIMRC
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source $MYVIMRC
nnoremap <leader>sv :source $MYVIMRC<cr>
" Source Current File
nnoremap <leader>so :source %<cr>

" Surround word with quotation marks
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" Toggle zen-mode
nnoremap <leader>z :ZenMode<cr>

" Navigate up/down to first non blank character of line
nmap <S-Up> <Up>^
nmap <S-Down> <Down>^

" Move up and down by 3 lines at a time
nmap <S-k> 4k<cr>
nmap <S-j> 2j<cr>
nmap <leader>j <S-j><cr>

" Move lines up or down
nnoremap <Space>k :m .-2<CR>==
nnoremap <Space>j :m .+1<CR>==
vnoremap <Space>j :m '>+1<CR>gv=gv
vnoremap <Space>k :m '<-2<CR>gv=gv

" Show the highlight groups being used for word under cursor
" https://jordanelver.co.uk/blog/2015/05/27/working-with-vim-colorschemes/
nnoremap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" List all highlight groups currently active
nnoremap <leader>hi :so $VIMRUNTIME/syntax/hitest.vim<cr>

" Tab Navigation
nnoremap tn :tabnew<CR>
nnoremap tnf :tabnew<space>
nnoremap ]t :tabnext<CR>
nnoremap [t :tabprevious<CR>
nnoremap tq :confirm tabclose<CR>
nnoremap tqa :if tabpagenr('$') > 1 \| tabonly \| else \| %bd \| endif<CR>
nnoremap tl :tabs<CR>
