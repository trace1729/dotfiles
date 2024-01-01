
syntax on
filetype on 
filetype indent on
filetype plugin on 
filetype plugin indent on
set autochdir
set exrc
set secure
set number
set relativenumber
set cursorline
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
"set noshowmode
set ignorecase
set smartcase
set shortmess+=c
set completeopt=longest,noinsert,menuone,noselect,preview
set lazyredraw
set rnu
set mouse=a
set conceallevel=3 " 这里建议写成2，写1时替换后的效果不好看nmap d( di(va(p

" ==================== Basic Mappings ====================
let mapleader=" "
nnoremap Q :q<CR>
nnoremap S :w<CR>

vnoremap Y "+y
" Find pair
noremap ,. %
noremap <silent> <LEADER>o za

" insert a pair of {} and go to the next line
inoremap <c-y> <ESC>A {}<ESC>i<CR><ESC>ko

" ==================== Cursor Movement ====================
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     i
" < j   l >
"     k
"     v
noremap <silent> i k
noremap <silent> j h
noremap <silent> k j
noremap <silent> z i
noremap <silent> K 5j
noremap <silent> J 7h
noremap <silent> L 7l
noremap <silent> Z I


" visual block mode
" vnoremap ; :
" nnoremap <silent> ' "

" U/E keys for 5 times u/e (faster navigation)
noremap <silent> I 5k
noremap <silent> K 5j
" N key: go to the start of the line
noremap <silent> J 0
" I key: go to the end of the line
noremap <silent> E $
" Faster in-line navigation
noremap W 5w
noremap B 5b
" set h (same as n, cursor left) to 'end of word'
" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>
" N key: go to the start of the line
noremap <C-n> 0
" I key: go to the end of the line
noremap <C-s> <nop>
" Disable the default s key
noremap s <nop>

map <SPACE><CR> <ESC>:nohlsearch<CR>

" ==================== Window management ====================
" Use <space> + new arrow keys for moving the cursor around windows
"noremap <LEADER>i <C-w>w
noremap <SPACE><up>   <C-w>k
noremap <SPACE><left>  <C-w>h
noremap <SPACE><down>  <C-w>j
noremap <SPACE><right> <C-w>l
noremap qf <C-w>o
" Disable the default s key
noremap s <nop>


" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
map sr :set splitright<CR>:vsplit<CR>
map sl :set nosplitright<CR>:vsplit<CR>
map su :set nosplitbelow<CR>:split<CR>
map sd :set splitbelow<CR>:split<CR>

"" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H
" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H
" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>


" ==================== Tab management ====================
" Create a new tab with tu
map <leader>n :tabnew<CR>
map tl :tabnext<CR>
map th :tabprevious<CR>
map t0 :tablast<CR>
map t$ :tabfirst<CR>
map R :call CompileRunGcc()<CR>


au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  "elseif &filetype == 'tex'
   " exec "\ll"
  endif
endfunc

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'



" add something 
