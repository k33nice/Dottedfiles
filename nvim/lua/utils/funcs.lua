local npairs = require('nvim-autopairs')
local api = vim.api

local function t(str)
  return api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
  return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

function _G.smart_s_tab()
  return vim.fn.pumvisible() == 1 and t'<C-p>' or t'<S-Tab>'
end

function _G.DeleteHiddenBuffers()
    vim.cmd([[
        let tpbl=[]
        call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
        for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
            silent execute 'bwipeout' buf
        endfor
    ]], true)
end

function _G.completion_confirm()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return vim.fn["compe#confirm"](npairs.esc("<cr>"))
    else
      return npairs.esc("<cr>")
    end
  else
    return npairs.autopairs_cr()
  end
end

function _G.TabCloseRight(bang)
    local cur = vim.fn.tabpagenr()
    while cur < vim.fn.tabpagenr('$') do
        vim.cmd([[exe 'tabclose']]..bang..' '..(cur + 1), true)
    end
end

function _G.TabCloseLeft(bang)
    while vim.fn.tabpagenr() > 1 do
        vim.cmd([[exe 'tabclose']]..bang..[[ 1]], true)
    end
end

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    local mods
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    for m in mode:gmatch('%a') do
        api.nvim_set_keymap(m, lhs, rhs, options)
    end
end

local function au(definitions)
    for group_name, definition in pairs(definitions) do
        api.nvim_command('augroup '..group_name)
        api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
            api.nvim_command(command)
        end
        api.nvim_command('augroup END')
    end
end

return {
    map = map,
    au = au,
}
