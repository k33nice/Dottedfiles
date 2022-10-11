local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= "o" then
        scopes["o"][key] = value
    end
end

vim.g.completion_confirm_key = ""

--opt("o", "colorscheme", "PaperColor")
opt("o", "hidden", true)
opt("o", "ignorecase", true)
opt("o", "splitbelow", true)
opt("o", "splitright", true)
opt("o", "termguicolors", true)
opt("w", "number", true)
opt("o", "numberwidth", 4)

opt("o", "mouse", "nicrv") -- a

opt("w", "signcolumn", "yes")
opt("o", "cmdheight", 1)

opt("o", "updatetime", 250) -- update interval for gitsigns 

-- for indenline
opt("b", "expandtab", true )
opt("b", "shiftwidth", 2 )

opt('o', 'completeopt', 'menuone,noinsert,noselect')
-- opt('o', 'shortmess', 'f') -- Sc
vim.api.nvim_exec([[
set shortmess+=c
]], true)
opt('o', 'ttyfast', true)

opt('o', 'path', '**')
-- opt('o', 'guicursor', '')
opt('o', 'tm', 500)

opt('o', 'laststatus', 2)
opt('o', 'showtabline', 3)

opt('o', 'expandtab', true)

opt('o', 'smarttab', true)
opt('o', 'shiftwidth', 4)
opt('o', 'tabstop', 4)

opt('o', 'lbr', true)
opt('o', 'tw', 500)

opt('o', 'ai', true)
opt('o', 'si', true)
opt('o', 'wrap', true)

opt('o', 'splitbelow', true)
opt('o', 'splitright', true)

opt('o', 'list', true)
opt('o', 'listchars', [[tab:| ,trail:·,nbsp:·]])
opt('o', 'langmap', [[ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\;'zxcvbnm\,.~QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>]])

opt('o', 'history', 700)
opt('o', 'updatetime', 200)
opt('o', 'so', 7)

opt('o', 'wildmenu', true)

opt('o', 'ruler', true)

opt('o', 'nu', true)
opt('o', 'cmdheight', 2)

opt('o', 'hid', true)

opt('o', 'backspace', 'eol,start,indent')
opt('o', 'whichwrap', '<,>,h,l')

opt('o', 'ignorecase', true)

opt('o', 'smartcase', true)

opt('o', 'hlsearch', true)

opt('o', 'incsearch', true)

opt('o', 'lazyredraw', true)

opt('o', 'magic', true)

opt('o', 'showmatch', true)

opt('o', 'mat', 2)

opt('b', 'spelllang', 'en_us,ru_ru')
opt('w', 'spell', false)

local M = {}

function M.is_buffer_empty()
    -- Check whether the current buffer is empty
    return vim.fn.empty(vim.fn.expand("%:t")) == 1
end

function M.has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end

return M
