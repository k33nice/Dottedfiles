local g = vim.g
local map = require('utils.funcs').map

g.NERDSpaceDelims = 1
g.NERDTrimTrailingWhitespace = 1
g.NERDRemoveExtraSpaces = 1
g.NERDCompactSexyComs = 1
g.NERDDefaultAlign = 'left'
g.NERDTreeWinPos = "right"
g.NERDTreeMinimalUI = 1
g.NERDTreeDirArrows = 1

map('n', '<F3>', [[<cmd> NERDTreeToggle <CR>]])
