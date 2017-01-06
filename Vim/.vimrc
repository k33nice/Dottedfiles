""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" k33nice <k33nice@gmail.com>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeTabsToggle'] }
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'KeitaNakamura/neodark.vim'
Plug 'tpope/vim-obsession'
" Plug 'Shougo/neocomplete.vim'
Plug 'maralla/completor.vim', {'do': 'make js'}
Plug 'dyng/ctrlsf.vim'
Plug 'vim-utils/vim-husk'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-abolish'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-surround'
Plug 'rking/ag.vim'
Plug 'justinmk/vim-sneak'
Plug 'evidens/vim-twig'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-scripts/YankRing.vim'
Plug 'tpope/vim-repeat'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tobyS/pdv' | Plug 'tobyS/vmustache'
Plug 'k33nice/vim_snippets'
Plug 'hail2u/vim-css3-syntax'
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
" Plug 'neomake/neomake'
Plug 'henrik/vim-indexed-search'
Plug 'mhinz/vim-startify'
Plug 'suan/vim-instant-markdown'
Plug 'w0rp/ale'
Plug 'chase/vim-ansible-yaml'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'mattn/emmet-vim'
Plug 'sjl/gundo.vim'
" Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
if exists("g:plugs['yajs.vim']")
    Plug 'othree/javascript-libraries-syntax.vim'
    Plug 'othree/es.next.syntax.vim'
endif
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helpers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:is_windows = has('win16') || has('win32') || has('win64')
let s:is_cygwin = has('win32unix')
let s:is_mac = !s:is_windows && !s:is_cygwin
      \ && (has('mac') || has('macunix') || has('gui_macvim')
      \ || (!executable('xdg-open') && system('uname') =~? '^darwin'))


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ------------------ NERDTree -------------------------------
let g:NERDTreeWinPos = "right"
map <F4> :NERDTreeToggle<CR>
map <F3> :NERDTreeTabsToggle<CR>

" ------------------ NERDCommenter --------------------------
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

" ------------------- Neocomplete ---------------------------
if exists("g:plugs['neocomplete.vim']")
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1

    "Set minimum syntax keyword length
    let g:neocomplete#sources#syntax#min_keyword_length = 2
    " Set max tags cache
    let g:neocomplete#sources#tags#cache_limit_size = 1024000

    " Enable insert mode moving
    let g:neocomplete#enable_insert_char_pre = 1
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

    " Redefine ft-sql annoying key
    let g:ftplugin_sql_omni_key = '<Leader>sql'

    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
endif

" ------------------- Completor ---------------------------
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=syntaxcomplete#Complete
" let g:completor_php_omni_trigger = '([$\w]{3,}|use\s*|->[$\w]*|::[$\w]*|implements\s*|extends\s*|class\s+[$\w]+|new\s*)$'
set completeopt-=preview

" ------------------- CtrlSF --------------------------------
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
nmap     <C-F>l <Plug>CtrlSFQuickfixPrompt
vmap     <C-F>l <Plug>CtrlSFQuickfixVwordPath
vmap     <C-F>L <Plug>CtrlSFQuickfixVwordExec
let g:ctrlsf_winsize = '100%'
let g:ctrlsf_extra_backend_args = {
    \ 'rg': '--no-ignore',
    \ 'ag': '-u'
    \ }

" ------------------- Obsession -----------------------------
silent execute '!mkdir -p ~/.vim/sessions'
let g:current_path = expand('%:p:h')
let g:session_name = substitute(g:current_path, '[/ ]', '_', 'g')
let g:session_path = $HOME . '/.vim/sessions/' . g:session_name

aug sess
  au!
  au VimEnter * nested call StartSess()
  au BufEnter * nested call RestoreSess()
aug END

" ------------------- Airline -------------------------------
set laststatus=2
let g:airline_theme = 'tomorrow'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1

" ------------------- FZF -----------------------------------
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

if s:is_mac
    nnoremap <silent> <Esc>f :FZF<CR>
else
    nnoremap <silent> <M-f> :FZF<CR>
endif
let $FZF_DEFAULT_COMMAND = 'ag -la --hidden'

" ------------------- MultipleCursors ------------------------
let g:multi_cursor_quit_key='<C-c>'
nnoremap <silent> <C-c> :call multiple_cursors#quit()<CR>
nnoremap <silent> <Esc>l :MultipleCursorsFind <C-R>/<CR>
vnoremap <silent> <Esc>l :MultipleCursorsFind <C-R>/<CR>

