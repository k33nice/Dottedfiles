" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/k33nice/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/k33nice/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/k33nice/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/k33nice/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/k33nice/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ale = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["committia.vim"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/committia.vim"
  },
  ["compe-tabnine"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/compe-tabnine"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  fzf = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  nerdcommenter = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  nerdtree = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/nerdtree"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-jqx"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/nvim-jqx"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["papercolor-theme"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/papercolor-theme"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["spellsitter.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16spellsitter\frequire\0" },
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/spellsitter.nvim"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/startuptime.vim"
  },
  terminus = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/terminus"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["vim-boxdraw"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/vim-boxdraw"
  },
  ["vim-caser"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/vim-caser"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-editorconfig"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/vim-editorconfig"
  },
  ["vim-go"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/vim-go"
  },
  ["vim-husk"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/vim-husk"
  },
  ["vim-javascript"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/vim-javascript"
  },
  ["vim-misc"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/vim-misc"
  },
  ["vim-nerdtree-tabs"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/vim-nerdtree-tabs"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/vim-obsession"
  },
  ["vim-searchindex"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/vim-searchindex"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/Users/k33nice/.local/share/nvim/site/pack/packer/start/vim-table-mode"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: spellsitter.nvim
time([[Config for spellsitter.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16spellsitter\frequire\0", "config", "spellsitter.nvim")
time([[Config for spellsitter.nvim]], false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
