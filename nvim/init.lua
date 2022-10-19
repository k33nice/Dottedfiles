local cmd = vim.cmd
local g = vim.g

require 'plugins-list'
require('impatient').enable_profile()
require 'defaults'
require 'mappings'
require 'nvim-lspconfig'

require 'plugins'
require 'utils.funcs'
-- require "pears".setup()
require 'nvim-autopairs'.setup()

require 'colorizer'.setup()
require 'revj'.setup{
    brackets = {first = '([{<', last = ')]}>'}, -- brackets to consider surrounding arguments
    new_line_before_last_bracket = true, -- add new line between last argument and last bracket (only if no last separator)
    add_seperator_for_last_parameter = false, -- if a separator should be added if not present after last parameter
    enable_default_keymaps = false, -- enables default keymaps without having to set them below
    keymaps = {
        operator = '<Leader>o', -- for operator (+motion)
        line = '<Leader>J', -- for formatting current line
        visual = '<Leader>j', -- for formatting visual selection
    },
}
require('lspfuzzy').setup {}

-- TODO(k33nice): enable after fix NERDTree
require('spellsitter').setup{
    enable = true,
    hl = 'SpellBad',
    spellchecker = 'vimfn',
}

g.TerminusCursorShape=0

require 'colorizer'.setup({
  'css';
  'javascript';
  html = { mode = 'background' };
}, { mode = 'foreground' })

-- highlights
cmd("hi LineNr guibg=NONE")
cmd("hi SignColumn guibg=NONE")
cmd("hi VertSplit guibg=NONE")
cmd("hi GitSignsAdd guifg=#81A1C1 guibg=none")
cmd("hi GitSignsChange guifg=#3A3E44 guibg=none")
cmd("hi DiffModified guifg=#81A1C1 guibg=none")
cmd("hi EndOfBuffer guifg=#282c34")
cmd("hi DiffAdd guifg=none guibg=#07330f")
cmd("hi Visual cterm=reverse ctermfg=16 ctermbg=103 gui=reverse guibg=#8787af guifg=#000000")

-- tree folder name , icon color
cmd("hi NvimTreeFolderIcon guifg=#61afef")
cmd("hi NvimTreeFolderName guifg=#61afef")

cmd("hi clear SpellBad")
cmd("hi SpellBad gui=underline cterm=underline")

vim.fn.setenv('FZF_DEFAULT_COMMAND', 'fd --strip-cwd-prefix --type f --follow -H -E ".git/*"')
vim.fn.setenv('FZF_DEFAULT_OPTS', [[--bind ctrl-a:select-all]])
g.fzf_colors = {
   fg      = {'fg', 'Normal'},
   bg      = {'bg', 'Normal'},
   hl      = {'fg', 'Comment'},
   ['fg+'] = {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
   ['bg+'] = {'bg', 'CursorLine', 'CursorColumn'},
   ['hl+'] = {'fg', 'Statement'},
   info    = {'fg', 'PreProc'},
   prompt  = {'fg', 'Conditional'},
   pointer = {'fg', 'Exception'},
   marker  = {'fg', 'Keyword'},
   spinner = {'fg', 'Label'},
   header  = {'fg', 'Comment'},
}

vim.api.nvim_exec([[
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
]], true)

vim.api.nvim_exec([[
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -F %s || true'
  let initial_command = printf(command_fmt, stridx(a:query, "-") == 0 ? a:query: shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
]], true)

vim.cmd([[command! -bang -nargs=* Rg call RipgrepFzf(<q-args>, <bang>0)]])
vim.cmd([[command! -bang -nargs=* Rgf call fzf#vim#grep('rg --column --line-number --no-heading --color=always -F '.shellescape(<q-args>), 1, <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)]])


cmd("cnoreabbrev rg Rg ")

cmd("silent execute '!mkdir -p ~/.vim/sessions'")
vim.api.nvim_exec([[
let g:session_path = $HOME . '/.vim/sessions/' . substitute(expand('%:p:h'), '[/ ]', '_', 'g')

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

aug sess
  au!
  au VimEnter * nested call StartSess()
  au BufEnter * nested call RestoreSess()
aug END

]], true)

vim.api.nvim_exec([[
aug vim_javascript
au!
au BufEnter *.js,*.jsx hi! link jsThis javaScriptIdentifier
au BufEnter *.js,*.jsx hi! link jsGlobalObjects Global
aug END
]], true)

vim.api.nvim_exec([[
let &colorcolumn=join(range(121,999),",")
highlight ColorColumn ctermbg=235 guibg=#262626
highlight Pmenu ctermbg=NONE guibg=NONE
" highlight Pmenu ctermbg=235 guibg=#262626
]], true)

vim.api.nvim_exec([[
au BufEnter * hi DiffDelete ctermbg=none guibg=none
au BufEnter * hi ALEErrorSign ctermbg=none guibg=none ctermfg=125 guifg=#af005f
]], true)

