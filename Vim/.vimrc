""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" k33nice <k33nice@gmail.com>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'jistr/vim-nerdtree-tabs' | Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeTabsToggle'] }
" Plug 'mcchrish/nnn.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'

Plug 'arthurxavierx/vim-caser'
Plug 'tpope/vim-obsession'

if has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'roxma/nvim-yarp'
  " Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Plug 'zxqfl/tabnine-vim'
Plug 'sebdah/vim-delve'

Plug 'dyng/ctrlsf.vim'
Plug 'vim-utils/vim-husk'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/committia.vim'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'ervandew/supertab'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'rking/ag.vim'
Plug 'mileszs/ack.vim'
Plug 'justinmk/vim-sneak'
Plug 'evidens/vim-twig'
Plug 'ludovicchabant/vim-gutentags'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'tpope/vim-repeat'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tobyS/pdv' | Plug 'tobyS/vmustache'
Plug 'k33nice/vim_snippets'

Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'kamykn/popup-menu.nvim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'vim-scripts/dbext.vim'
Plug 'google/vim-searchindex'
Plug 'mhinz/vim-startify'
Plug 'dense-analysis/ale'
Plug 'chase/vim-ansible-yaml'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
" Plug 'zchee/deoplete-go', {'do': 'make'}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'dhruvasagar/vim-table-mode'
Plug 'jamessan/vim-gnupg'
Plug 'cespare/vim-toml'
Plug 'elixir-editors/vim-elixir'
Plug 'mattn/gist-vim' | Plug 'mattn/webapi-vim'
Plug 'sgur/vim-editorconfig'
Plug 'eshion/vim-sync' | Plug 'skywind3000/asyncrun.vim'
Plug 'wincent/terminus'
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'

Plug 'zivyangll/git-blame.vim'
" Plug 'vim-vdebug/vdebug'

Plug 'wakatime/vim-wakatime'
" Plug 'reedes/vim-wordy'

Plug 'kamykn/spelunker.vim'

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
let python_highlight_all = 1
" ------------------ NERDTree -------------------------------
let g:NERDTreeWinPos = "right"
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
map <F3> :NERDTreeToggle<CR>
" map <F4> :NERDTreeTabsToggle<CR>
" ----------------------- NNN -------------------------------
" let g:nnn#layout = 'split' " or vertical split, tabedit etc.
" let g:nnn#layout = { 'right': '~20%'  } " or right, up, down"


" ------------------ PDV -------------------------------------
let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
nnoremap mn :call pdv#DocumentWithSnip()<CR>

" ------------------ NERDCommenter --------------------------
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDRemoveExtraSpaces = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters={
	\ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}

" ------------------- Deoplete ---------------------------
if exists("g:plugs['deoplete.nvim']")
    let g:deoplete#enable_at_startup = 1
    set completeopt-=preview
    let g:ftplugin_sql_omni_key = '<Leader>sql'
    let g:deoplete#file#enable_buffer_path = 1
    let g:deoplete#auto_refresh_delay = 2
    let g:deoplete#auto_complete_delay = 50
endif

" ---------------------- CoC -----------------------------
set shortmess+=c
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-t> coc#refresh()
nnoremap <silent> ,, :call CocActionAsync('showSignatureHelp')<CR>

nnoremap <silent> K :call <SID>show_documentation()<CR>

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

let g:ftplugin_sql_omni_key = '<Leader>sql'


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
    \ 'rg': '-uu',
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
if exists("g:plugs['vim-airline']")
    set laststatus=2
    let g:airline_theme = 'tomorrow'
    let g:airline_extensions = ['tabline']
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#tab_nr_type = 1
    let g:airline#extensions#tabline#show_tab_type = 0
    let g:airline_highlighting_cache = 1
    set ttimeoutlen=50
endif


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

if has('nvim')
    nnoremap <silent> <M-f> :FZF<CR>
elseif has('gui_macvim')
    nnoremap <silent> <M-F> :FZF<CR>
elseif s:is_mac
    nnoremap <silent> <Esc>f :FZF<CR>
else
    nnoremap <silent> <M-f> :FZF<CR>
endif

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always -F '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <silent> ,s :call FzfRgCurrWord()<CR>
vnoremap <silent> ,s :call FzfSelected()<CR>
vnoremap <silent> ,f <Esc>:FZF -q <C-R>=<SID>getVisualSelection()<CR><CR>

