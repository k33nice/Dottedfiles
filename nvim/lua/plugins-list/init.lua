-- check if packer is installed (~/local/share/nvim/site/pack)
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  if vim.fn.input('Download Packer? (y for yes)') ~= "y" then
    return
  end

  local directory = string.format(
    '%s/site/pack/packer/opt/',
    vim.fn.stdpath('data')
  )

  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(string.format(
    'git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. '/packer.nvim'
  ))

  print(out)
  print('Downloading packer.nvim...')

  return
end

return require("packer").startup(
    function()
        use {'jistr/vim-nerdtree-tabs'} 
        use {'scrooloose/nerdtree'}
        use {'wbthomason/packer.nvim', opt = true}
        use {'lewis6991/gitsigns.nvim'}
        use {'nvim-treesitter/nvim-treesitter'}
        use {'NLKNguyen/papercolor-theme'}
        use {'norcalli/nvim-colorizer.lua'}
        use {'sbdchd/neoformat'}
        use {'neovim/nvim-lspconfig', 'tami5/lspsaga.nvim'}
        use {'hrsh7th/nvim-cmp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path', 'lukas-reineke/cmp-rg', 'hrsh7th/cmp-copilot'}
        use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
        use {'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip'}
        use {'windwp/nvim-autopairs'}
        use {'alvan/vim-closetag'}
        use {'tweekmonster/startuptime.vim'}
        use {'onsails/lspkind-nvim'}
        use {'nvim-lua/popup.nvim'}
        use {'nvim-lua/plenary.nvim'}
        use {'scrooloose/nerdcommenter'}
        use {'junegunn/fzf', run = './install --all'}
        use {'junegunn/fzf.vim'}
        use {'arthurxavierx/vim-caser'}
        use {'tpope/vim-obsession'}
        use {'mhinz/vim-startify'}
        use {'xolox/vim-misc'}
        use {'tpope/vim-surround'}
        use {'google/vim-searchindex'}
        use {'dhruvasagar/vim-table-mode'}
        use {'sgur/vim-editorconfig'}
        use {'wincent/terminus'}
        use {'gyim/vim-boxdraw'}
        use {'dense-analysis/ale'}
        use {'pangloss/vim-javascript'}
        use {'hoob3rt/lualine.nvim'}
        --use {'fatih/vim-go', run = ':GoInstallBinaries'}
        use {'ray-x/go.nvim'}
        use {'junegunn/vim-easy-align'}
        use {'iamcco/markdown-preview.nvim', run = 'cd app & yarn install'}
        use {'rhysd/committia.vim'}
        use {'folke/todo-comments.nvim'}
        use {'williamboman/nvim-lsp-installer'}
        use {'lewis6991/spellsitter.nvim'}
        use {'gennaro-tedesco/nvim-jqx'}
        use {'vim-utils/vim-husk'}
        use {'sindrets/diffview.nvim'}
        use {
            'AckslD/nvim-revJ.lua',
            requires = {'kana/vim-textobj-user', 'sgur/vim-textobj-parameter'},
        }
        use {
            'ojroques/nvim-lspfuzzy',
            requires = {
                {'junegunn/fzf'},
                {'junegunn/fzf.vim'},
            },
        }
        use {'tpope/vim-repeat'}
        use {'jvirtanen/vim-hcl', branch = 'main'}
        use {'ziglang/zig.vim'}
        use {'tpope/vim-dadbod'}
        use {'kristijanhusak/vim-dadbod-ui'}
        use {'tversteeg/registers.nvim'}
        use {'matze/vim-move'}
        use {'github/copilot.vim'}
        -- use {'wookayin/fzf-ripgrep.vim'}
    end
)
