local map = require 'utils.funcs'.map
local options = {silent = true, noremap = false}

map('n|x', 'ga', '<Plug>(EasyAlign)', options)