if exists("g:plugs['neocomplete.vim']")
autocmd VimEnter * NeoCompleteEnable    " Workaround to make multiple-cursors fast
" << cut >>
" Make multiple cursors fast with neocomplete
function! Multiple_cursors_before()
   silent! exe 'NeoCompleteDisable'
endfunction

function! Multiple_cursors_after()
    silent! exe 'NeoCompleteEnable'
endfunction
endif

" ------------------- Gitgutter ------------------------------
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" ------------------- Easyalign ------------------------------
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ------------------- Supertab -------------------------------
" for neocomplete (forward tab cycle)
let g:SuperTabDefaultCompletionType = "<c-n>"

" ------------------- UltiSnips -------------------------------

if (s:is_mac)
    let g:UltiSnipsExpandTrigger="<Esc>e"
    let g:UltiSnipsJumpForwardTrigger="<Esc>j"
    let g:UltiSnipsJumpBackwardTrigger="<Esc>k"
else
    let g:UltiSnipsExpandTrigger="<M-e>"
    let g:UltiSnipsJumpForwardTrigger="<M-j>"
    let g:UltiSnipsJumpBackwardTrigger="<M-k>"
endif


" ------------------- Guttentags -------------------------------
set tags=tags;,./jstags;
let g:gutentags_exclude=['node_modules']

function! JSTAG_GEN_PRJ()
    call system('find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed "/^$/d" | sort > jstags &')
endfunction
" au VimEnter * call JSTAG_GEN_PRJ()


" ------------------ PDV -------------------------------------
let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"


" ------------------ Yankring -------------------------------------
silent execute '!mkdir -p ~/.vim/yankringhistory'
let g:yankring_history_dir = $HOME."/.vim/yankringhistory"
" disable g
let g:yankring_paste_using_g = 0
if (s:is_mac)
    let g:yankring_replace_n_pkey='<Esc>p'
    let g:yankring_replace_n_nkey = '<Esc>n'
else
    let g:yankring_replace_n_pkey='<M-p>'
    let g:yankring_replace_n_nkey = '<M-n>'
endif


" ------------------ Neomake --------------------------------------
" autocmd! BufWritePost * Neomake
" autocmd InsertChange,TextChanged * update | Neomake


" ------------------ ALE ------------------------------------------
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d','⬥ ok']
let g:ale_javascript_eslint_executable  = 'eslint'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


" ------------------ Startify -------------------------------------
let g:startify_custom_header=[
\ '  _  __  ____    ____            _____                ',
\ ' | |/ / |___ \  |___ \          |_   _|               ',
\ ' | ` /    __) |   __) |  _ __     | |     ___    ___  ',
\ ' |  <    |__ <   |__ <  | `_ \    | |    / __|  / _ \ ',
\ ' | . \   ___) |  ___) | | | | |  _| |_  | (__  |  __/ ',
\ ' |_|\_\ |____/  |____/  |_| |_| |_____|  \___|  \___| ',
\ ]

" ------------------ JavascriptLibs -------------------------------
let g:used_javascript_libs = ''
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_react = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1

" ------------------ Gundo ----------------------------------------
nnoremap <F5> :GundoToggle<CR>
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_preview_bottom = 1

" ------------------ vim-javascript -------------------------------
if exists("g:plugs['vim-javascript']")
    aug vim_javascript
      au!
      " for PaperColor
      au BufEnter *.js,*.jsx hi! link jsThis javaScriptIdentifier
    aug END
endif

" ----------------------- yajs ------------------------------------
if exists("g:plugs['yajs.vim']")
    aug vim_javascript
      au!
      " for PaperColor
      au BufEnter *.js,*.jsx hi! link javascriptImport Include
      au BufEnter *.js,*.jsx hi! link javascriptExport Include
    aug END
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set guioptions=M
set nocompatible
set shell=bash
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8
set history=700
set cursorline

" Enable filetype plugins
filetype plugin on
filetype indent on

" listchars
" set list listchars=tab:»·,trail:·,nbsp:·
set list listchars=tab:\|\ ,trail:·,nbsp:·

let mapleader = ","
let g:mapleader = ","

autocmd BufWritePre * %s/\s\+$//e

map <leader>m <Esc>:set expandtab tabstop=2 shiftwidth=2<CR>

" Think "little tabs" and "big tabs":
map <leader>t <Esc>:set expandtab tabstop=4 shiftwidth=4<CR>
nnoremap <leader><space> :noh<cr>

