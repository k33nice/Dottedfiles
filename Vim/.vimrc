set runtimepath+=~/.vim_runtime
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim_runtime/bundle/Vundle.vim
 call vundle#begin()
 " alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.vim_runtime/bundle')

 " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'xero/sourcerer.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'jelera/vim-javascript-syntax'

call vundle#end()            " required
filetype plugin indent on    " required

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

" ==============================NERDTree======================================================
autocmd vimenter * NERDTree
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <F3> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set encoding=utf8
set list lcs=trail:·,tab:--

set number

syntax enable
syntax on
set t_Co=256
set term=xterm-256color
set background=dark
"colorscheme peaksea
colorscheme spacegray
"colorscheme distinguished
"colorscheme dracula


set nowrap " kikoo (lol)"

" NERDTress File highlighting
 function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
   exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
   endfunction

   call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
   call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
   call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
   call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
   call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
   call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
   call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
   call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
   call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
   call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
   call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
   call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
   call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
" END

let g:multi_cursor_start_key='<F6>'
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

set hlsearch!
nnoremap <F4> :set hlsearch!<CR>

set tabstop=4 shiftwidth=4 expandtab

nnoremap Q <nop>

let g:ycm_global_ycm_extra_conf = '~/.vim_runtime/sources_non_forked/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

map <C-c> "+y
"map <C-c> "*y
map <C-v> "+p
map <C-v> "*p
inoremap <C-v> <esc>"*]p:set nopaste<cr>

" NERDTree show hidden files
let NERDTreeShowHidden=1
" Git Gutter
let g:gitgutter_enabled=1

" Indent guiges settings
set shiftwidth=4
"set background=dark
let g:indent_guides_auto_colors=0

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgray
let g:indent_guides_color_change_percent=90

let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_exclude_filetypes=['help', 'nerdtree']


noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>