cnoreabbrev rg Rg

let $FZF_DEFAULT_COMMAND = 'rg --files -uuuL -g "!.git/*" -g "!node_modules" -g "!vendor"'


" ------------------- MultipleCursors ------------------------
if exists("g:plugs['YankRing.vim']")
  let g:multi_cursor_quit_key='<C-c>'
  nnoremap <silent> <C-c> :call multiple_cursors#quit()<CR>
  nnoremap <silent> <Esc>l :MultipleCursorsFind <C-R>/<CR>
  vnoremap <silent> <Esc>l :MultipleCursorsFind <C-R>/<CR>
endif


" ------------------- Gitgutter ------------------------------
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif
let g:gitgutter_sign_allow_clobber = 1

" autocmd BufEnter * sign define dummy
" autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" ------------------- Easyalign ------------------------------
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
let g:easy_align_ignore_groups = ['String']

" ------------------- Supertab -------------------------------
let g:SuperTabDefaultCompletionType = "<c-n>"

" ------------------- UltiSnips -------------------------------

if has('nvim')
    let g:UltiSnipsExpandTrigger="<M-e>"
    let g:UltiSnipsJumpForwardTrigger="<M-j>"
    let g:UltiSnipsJumpBackwardTrigger="<M-k>"
elseif (s:is_mac)
    let g:UltiSnipsExpandTrigger="<Esc>e"
    let g:UltiSnipsJumpForwardTrigger="<Esc>j"
    let g:UltiSnipsJumpBackwardTrigger="<Esc>k"
else
    let g:UltiSnipsExpandTrigger="<M-e>"
    let g:UltiSnipsJumpForwardTrigger="<M-j>"
    let g:UltiSnipsJumpBackwardTrigger="<M-k>"
endif


" ------------------- Gutentags -------------------------------
set tags=tags;,./jstags;
let g:gutentags_ctags_exclude=['node_modules']
let g:gutentags_ctags_extra_args=['--pattern-length-limit=130']

function! JSTAG_GEN_PRJ()
    call system('find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed "/^$/d" | sort > jstags &')
endfunction
" au VimEnter * call JSTAG_GEN_PRJ()


" ------------------ yankstack -------------------------------------
if exists("g:plugs['vim-yankstack']")
    if has('nvim')
        nmap <M-p> <Plug>yankstack_substitute_older_paste
        nmap <M-n> <Plug>yankstack_substitute_newer_paste
    elseif (s:is_mac)
        nmap <Esc>p <Plug>yankstack_substitute_older_paste
        nmap <Esc>n <Plug>yankstack_substitute_newer_paste
    else
        nmap <M-p> <Plug>yankstack_substitute_older_paste
        nmap <M-n> <Plug>yankstack_substitute_newer_paste
    endif
    let g:yankstack_yank_keys = ['c', 'C', 'd', 'D', 'x', 'X', 'y', 'Y']
endif


" ------------------ ALE ------------------------------------------
let g:ale_set_highlights = 0
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
" let g:ale_statusline_format = ['⨉ %d', '⚠ %d','⬥ ok']
let g:ale_javascript_eslint_executable  = 'eslint'
let g:ale_sign_column_always = 1
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 0
let g:ale_max_signs = 100
let g:ale_echo_delay = 25
let g:ale_lint_delay = 1000
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_linters = {'go': ['gofmt', 'golint', 'go vet', 'go build'], 'php': ['php', 'phpcs', 'phpmd']}
let g:ale_php_phpmd_ruleset = $HOME.'/phpmd.xml'
let g:ale_go_gopls_executable = 'gopls'
let g:ale_go_gopls_options = '--mode stdio'


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

" ------------------ vim-javascript -------------------------------
if exists("g:plugs['vim-javascript']")
    aug vim_javascript
      au!
      " for PaperColor
      au BufEnter *.js,*.jsx hi! link jsThis javaScriptIdentifier
      au BufEnter *.js,*.jsx hi! link jsGlobalObjects Global
      " au BufEnter *.js,*.jsx hi! link jsGlobalObjects Global
    aug END
endif


" ----------------------- vim-go ------------------------------------
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_info_mode = 'guru'
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" let g:go_def_mapping_enabled = 0

