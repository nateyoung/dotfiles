" let pathogen install plugins
execute pathogen#infect()

set t_Co=256                " enable 256 colors
"colorscheme blackdust       " color scheme
"colorscheme busybee         " color scheme
"colorscheme camo            " color scheme
colorscheme desert          " color scheme
set shell=/bin/sh           " set shell - needed for tmux<->vim switching
scriptencoding utf-8        " process w/ utf8 support
set encoding=utf-8          " enable utf8
syntax on                   " syntax highlighting
set tabstop=2               " number of spaces per TAB
set softtabstop=2           " number of spaces per TAB
set expandtab               " tabs are spaces
set hidden                  " keep hidden buffers open
set nowrap                  " don't wrap display of lines if too long
set textwidth=120           " when inserting, wrap after 120 chars
set number                  " show line numbers
set numberwidth=5           " fix linenum width
set backspace=2             " make backspace delete like normal
set ignorecase              " case insensitive search
set smartcase               " search case sensitive if capitalized
set incsearch               " search as characters are entered
set hlsearch                " highlight all matches
set cpoptions+=$            " add $ to end of selection
set virtualedit=all         " allow cursor to go where no cursor has gone before (past EOL)
set wildmenu                " visual autocomplete for command menu
set lazyredraw              " only redraw when needed
set autoread                " reload files edited outside vim
set splitbelow              " split down
set splitright              " split right
set scrolloff=8             " start scrolling when we're 8 lines away from margins
set sidescrolloff=15        " start scrolling when 15 chars away from edge
set sidescroll=1            " scroll to the side by 1 char at a time
set visualbell              " use visual bell instead of beep
set fillchars+=vert:│       " use vert line as divider on split
set shiftround              " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=2            " 2 spaces for shifting
set gdefault                " default search/replace to whole file without 'g'
"set cursorline              " highlight current line - kind of annoying as a line
"set mouse=a                 " enable mouse for scrolling - can mess up copy/paste
set nobackup                " we don't need no stinkin' backup
set noswapfile              " we don't need no stinkin' swap
set guioptions-=T           " no toolbar in gVim
"set guioptions-=m           " no menubar in gVim
set guioptions-=r           " no scrollbar in gVim
set guioptions-=L           " no scrollbar in gVim
set title titlestring=gvim  " don't need to see "nerdtree" in title
set autoindent              " automagically indent

" paste in insert mode
imap <C-v> <C-r><C-o>+

" sane window navigation
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" enable persistent undo
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" make vert split char pretty
highlight VertSplit cterm=NONE ctermfg=darkgreen ctermbg=NONE guifg=darkgreen guibg=NONE

" dim line numbers
highlight LineNr guifg=darkgrey ctermfg=darkgrey

" make 'search wrapped' warning obnoxious so I notice it...
"highlight WarningMsg ctermfg=white ctermbg=red guifg=White guibg=Red gui=None

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" unicode chars for displaying white space (show with <leader>l)
set listchars=tab:»·,trail:·,nbsp:·,eol:↩

" mapleader of ',' is easier than '\'
let mapleader = ","

" splits
nnoremap <leader>- :sp<cr>
nnoremap <leader>\ :vsp<cr>

" save
nnoremap <leader>w :w<cr>

" toggle relative numbers
nnoremap <leader>rn :set invrnu<cr>

" reload file
nnoremap <leader>r :e<cr>

" toggle NERDTree and Buffergator
nnoremap <leader>k :NERDTreeToggle<cr>:BuffergatorToggle<cr>

" go to single window mode ([f]ullscreen)
nnoremap <leader>f <C-W>o

" close window when split
nnoremap <leader>q <C-W>q

" close buffer without deleting window
nnoremap <leader>x :bp\|bd #<CR>

" invert listchars (whitespace display)
nnoremap <leader>l :set invlist<cr>

" jumps - from http://vim.wikia.com/wiki/Jumping_to_previously_visited_locations
function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction
nnoremap <leader>j :call GotoJump()<cr>

" navigate buffers easier
nnoremap <leader>n :bnext<CR>
nnoremap <leader>b :bprev<CR>

" yankring
nnoremap <leader>y :YRShow<CR>

"nnoremap <leader>yn :yankring_replace_n_nkey CR>
" new scratch buffer
nnoremap <leader>sb :call Scratch()<CR>

" maintain visual select after shifting text
vnoremap > >gv
vnoremap < <gv
vnoremap x xgv

