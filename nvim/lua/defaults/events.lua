local au = require('utils.funcs').au

local autocmds = {
    options = {"FileType * setlocal formatoptions-=o"},
    hcl = {"BufNewFile,BufRead *.nomad set syntax=hcl"},
}

au(autocmds)