au FileType go map <buffer> <2-LeftMouse> :GoDoc<cr>
au FileType go map <silent> <buffer> <leader>d :GoInfo<cr>
au FileType go map <silent> <buffer> <leader>c :GoCoverageToggle<cr>
au FileType go map <silent> <buffer> <F5> :GoRun<cr>

" ------------------- vim-table-mode --------------------------------
let g:table_mode_corner="|"
" let g:table_mode_corner_corner="|"
" let g:table_mode_header_fillchar="="

" ------------------- auto-pairs ------------------------------------
let g:AutoPairsMultilineClose = 0
let g:AutoPairsShortcutFastWrap = '<C-e>'
let g:AutoPairsShortcutToggle = '<M-v>'

" ------------------- vim-markdown-preview --------------------------
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Google Chrome'


" ------------------- nerdtree-git-plugin ---------------------------
au ColorScheme * hi link NERDTreeGitStatusIgnored Title

" ------------------------- vim-gist --------------------------------
if s:is_mac
    let g:gist_clip_command = 'pbcopy'
else
    let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1


" ------------------------- vim-gist --------------------------------
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack


" ----------------------- deoplete-go -------------------------------
let g:deoplete#sources#go#gocode_binary = 'gocode'

" ----------------------- phpcd -------------------------------------
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']


" ------------------------- vim-jsx ---------------------------------
command! JSX call Jsx()

" ------------------------- vim-sync --------------------------------
let g:asyncrun_silent=1

function! ToggleSync()
    if !exists('#vim_sync#BufWritePost')
        augroup vim_sync
            au!
            autocmd BufWritePost * silent call SyncUploadFile()
        augroup END
    else
        augroup vim_sync
            au!
        augroup END
    endif
endfunction

nnoremap <F9> :call ToggleSync()<CR>
call ToggleSync()