" create a new line, then return to cursor position
map <Leader>o m`o<Esc>``

" ,p to toggle paste mode
map <leader>p :set invpaste<CR>

" clear search term
nmap <silent> ,/ :nohlsearch<CR>

" Open a Quickfix window for the last search.
nnoremap <silent> ,s :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" edit and source vimrc
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Tabularize mappings - use GTabularize to ignore comment lines in visual-block mode
function! s:TabAliases()
  " align commas
  nnoremap <leader>a, :Tabularize /,<cr>
  vnoremap <leader>a, :GTabularize /[^\/\/],<cr>gv

  " align ;
  nnoremap <leader>a; :Tabularize /;<cr>
  vnoremap <leader>a; :Tabularize /;<cr>gv
  "vnoremap <leader>a; :GTabularize /[^^\s*\/\/];<cr>gv " doesn't work for some reason

  " align double slash
  nnoremap <leader>a/ :Tabularize /\/\/<cr>
  vnoremap <leader>a/ :Tabularize /\/\/<cr>gv

  " align |
  nnoremap <leader>a\| :Tabularize /\|<cr>
  vnoremap <leader>a\| :GTabularize /[^^\s*\/\/]\|<cr>gv

  " align &
  nnoremap <leader>a& :Tabularize /&<cr>
  vnoremap <leader>a& :GTabularize /[^^\s*\/\/]&<cr>gv

  " align =
  nnoremap <leader>a= :Tabularize /=<cr>
  vnoremap <leader>a= :GTabularize /[^^\s*\/\/]=<cr>gv

  " align < (tailored for verilog register assignments)
  nnoremap <leader>a< :Tabularize /</l4c0<cr>
  vnoremap <leader>a< :GTabularize /[^^\s*\/\/]</l4c0<cr>gv

  " align (
  nnoremap <leader>a( :Tabularize /(<cr>
  vnoremap <leader>a( :GTabularize /[^^\s*\/\/](<cr>gv

  " align )
  nnoremap <leader>a) :Tabularize /)/l1c0<cr>
  vnoremap <leader>a) :GTabularize /)/l1c0<cr>gv
  "vnoremap <leader>a) :GTabularize /[^^\s*\/\/])/l1c0<cr>gv " doesn't work for some reason
endfunction
autocmd VimEnter * if exists(":Tabularize") | call s:TabAliases() | endif

" make ; and : do the same thing (no need for extra shift all the time...)
nnoremap ; :
vnoremap ; :

" let g:NERDTreeDirArrows=0
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" tell NERDTree to ignore CVS dirs
let NERDTreeIgnore=['CVS$[[dir]]']

set laststatus=2

" airline stuff
"let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'bubblegum'
"let g:airline_powerline_fonts=1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

filetype plugin on

if exists('loaded_matchit')
  let b:match_ignorecase=0
  let b:match_words=
    \ '\<begin\>:\<end\>,' .
    \ '\<if\>:\<else\>,' .
    \ '\<module\>:\<endmodule\>,' .
    \ '\<class\>:\<endclass\>,' .
    \ '\<program\>:\<endprogram\>,' .
    \ '\<clocking\>:\<endclocking\>,' .
    \ '\<property\>:\<endproperty\>,' .
    \ '\<sequence\>:\<endsequence\>,' .
    \ '\<package\>:\<endpackage\>,' .
    \ '\<covergroup\>:\<endgroup\>,' .
    \ '\<primitive\>:\<endprimitive\>,' .
    \ '\<specify\>:\<endspecify\>,' .
    \ '\<generate\>:\<endgenerate\>,' .
    \ '\<interface\>:\<endinterface\>,' .
    \ '\<function\>:\<endfunction\>,' .
    \ '\<task\>:\<endtask\>,' .
    \ '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
    \ '\<fork\>:\<join\>\|\<join_any\>\|\<join_none\>,' .
    \ '`ifdef\>:`else\>:`endif\>,'
endif

" Setup log file highlighting - this needs fixing...
autocmd BufRead,BufReadPost *.log,*.log.gz set filetype=log_file

" command to run a shell command and put output in a new buffer
" To use, :Shell <command>
" from http://vim.wikia.com/wiki/VimTip1599
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

function! Scratch()
  :new
  :setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
endfunction

" custom tagbar config for systemverilog - correlates with ~/.ctags
let g:tagbar_type_systemverilog = {
    \ 'ctagstype': 'systemverilog',
    \ 'kinds' : [
        \'c:class',
        \'t:task',
        \'f:function',
        \'m:module',
        \'p:program',
        \'i:interface',
        \'e:typedef',
        \'d:define',
        \'v:variable',
        \'a:parameter'
    \]
\}


" turn on indent guides by default
"let g:indent_guides_enable_on_vim_startup = 1

" buffergator
let g:buffergator_autoupdate = 1
let g:buffergator_viewport_split_policy = "R"
let g:buffergator_suppress_keymaps = 1
let g:buffergator_autodismiss_on_select = 0
let g:buffergator_sort_regime = "basename"
let g:buffergator_autoexpand_on_split = 0
