vim.cmd [[packadd nvim-lspconfig]]
local saga = require 'lspsaga'
local lspconfig = require 'lspconfig'

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opts = {noremap = true, silent = true}

map('n', "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
map('n', "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map('n', "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map('n', 'gA', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
map('v', 'gA', ':<C-U>lua require("lspsaga.codeaction").range_code_action()<CR>', opts)
map('n', "K", '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
map('n', "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map('n', 'si', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', opts)
map('n', "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map('n', "<space>rn", "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)
map('n', "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
map('n', "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
map('n', "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
map('n', "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    spell = true;
    tabnine = true;
  };
}

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = false,
    }
)
