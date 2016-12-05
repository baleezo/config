" If no screen, use color term
if ($TERM == "vt100" || $TERM == "rxvt-unicode" )
  " xterm-color / screen
  set t_Co=8
  set t_AF=[1;3%p1%dm
  set t_AB=[4%p1%dm
endif

"if filereadable($VIMRUNTIME . "/vimrc_example.vim")
" so $VIMRUNTIME/vimrc_example.vim
"endif

"if filereadable($VIMRUNTIME . "/macros/matchit.vim")
" so $VIMRUNTIME/macros/matchit.vim
"endif

syntax on

set list
set listchars=tab:▸\ ,eol:¬
set wildignore=*.o,*~,*.pyc
set cursorline
set cursorcolumn
"hi CursorColumn term=bold cterm=bold guibg=Grey40
hi CursorColumn ctermbg=black ctermfg=None guibg=Grey40
highlight  CursorLine term=bold cterm=bold ctermbg=black guibg=Grey40
"autocmd InsertEnter * highlight  CursorLine ctermbg=Green ctermfg=Red
"autocmd InsertLeave * highlight  CursorLine ctermbg=Yellow ctermfg=None

set synmaxcol=150
set ruler
set si
set lbr
set tw=500
set hls
set textwidth=80
set mouse=nv

augroup vimrc_autocmds
au!
    "autocmd BufRead * highlight OverLength ctermbg=red ctermfg=white guibg=#592929 
    "autocmd BufRead * match OverLength /\%81v.*/
augroup END

hi ColorColumn ctermbg=0


autocmd BufRead *.vala,*.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala,*.vapi setfiletype vala


"filetype plugin indent on
"autocmd FileType python setlocal et sta sw=4 sts=4

"autocmd FileType python setlocal foldmethod=indent
"set foldlevel=99


set paste
set laststatus=2
set statusline=%4*%<\ %1*[%F]
set statusline+=%4*\ %5*[%{&encoding}, " encoding
set statusline+=%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]%m
set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
highlight User1 ctermfg=red
highlight User2 term=underline cterm=underline ctermfg=green
highlight User3 term=underline cterm=underline ctermfg=yellow
highlight User4 term=underline cterm=underline ctermfg=white
highlight User5 ctermfg=cyan
highlight User6 ctermfg=white


let _curfile = expand("%:t")

if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
set noexpandtab
else
set expandtab
endif


set tabstop=2
autocmd FileType python setl tabstop=4 nofoldenable foldmethod=indent
if _curfile =~ ".*\.py"
set shiftwidth=4
else
set shiftwidth=2
endif
set softtabstop=4
"set expandtab

set smarttab


set nonumber
set nocompatible
set wildmenu
set backupdir=~/tmp/vim,~/tmp,.,/var/tmp/vi.recover,/tmp
set directory=~/tmp/vim,~/tmp,/var/tmp/vi.recover,/tmp,.
"set backup		" keep a backup file
"set textwidth=78
"set bs=2		" allow backspacing over everything in insert mode
set autoindent  "always set autoindenting on
set smartindent
set cindent
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
set showmatch
set spellfile=~/.vim/spell.add

" autocmd's
autocmd BufNewFile,BufRead *.tex,*.txt set spell
autocmd BufNewFile,BufRead *.tex,*.txt set tw=72


" VIM 6.0,
if version >= 600
    " set nohlsearch
    " set foldcolumn=2
    " set foldmethod=syntax
    set foldmethod=marker
    set foldlevel=1
"    set foldtext=/^/=>
    " set encoding=utf-8
    " set fileencoding=big5
    " set termencoding=big5
    set encoding=utf-8
    " set fileencodings=latin,big5,ucs-bom,utf-8,sjis,big5
    set fileencodings=ucs-bom,utf-8,sjis,big5,latin1
else
    set fileencoding=taiwan
endif

" Tab key binding
if version >= 700
" set t_kb=^?
 fixdel
 set shortmess=filnxtToOI
  map <2-LeftMouse> g<c-]>
  map  <C-c> :tabnew<CR>
  imap <C-c> <ESC>:tabnew<CR>
  map  <C-k> :tabclose<CR>
  map  <C-p> :tabprev<CR>
  imap <C-p> <ESC>:tabprev<CR>
  map  <C-n> :tabnext<CR>
  "imap <C-n> <ESC>:tabnext<CR>
  map <F4> :set invcursorline<CR><ESC>:set invcursorcolumn<CR>
  map <F9> :TlistToggle<CR>
  "map <F3> :%s/^[<Space><Tab>]*$//g<CR>
  nnoremap <F2> :set hlsearch!<CR>
  map <F3> <ESC>:%s/\s\+$//g<CR><ESC>:set expandtab<CR><ESC>:set shiftwidth=2<CR>
  map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> 
  map <F5> <ESC>:NERDTreeToggle<CR>
  map <F6> <ESC>:set noexpandtab<CR><ESC>:set shiftwidth=2<CR>

  map g1 :tabn 1<CR>
  map g2 :tabn 2<CR>
  map g3 :tabn 3<CR>
  map g4 :tabn 4<CR>
  map g5 :tabn 5<CR>
  map g6 :tabn 6<CR>
  map g7 :tabn 7<CR>
  map g8 :tabn 8<CR>
  map g9 :tabn 9<CR>
  map g0 :tabn 10<CR>
  map gc :tabnew<CR>
  map gn :tabn<CR>
  map gp :tabp<CR>

  highlight TabLineSel term=bold,underline cterm=bold,underline ctermfg=7 ctermbg=0
  highlight TabLine    term=bold cterm=bold
  highlight clear TabLineFill


end

" Crontabs must be edited in place
au BufRead /tmp/crontab* :set backupcopy=yes

"colorscheme desert

