local map = require('utils.funcs').map
local fzf_cur_word = require('utils.funcs').fzf_cur_word

-- open terminals  
map("n", "<C-b>" , [[<cmd> vnew term://bash<CR>]]) -- split term vertically , over the right  

map("n", "<leader>w", [[<Cmd> w<CR>]])

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.smart_s_tab()', {expr = true, noremap = true})

vim.api.nvim_exec([[
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

nnoremap <silent> ,s :call FzfRgCurrWord()<CR>
vnoremap <silent> ,s :call FzfSelected()<CR>

function! GetSelectedText()
  let l:old_reg = getreg('"')
  let l:old_regtype = getregtype('"')
  norm gvy
  let l:ret = getreg('"')
  call setreg('"', l:old_reg, l:old_regtype)
  exe "norm \<Esc>"
  return l:ret
endfunction

vnoremap <silent> * :call setreg("/", substitute(GetSelectedText(), '_s\+',  '\_s\+', 'g'))<Cr>n

vnoremap <silent> # :call setreg("?", substitute(GetSelectedText(), '_s+','\_s\+', 'g'))<Cr>n

]], true)

map("n", "<M-f>", [[<cmd> FZF<CR>]], {silent=true})
map("n", "<M-q>", [[<cmd> call fzf#run({'source': 'fd --type f -HI', 'sink': 'tabedit'})<CR>]])

map("n", "<leader><space>", [[<cmd> noh<cr>]])

map('n|v', '<leader>p', '"+p')
map('n|v', '<leader>P', '"+P')

map('n|v', '<leader>y', '"+y')
map('n', '<leader>Y', '"+yg_')
map('n', '<leader>yy', '"+yy')

map('n', '<leader>lp', '[v')

map('n', 'gl', '<cmd> exe "tabn ".g:lasttab<CR>')
map('n', '<leader>j', '<cmd> cn<CR>')
map('n', '<leader>k', '<cmd> cp<CR>')

vim.cmd([[
command! -bang Tabcloseright call v:lua.TabCloseRight('')
command! -bang Tabcloseleft call v:lua.TabCloseLeft('')
]], true)

map('n', '<leader>.', [[<cmd> call v:lua.TabCloseRight('')<CR>]])
map('n', '<leader>m', [[<cmd> call v:lua.TabCloseLeft('')<CR>]])

map('n', '<leader>dd', [[<cmd> call v:lua.DeleteHiddenBuffers()<CR>]])
map('n', '<leader>sp', [[<cmd> :setlocal spell!<CR>]])
