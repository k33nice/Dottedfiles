local map = require 'utils.funcs'.map
local g = vim.g

g.ale_set_highlights = 0
g.ale_sign_error = '✖'
g.ale_sign_warning = '⚠'
g.ale_javascript_eslint_executable  = 'eslint'
g.ale_sign_column_always = 1
g.ale_set_quickfix = 0
g.ale_set_loclist = 0
g.ale_max_signs = 100
g.ale_echo_delay = 25
g.ale_lint_delay = 1000
-- g.ale_linters = {'go'= { 'gofmt', 'golint', 'go vet', 'go build' }, 'php'= { 'php', 'phpcs', 'phpmd' }}
g.ale_linters = { json = {'cspell', 'jq', 'jsonlint', 'spectral'} }
g.ale_go_gopls_executable = 'gopls'
g.ale_go_gopls_options = '--mode stdio'
g.ale_hover_cursor = 0

map('n', '<C-k>', '<Plug>(ale_previous_wrap)', {silent=true,noremap=false})
map('n', '<C-j>', '<Plug>(ale_next_wrap)', {silent=true,noremap=false})
