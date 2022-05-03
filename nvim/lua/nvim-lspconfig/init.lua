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

local function on_attach(client, bufnr)
    map('n', "gd", [[<cmd>lua vim.lsp.buf.definition()<CR>]], opts)
    map('n', "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    map('n', "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    map('n', 'gA', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
    map('v', 'gA', ':<C-U>lua require("lspsaga.codeaction").range_code_action()<CR>', opts)
    map('n', "K", '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
    map('n', "K", '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    map('n', "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    -- map('n', '<C-k>', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', opts)
    -- map('n', "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    map('n', "<leader>rn", "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)
    map('n', "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    map('n', "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    map('n', "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    map('n', "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

end

local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    cmp_tabnine = "[TN]",
    path = "[Path]",
}

local cmp = require'cmp'
cmp.setup {
  preselect = cmp.PreselectMode.None,
  snippet = {
      expand = function(args)
          require('luasnip').lsp_expand(args.body)
      end
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'cmp_tabnine' },
    { name = 'buffer' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'rg' },
  },
  mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
      end,
      ['<S-Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
      end,
      ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = false,
      })
  },
  -- formatting = {
  --     format = function(entry, vim_item)
  --         local menu = source_mapping[entry.source.name]
  --         vim_item.menu = menu
  --         return vim_item
  --     end
  -- },
}

-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

local tabnine = require('cmp_tabnine.config')
tabnine:setup({
    max_lines = 1000;
    max_num_results = 20;
    sort = true;
    run_on_every_keystroke = true;
    snippet_placeholder = '..';
})

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end
    --
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    opts.capabilities = capabilities
    opts.on_attach = on_attach


    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = false,
        update_in_insert = false,
        underline  = false,
    }
)