" BREAKS ULTISNIPS!
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Select last pasted
nnoremap gp `[v`]

command! -bang Tabcloseright call TabCloseRight('<bang>')
command! -bang Tabcloseleft call TabCloseLeft('<bang>')
map <leader><Left> :Tabcloseleft<CR>
map <leader><Right> :Tabcloseright<CR>

nnoremap <Leader>w :w<CR>

command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" move vertically by visual line  -- won't skip over wrapped lines
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap j gj
nnoremap k gk

" Move in Insert Mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l

" <Leader>% - Search and Replace Highlighted Text
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <Leader>% "hy:%s/<C-r>h//gc<left><left><left>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>mm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm


" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if s:is_mac
  nmap <Esc>j <M-j>
  nmap <Esc>k <M-k>
  vmap <Esc>j <M-j>
  vmap <Esc>k <M-k>
endif

noremap <C-C> <ESC>

" visual macro
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

set nu
" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" For tmux usage
set mouse=nicrv

" disable underline text in html
let html_no_rendering=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable asynta  highlighting
syntax enable

set t_Co=256
set background=dark
colorscheme PaperColor
" colorscheme neodark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn=join(range(120,999),",")
" set colorcolumn=121

" ALE error sign disable background
highlight Error ctermbg=none

" Fix syntax Highlight
nmap <leader>r :syntax sync fromstart \| redraw! <cr>
autocmd BufEnter * if getfsize(@%) < 1048576 | :syntax sync fromstart | endif

" ------------------ Autofiletypes -------------------------------------
au BufRead,BufNewFile /etc/nginx/*,*nginx*/*.conf if &ft == '' | setfiletype nginx | endif
au BufRead,BufNewFile *php*.* if &ft == '' | setfiletype php | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"" Auto PASTE when paste in insert mode
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" sunaku's vim/tmux 256color hack. more info here:
" https://github.com/ninrod/tricks/blob/master/shell/tmux.md#sunakus-hack-for-fixing-256-colors-colorschemes-for-vim-inside-tmux
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

let g:lasttab = 1
nmap <silent> gl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" formatopts
autocmd FileType * setlocal formatoptions-=o


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
silent execute '!mkdir -p ~/.vim/{swap,backup,undo}'
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set undofile

nmap path :let @+ = expand('%') <CR>


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection

let s:save_cpo = &cpo | set cpo&vim
if !exists('g:VeryLiteral')
  let g:VeryLiteral = 0
endif

vnoremap <silent> * :<C-U>call <SID>VSetSearch('/')<CR>/<C-R>/<CR>
vnoremap <silent> # :<C-U>call <SID>VSetSearch('?')<CR>?<C-R>/<CR>
vmap <kMultiply> *
nmap <silent> <Plug>VLToggle :let g:VeryLiteral = !g:VeryLiteral
  \\| echo "VeryLiteral " . (g:VeryLiteral ? "On" : "Off")<CR>
if !hasmapto("<Plug>VLToggle")
  nmap <unique> <Leader>vl <Plug>VLToggle
endif
let &cpo = s:save_cpo | unlet s:save_cpo


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:VSetSearch(cmd)
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  normal! gvy
  if @@ =~? '^[0-9a-z,_]*$' || @@ =~? '^[0-9a-z ,_]*$' && g:VeryLiteral
    let @/ = @@
  else
    let pat = escape(@@, a:cmd.'\')
    if g:VeryLiteral
      let pat = substitute(pat, '\n', '\\n', 'g')
    else
      let pat = substitute(pat, '^\_s\+', '\\s\\+', '')
      let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
      let pat = substitute(pat, '\_s\+', '\\_s\\+', 'g')
    endif
    let @/ = '\V'.pat
  endif
  normal! gV
  call setreg('"', old_reg, old_regtype)
endfunction

function! StartSess()
  if !argc()
    execute "Obsession" . g:session_path
  endif
endfunction

function! RestoreSess()
  if !argc() && empty(v:this_session) && filereadable(g:session_path) && !&modified
    execute "source" . g:session_path
  endif
endfunction

function! TabCloseRight(bang)
  let cur=tabpagenr()
  while cur < tabpagenr('$')
    exe 'tabclose' . a:bang . ' ' . (cur + 1)
  endwhile
endfunction

function! TabCloseLeft(bang)
  while tabpagenr() > 1
    exe 'tabclose' . a:bang . ' 1'
  endwhile
endfunction

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

"""""""""""""""""""""" END """""""""""""""""""""""""""""""""""""""""""""""""""""""
