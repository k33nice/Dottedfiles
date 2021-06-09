local au = require('utils.funcs').au

vim.g.lasttab = 1

local autocmds = {
    tabSwitch = {
        {'TabLeave', '*', 'let g:lasttab = tabpagenr()'}
    },
}

au(autocmds)