""""" EXAMPLE .sync file
"
" #!/bin/sh
" if [ "upload" == $1 ];then
"     rsync -azcuv  `dirname $0`/$2/$3 dev-sandbox:playgrounds/packages/manage/okrykovliuk/$2/$3
" elif [ 'download' == $1 ];then
"     rsync -azcuv  dev-sandbox:playgrounds/packages/manage/okrykovliuk/$2/$3 `dirname $0`/$2/$3
" fi

" ------------------------- table-mode --------------------------------
let g:table_mode_tableize_map = '<Leader>ttt'


" --------------------------- terminus --------------------------------
let g:TerminusCursorShape=0


" -------------------------- git-blame --------------------------------
map ,b :<C-u>call gitblame#echo()<CR>


" ------------------------- coc-explorer ------------------------------
let g:coc_explorer_global_presets = {
\   '.vim': {
\      'root-uri': '~/.vim',
\   },
\   'floating': {
\      'position': 'floating',
\   },
\   'floatingLeftside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\   },
\   'floatingRightside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\   },
\   'simplify': {
\     'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

" Use preset argument to open it
nmap <F4> :CocCommand explorer <CR>


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
" set cursorline
set ttyfast

set path+=**
set guicursor=

" Enable filetype plugins
filetype plugin on
filetype indent on

" listchars
set list listchars=tab:\|\ ,trail:·,nbsp:·

let mapleader = ","
let g:mapleader = ","

" trim whitespaces
" autocmd BufWritePre * keepjumps %s/\s\+$//e
autocmd BufWritePre * silent call TrimWhitespace()

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

" set clipboard+=unnamedplus

" Select last pasted

nnoremap <leader>lp `[v`]

command! -bang Tabcloseright call TabCloseRight('<bang>')
command! -bang Tabcloseleft call TabCloseLeft('<bang>')
map <leader><Left> :Tabcloseleft<CR>
map <leader><Right> :Tabcloseright<CR>

nnoremap <Leader>w :w<CR>

command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

set updatetime=200



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
  nmap <Esc>k <M-k>
  nmap <Esc>j <M-j>
  vmap <Esc>j <M-j>
  vmap <Esc>k <M-k>
endif

noremap <C-c> <ESC>
vnoremap <C-c> <ESC>
inoremap <C-c> <ESC>

" visual macro
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
nnoremap <leader>jq :call ToJSON()<CR>

map <space> %

map <leader>z :set foldmethod=indent<cr>zM<cr>
map <leader>a :set nofoldenable<cr>zR<cr>


" Search only in visual Selection
if s:is_mac
    vnoremap <Esc>/ <Esc>/\%V
else
    vnoremap <M-/> <Esc>/\%V
end

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

" file > 50MB disble slow actions
autocmd BufEnter * if getfsize(@%) > 52428800 | call LargeFile() | endif
autocmd BufEnter *.php if line('$') > 2000 | call IncreaseRDT() | endif

set laststatus=2
set showtabline=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related word6
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

" more natural split behavior
set splitbelow
set splitright

"" Auto PASTE when paste in insert mode
" function! WrapForTmux(s)
"   if !exists('$TMUX')
"     return a:s
"   endif

"   let tmux_start = "\<Esc>Ptmux;"
"   let tmux_end = "\<Esc>\\"

"   return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
" endfunction

" let &t_SI .= WrapForTmux("\<Esc>[?2004h")
" let &t_EI .= WrapForTmux("\<Esc>[?2004l")

" function! XTermPasteBegin()
"   set pastetoggle=<Esc>[201~
"   set paste
"   return ""
" endfunction

" inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

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

noremap <leader>dd :call DeleteHiddenBuffers()<CR>

" Spell checking
function! ToggleSpell()
  let g:myLang=g:myLang+1
  if g:myLang>=len(g:myLangList) | let g:myLang=0 | endif
  if g:myLang==0
    setlocal nospell
  else
    execute "setlocal spell spelllang=".get(g:myLangList, g:myLang)
  endif
endfunction

let g:myLang=0
let g:myLangList=["nospell","ru,en"]
" nmap <silent> <F7> :call ToggleSpell()<CR>
" autocmd BufReadPost * call ToggleSpell()

let g:enable_spelunker_vim = 0
nmap <silent> <F7> :call spelunker#toggle#toggle()<CR>

let g:trim_whitespace = 1
nnoremap <F8> :call ToggleTrimWhitespace()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax  highlighting
syntax enable
autocmd Syntax * syntax keyword Todo NOTE TODO FIXME XXX HACK containedin=.*Comment.*

" ALE, neomake error sign
augroup error_signs
    au!
    au ColorScheme * hi NeomakeErrorSign ctermfg=125
    au ColorScheme * hi ALEErrorSign ctermbg=none ctermfg=125
augroup END

set t_Co=256
set background=dark
colorscheme PaperColor
" colorscheme gruvbox
" colorscheme neodark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

let &colorcolumn=join(range(121,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
" function! SetColorColum()
"     let &colorcolumn=join(range(121,999),",")
"     highlight ColorColumn ctermbg=235 guibg=#2c2d27
" endfunction

" aug color_column
"   au!
"   au VimEnter * call SetColorColum()
" aug END

" Fix syntax Highlight
nmap <leader>r :syntax sync fromstart \| redraw! <cr>
" autocmd BufEnter * if getfsize(@%) < 1048576 | :syntax sync fromstart | endif
" autocmd BufEnter * if getfsize(@%) < 1048576 | :set syn=on | endif

hi clear SpellBad
hi SpellBad cterm=underline

" ------------------ Autofiletypes -------------------------------------
au BufRead,BufNewFile /etc/nginx/*,*nginx*/*.conf if &ft == '' | setfiletype nginx | endif
au BufRead,BufNewFile *php*.* if &ft == '' | setfiletype php | endif

au BufRead,BufNewFile *.service set filetype=systemd
au BufRead,BufNewFile *.timer set filetype=systemd
au BufRead,BufNewFile *.mount set filetype=systemd
au BufRead,BufNewFile *.target set filetype=systemd
au BufRead,BufNewFile *.socket set filetype=systemd
au BufRead,BufNewFile *.slice set filetype=systemd
au BufRead,BufNewFile *.busname set filetype=systemd
au BufRead,BufNewFile */systemd/*.path set filetype=systemd
au BufRead,BufNewFile */systemd/*/override.conf set filetype=systemd


" --------------------- Tabs ans status -----------------------------
hi Statusline ctermfg=8 ctermbg=14
hi Tabline ctermbg=8

" Statusline
let g:currentmode={
    \ 'n'  : 'NORMAL ',
    \ 'no' : 'N·Operator Pending ',
    \ 'v'  : 'VISUAL ',
    \ 'V'  : 'V·Line ',
    \ '' : 'V·Block ',
    \ 's'  : 'Select ',
    \ 'S'  : 'S·Line ',
    \ '' : 'S·Block ',
    \ 'i'  : 'INSERT ',
    \ 'R'  : 'RREPLACE ',
    \ 'Rv' : 'V·Replace ',
    \ 'c'  : 'Command ',
    \ 'cv' : 'Vim Ex ',
    \ 'ce' : 'Ex ',
    \ 'r'  : 'Prompt ',
    \ 'rm' : 'More ',
    \ 'r?' : 'Confirm ',
    \ '!'  : 'Shell ',
    \ 't'  : 'Terminal '
    \}

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermfg=037 ctermbg=15'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine ctermfg=013 ctermbg=0'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermfg=214 ctermbg=0'
  else
    exe 'hi! StatusLine ctermfg=006 ctermbg=15'
  endif

  return ''
endfunction

function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    return 'R'
  else
    return ''
endfunction

set laststatus=2
set statusline=
set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=%8*\ [%n]                                " buffernr
set statusline+=%8*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%9*\ %=                                  " Space
" set statusline+=%1*\ %{ALEGetStatusLine()}\              " ALE errors
set statusline+=%8*\ %y\                                 " FileType
set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
set statusline+=%0*\ %3p%%\ %l:%3c\                      " Rownumber/total (%)

hi User1 ctermfg=000 ctermbg=009
hi User2 ctermfg=043
hi User3 ctermfg=010
hi User4 ctermfg=010
hi User5 ctermfg=010
hi User7 ctermfg=010
hi User8 ctermfg=010
hi User9 ctermfg=010

" TABLINE

hi TabModSel ctermbg=172 ctermfg=000
hi TabMod ctermfg=172 ctermbg=8

function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? (bufmodified ? '%#TabModSel#' : '%#TabLineSel#') : (bufmodified ? '%#TabMod#' : '%#TabLine#'))

    let s .= ' ' . tab . ' '
    let s .= (bufname != '' ? fnamemodify(bufname, ':t') . ' ' : '[No Name] ')

  endfor

  let s .= '%#TabLineFill#'

  return s
endfunction

set tabline=%!Tabline()

" XXX: Fix for neovim
hi Visual cterm=reverse ctermfg=16 ctermbg=103 gui=reverse guibg=DarkGray

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
silent execute '!mkdir -p ~/.vim/{swap,backup,undo}'
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set undofile

nmap ,pp :let @+ = expand('%') <CR>


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


nmap ,k :cp<CR>
nmap ,j :cn<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Macros
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let @c='^v$hyA=="'

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

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! ToJSON()
    %!jq .
    set syntax=json
endfunction

function! LargeFile()
    set noshowmatch
    set matchpairs=
    set syntax=off
    set nowrap
    NoMatchParen
endfunction

function! IncreaseRDT()
    set rdt=90000
endfunction

fun! ToggleTrimWhitespace()
    if g:trim_whitespace
        let g:trim_whitespace = 0
    else
        let g:trim_whitespace = 1
    endif
endfun

fun! TrimWhitespace()
    if (line('$') < 8000) && g:trim_whitespace
        let l:save = winsaveview()
        try
            keeppatterns %s/\s\+$//e
        finally
            call winrestview(l:save)
        endtry
    endif
endfun

fun! Jsx()
    if g:jsx_ext_required == 1
        let g:jsx_ext_required = 0
    else
        let g:jsx_ext_required = 1
    endif
    execute ':e %'
endfun

fu! FzfRgCurrWord()
  let currWord = expand('<cword>')
  if len(currWord) > 0
    execute ':Rg '.currWord
  else
    execute ':Rg'
  endif
endfu

fu! FzfSelected()
    let reg_save = getreg('"')
    let regtype_save = getregtype('"')
    let cb_save = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', reg_save, regtype_save)
    let &clipboard = cb_save

    execute ':Rg '.selection
endfu

function! s:getVisualSelection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)

    if len(lines) == 0
        return ""
    endif

    let lines[-1] = lines[-1][:column_end - (&selection == "inclusive" ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]

    return join(lines, "\n")
endfunction

function! DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" show hi group under cursor
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


"""""""""""""""""""""" END """""""""""""""""""""""""""""""""""""""""""""""""""""""
