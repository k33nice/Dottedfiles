local cmd = vim.cmd
local g = vim.g

require 'plugins-list'
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
    new_line_before_last_bracket = true, -- add new line between last argument and last bracket (only if no last seperator)
    add_seperator_for_last_parameter = false, -- if a seperator should be added if not present after last parameter
    enable_default_keymaps = false, -- enables default keymaps without having to set them below
    keymaps = {
        operator = '<Leader>o', -- for operator (+motion)
        line = '<Leader>J', -- for formatting current line
        visual = '<Leader>j', -- for formatting visual selection
    },
}
require('lspfuzzy').setup {}

-- TODO(k33nice): enable after fix NERDTree
-- require('spellsitter').setup{
--     enable = true,
--     hl = 'SpellBad',
--     spellchecker = 'vimfn',
-- }

g.TerminusCursorShape=0

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
vim.fn.setenv('FZF_DEFAULT_OPTS', [[--bind alt-q:select-all+accept]])
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

vim.cmd([[command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always -F '.shellescape(<q-args>), 1, <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)]])


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

g.UltiSnipsExpandTrigger="<M-e>"
g.UltiSnipsJumpForwardTrigger="<M-j>"
g.UltiSnipsJumpBackwardTrigger="<M-k>"

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
]], true)


vim.api.nvim_exec([[
au BufEnter * hi DiffDelete ctermbg=none guibg=none
au BufEnter * hi ALEErrorSign ctermbg=none guibg=none ctermfg=125 guifg=#af005f
]], true)

vim.api.nvim_exec([[
aug hcl
au!
au BufNewFile,BufRead *.nomad set syntax=hcl
aug END
]], true)