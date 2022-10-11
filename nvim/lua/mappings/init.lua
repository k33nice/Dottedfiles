local map = require('utils.funcs').map
local fzf_cur_word = require('utils.funcs').fzf_cur_word
local remap = vim.api.nvim_set_keymap

map("n", "<leader>w", [[<Cmd> w<CR>]])
map("n", "<leader>ts", [[<Cmd> :lua require('gitsigns').detach()<CR>]])
map("n", "<leader>hx", [[<Cmd> call v:lua.HexEdit()<CR>]])
map("n", "<leader>hq", [[<Cmd> call v:lua.HexEditRev()<CR>]])

remap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
remap('i', '<S-Tab>', 'v:lua.smart_s_tab()', {expr = true, noremap = true})
-- remap('i' , '<CR>','v:lua.completion_confirm()', {expr = true , noremap = true})


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
imap <silent><expr> <M-e> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<M-e>'

]], true)

map("n", "<M-f>", [[<cmd> FZF<CR>]], {silent=true})
map("n", "<M-q>", [[<cmd> call fzf#run({'source': 'fd --type f -HI', 'sink': 'tabedit'})<CR>]])

map("n", "<leader><space>", [[<cmd> noh<cr>]])

map('n|v', '<leader>p', '"+p')
map('n|v', '<leader>P', '"+P')

map('n|v', '<leader>y', '"+y')
map('n|v', '<D-c>', '"+y')
map('n', '<leader>Y', '"+yg_')
map('n', '<leader>yy', '"+yy')

map('n', '<leader>lp', '[v')

map('n', 'gl', 'g<TAB>')
map('n', '<leader>j', '<cmd> cn<CR>')
map('n', '<leader>k', '<cmd> cp<CR>')

vim.cmd([[
command! -bang Tabcloseright call v:lua.TabCloseRight('')
command! -bang Tabcloseleft call v:lua.TabCloseLeft('')
]], true)

map('n', '<leader>.', [[<cmd> call v:lua.TabCloseRight('')<CR>]])
map('n', '<leader>m', [[<cmd> call v:lua.TabCloseLeft('')<CR>]])

function _G.getVisualSelection()
    vim.cmd([[
        let [line_start, column_start] = getpos("'<")[1:2]
        let [line_end, column_end] = getpos("'>")[1:2]
        let lines = getline(line_start, line_end)

        if len(lines) == 0
            return ""
        endif

        let lines[-1] = lines[-1][:column_end - (&selection == "inclusive" ? 1 : 2)]
        let lines[0] = lines[0][column_start - 1:]

        return join(lines, "\n")
    ]], true)
end

-- map('v', '<leader>f', [[<cmd> FZF -q <C-R>=expand('<SID>')v:lua.getVisualSelection()<CR><CR>]])

map('n', '<leader>dd', [[<cmd> call v:lua.DeleteHiddenBuffers()<CR>]])
map('n', '<leader>sp', [[<cmd> :setlocal spell!<CR>]])
-- map('i', '<C-h>', '<C-o>h')
-- map('i', '<C-k>', '<C-o>k')
-- map('i', '<C-l>', '<C-o>l')
-- map('i', '<C-j>', '<C-o>j')
map('n|v', '<space>', '%')
map('n', '<leader>pp', [[:let @+ = expand('%') <CR>]]) -- Copy file path
map('v', '<m-c>', [[:s/\%V\x\x/\=nr2char(printf("%d", "0x".submatch(0)))/g<cr><c-l>`<]])
map('v', '<m-/>', [[:s/\%V/g<LEFT><LEFT>]])

map('c', '<C-a>', '<Home>')
map('c', '<C-d>', '<Del>')
map('c', '<C-e>', '<End>')
map('c', '<M-f>', '<S-Right>')
map('c', '<M-b>', '<S-Left>')
map('n|v', '<leader>jq', '<cmd> :%!jq . <CR>')
map('n', 'gp', '`[v`]')
map('n', [[\]], ',')
map('n', '<leader>pu', [[<cmd> PackerSync<CR>]])
map('n|i', '<C-]>', [[<Plug>(copilot-dismiss)]])
