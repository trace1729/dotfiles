
syntax on
filetype on 
filetype indent on
filetype plugin on 
filetype plugin indent on
set softtabstop=2
set scrolloff=5
set tabstop=2
set rnu
set mouse=a
set conceallevel=2 " 这里建议写成2，写1时替换后的效果不好看nmap d( di(va(p
noremap j h
noremap k j
noremap i k
noremap z i
noremap K 5j
noremap J 7h
noremap L 7l
" N key: go to the start of the line
noremap <C-n> 0
" I key: go to the end of the line
noremap <C-s> <nop>
"noremap <C-a> <C-v>

inoremap jj <ESC>:w<CR>

map S :w<CR>
map Q :q<CR>
map sr :set splitright<CR>:vsplit<CR>
map sl :set nosplitright<CR>:vsplit<CR>
map su :set nosplitbelow<CR>:split<CR>
map sd :set splitbelow<CR>:split<CR>

map <SPACE>h <ESC>:nohlsearch<CR>
"noremap d{ di}
"noremap d[ di]
"noremap dt  dit

map <SPACE><LEFT> <c-w>h
map <SPACE><RIGHT> <c-w>l
map <SPACE><UP> <c-w>k
map <SPACE><DOWN> <c-w>j
map <SPACE>c <ESC>:wq<CR>
map <S-h> 0
map <S-l> $

" ==================== Tab management ====================
" Create a new tab with tu
map <leader>n :tabnew<CR>
map tl :tabnext<CR>
map th :tabprevious<CR>
map t0 :tablast<CR>
map t$ :tabfirst<CR>
map r :call CompileRunGcc()<CR>


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
