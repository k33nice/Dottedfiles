require 'defaults.settings'
require 'defaults.events'

local cmd = vim.cmd
local g = vim.g

cmd 'colorscheme PaperColor'
-- cmd 'colorscheme tokyonight'
cmd 'filetype plugin on'
cmd 'filetype indent on'
cmd 'syntax enable'
cmd 'syntax on'

vim.api.nvim_exec([[
hi TabModSel ctermbg=172 ctermfg=000 guibg=#df8700 guifg=#000000
hi TabMod ctermfg=172 ctermbg=8 guifg=#df8700 guibg=#808080
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
]], true)

g.mapleader = ','
g.mapleaderlocal = ','
