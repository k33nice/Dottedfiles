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
g.ale_linters_ignore = {go = { 'golint' } }
g.ale_linters = {
    json = {'cspell', 'jq', 'jsonlint', 'spectral'},
    go = {'golangci-lint', 'gofmt', 'gopls', 'govet', 'gofumpt'},
    rust = {'analyzer', 'cargo', 'rls', 'cspell'}
}
g.ale_go_gopls_executable = 'gopls'
g.ale_go_gopls_options = '--mode stdio'
g.ale_hover_cursor = 0
g.ale_rust_cargo_use_clippy = 1
g.ale_rust_analyzer_executable = 'rustup run nightly rust-analyzer'

map('n', '<C-k>', '<Plug>(ale_previous_wrap)', {silent=true,noremap=false})
map('n', '<C-j>', '<Plug>(ale_next_wrap)', {silent=true,noremap=false})

vim.api.nvim_exec([[
aug ale_cspell
au!
au BufEnter * if !exists('b:cspell_options') | let b:ale_cspell_options = '--language-id '.&filetype | endif
aug END
]], true)
