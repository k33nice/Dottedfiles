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
    map('n', "K", '<cmd>Lspsaga hover_doc<cr>', opts)
    -- map('n', "K", '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    map('n', "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    -- map('n', '<C-k>', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', opts)
    -- map('n', "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    map('n', "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)
    map('n', "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    map('n', "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    map('n', "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    map('n', "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

end

local source_mapping = {
    copilot = "[Copilot]",
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
    { name = 'copilot'},
    { name = 'nvim_lsp' },
    -- { name = 'cmp_tabnine' },
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
  formatting = {
      format = function(entry, vim_item)
          local menu = source_mapping[entry.source.name]
          vim_item.menu = menu
          return vim_item
      end
  },
}

-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

-- local tabnine = require('cmp_tabnine.config')
-- tabnine:setup({
--     max_lines = 1000;
--     max_num_results = 20;
--     sort = true;
--     run_on_every_keystroke = true;
--     snippet_placeholder = '..';
-- })

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.setup{}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in ipairs(lsp_installer.get_installed_servers()) do
    lspconfig[server.name].setup{
        capabilities = capabilities,
        on_attach = on_attach
    }
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = false,
        update_in_insert = false,
        underline  = false,
    }
)
