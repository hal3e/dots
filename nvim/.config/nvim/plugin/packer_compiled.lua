-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/hal3e/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/hal3e/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/hal3e/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/hal3e/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/hal3e/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
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
  LuaSnip = {
    loaded = true,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["better-escape.nvim"] = {
    config = { "\27LJ\2\2X\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\2\ftimeout\3È\1\fmapping\ann\nsetup\18better_escape\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/opt/better-escape.nvim",
    url = "https://github.com/max397574/better-escape.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\0022\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\23plugins.bufferline\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  catppuccin = {
    loaded = true,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\2.\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\19plugins.feline\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/opt/feline.nvim",
    url = "https://github.com/freddiehaddad/feline.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\0028\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\2W\0\4\t\1\4\0\14\14\0\3\0X\4\1€4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\5\0\0\18\6\1\0\18\a\2\0\18\b\3\0B\4\5\1K\0\1\0\0À\bset\vkeymap\bvim\vbuffer3\0\0\2\1\2\0\5-\0\0\0009\0\0\0005\1\1\0B\0\2\1K\0\1\0\0\0\1\0\1\fpreview\2\14next_hunkg\1\0\2\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2€'\0\3\0002\0\a€6\0\0\0009\0\4\0003\1\5\0B\0\2\1'\0\6\0002\0\0€L\0\2\0L\0\2\0\1À\r<Ignore>\0\rschedule\a]c\tdiff\awo\bvim3\0\0\2\1\2\0\5-\0\0\0009\0\0\0005\1\1\0B\0\2\1K\0\1\0\0\0\1\0\1\fpreview\2\14prev_hunkg\1\0\2\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2€'\0\3\0002\0\a€6\0\0\0009\0\4\0003\1\5\0B\0\2\1'\0\6\0002\0\0€L\0\2\0L\0\2\0\1À\r<Ignore>\0\rschedule\a[c\tdiff\awo\bvim1\0\0\2\1\2\0\5-\0\0\0009\0\0\0005\1\1\0B\0\2\1K\0\1\0\1À\1\0\1\tfull\2\15blame_line™\5\1\1\b\0#\0I6\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0'\4\4\0'\5\5\0003\6\6\0005\a\a\0B\3\5\1\18\3\2\0'\4\4\0'\5\b\0003\6\t\0005\a\n\0B\3\5\1\18\3\2\0005\4\v\0'\5\f\0'\6\r\0B\3\4\1\18\3\2\0005\4\14\0'\5\15\0'\6\16\0B\3\4\1\18\3\2\0'\4\4\0'\5\17\0009\6\18\1B\3\4\1\18\3\2\0'\4\4\0'\5\19\0009\6\20\1B\3\4\1\18\3\2\0'\4\4\0'\5\15\0009\6\21\1B\3\4\1\18\3\2\0'\4\4\0'\5\22\0009\6\23\1B\3\4\1\18\3\2\0'\4\4\0'\5\24\0003\6\25\0B\3\4\1\18\3\2\0'\4\4\0'\5\26\0009\6\27\1B\3\4\1\18\3\2\0'\4\4\0'\5\28\0009\6\29\1B\3\4\1\18\3\2\0'\4\4\0'\5\30\0009\6\31\1B\3\4\1\18\3\2\0005\4 \0'\5!\0'\6\"\0B\3\4\0012\0\0€K\0\1\0#:<C-U>Gitsigns select_hunk<CR>\aih\1\3\0\0\6o\6x\19toggle_deleted\15<leader>td\rdiffthis\15<leader>hd\30toggle_current_line_blame\15<leader>tb\0\15<leader>hb\17preview_hunk\15<leader>hp\17reset_buffer\20undo_stage_hunk\15<leader>hu\17stage_buffer\15<leader>hS\29:Gitsigns reset_hunk<CR>\15<leader>hr\1\3\0\0\6n\6v\29:Gitsigns stage_hunk<CR>\15<leader>hs\1\3\0\0\6n\6v\1\0\1\texpr\2\0\a[c\1\0\1\texpr\2\0\a]c\6n\0\rgitsigns\vloaded\fpackageP\1\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0003\2\3\0=\2\5\1B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\rgitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\2{\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\2\25show_current_context\2#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["leap.nvim"] = {
    config = { "\27LJ\2\2A\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25add_default_mappings\tleap\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/opt/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lsp_lines.nvim"] = {
    config = { "\27LJ\2\0027\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14lsp_lines\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/opt/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/hal3e/nord.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\0020\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\21plugins.nvim-cmp\frequire\0" },
    loaded = true,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\2Ã\1\0\0\3\0\b\0\f6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0B\0\3\0016\0\5\0009\0\6\0'\1\a\0B\0\2\1K\0\1\0\28ColorizerAttachToBuffer\bcmd\bvim\1\0\t\vhsl_fn\2\tmode\15background\nnames\2\bcss\1\vRRGGBB\2\vrgb_fn\2\rRRGGBBAA\2\vcss_fn\1\bRGB\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    commands = { "CommentToggle" },
    config = { "\27LJ\2\2a\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\2\20create_mappings\1\18comment_empty\1\nsetup\17nvim_comment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/opt/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-lspconfig"] = {
    after = { "lsp_lines.nvim", "rust-tools.nvim", "feline.nvim" },
    config = { "\27LJ\2\0026\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\27plugins.nvim-lspconfig\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-scrollbar"] = {
    config = { "\27LJ\2\0027\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14scrollbar\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/opt/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\2?\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/opt/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeFocus" },
    config = { "\27LJ\2\0021\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\22plugins.nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-context" },
    config = { "\27LJ\2\2{\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1B\0\2\1K\0\1\0\14highlight\1\0\0\1\0\2\21use_languagetree\2\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-web-devicons"] = {
    after = { "bufferline.nvim" },
    config = { "\27LJ\2\2-\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\18plugins.icons\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\2\2¢\2\0\0\a\0\17\0\0276\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\15\0005\2\5\0006\3\0\0'\4\3\0B\3\2\0029\3\4\3=\3\4\0026\3\0\0'\4\3\0B\3\2\0029\3\6\3=\3\6\0025\3\f\0005\4\n\0005\5\a\0005\6\b\0=\6\t\5=\5\v\4=\4\r\3=\3\14\2=\2\16\1B\0\2\1K\0\1\0\vserver\1\0\0\rsettings\18rust-analyzer\1\0\0\ncheck\1\0\0\14extraArgs\1\5\0\0\n--all\a--\a-W\16clippy::all\1\0\1\fcommand\vclippy\14on_attach\1\0\0\17capabilities\27plugins.nvim-lspconfig\nsetup\15rust-tools\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/opt/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["spellsitter.nvim"] = {
    config = { "\27LJ\2\0029\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16spellsitter\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/opt/spellsitter.nvim",
    url = "https://github.com/lewis6991/spellsitter.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\2«\1\0\0\5\0\n\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\b\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2=\2\t\1B\0\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\1\0\2\n<C-n>\24move_selection_next\n<C-e>\28move_selection_previous\nsetup\14telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\2Þ\3\0\0\5\0\27\0!6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\21\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0005\4\r\0=\4\5\3=\3\14\0025\3\15\0005\4\16\0=\4\5\3=\3\17\0025\3\18\0005\4\19\0=\4\5\3=\3\20\2=\2\22\0015\2\24\0005\3\23\0=\3\25\2=\2\26\1B\0\2\1K\0\1\0\vcolors\fwarning\1\0\0\1\2\0\0\23DiagnosticSignWarn\rkeywords\1\0\0\tNOTE\1\2\0\0\tINFO\1\0\2\ncolor\thint\ticon\tïƒ¾ \tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\1\ticon\tï…‘ \tWARN\1\3\0\0\fWARNING\bXXX\1\0\2\ncolor\fwarning\ticon\tïƒ¾ \tHACK\1\0\2\ncolor\fwarning\ticon\tï…† \tTODO\1\0\2\ncolor\tinfo\ticon\tï…Š \bFIX\1\0\0\balt\1\5\0\0\nFIXME\bBUG\nFIXIT\nISSUE\1\0\2\ncolor\nerror\ticon\tï…‹ \nsetup\18todo-comments\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hal3e/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\0026\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\27plugins.nvim-lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\2{\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1B\0\2\1K\0\1\0\14highlight\1\0\0\1\0\2\21use_languagetree\2\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\0020\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\21plugins.nvim-cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\0028\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter-context ]]
vim.cmd [[ packadd nord.nvim ]]
vim.cmd [[ packadd nvim-web-devicons ]]

-- Config for: nvim-web-devicons
try_loadstring("\27LJ\2\2-\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\18plugins.icons\frequire\0", "config", "nvim-web-devicons")

vim.cmd [[ packadd bufferline.nvim ]]

-- Config for: bufferline.nvim
try_loadstring("\27LJ\2\0022\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\23plugins.bufferline\frequire\0", "config", "bufferline.nvim")

vim.cmd [[ packadd leap.nvim ]]

-- Config for: leap.nvim
try_loadstring("\27LJ\2\2A\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25add_default_mappings\tleap\frequire\0", "config", "leap.nvim")

vim.cmd [[ packadd lsp_lines.nvim ]]

-- Config for: lsp_lines.nvim
try_loadstring("\27LJ\2\0027\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14lsp_lines\frequire\0", "config", "lsp_lines.nvim")

vim.cmd [[ packadd rust-tools.nvim ]]

-- Config for: rust-tools.nvim
try_loadstring("\27LJ\2\2¢\2\0\0\a\0\17\0\0276\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\15\0005\2\5\0006\3\0\0'\4\3\0B\3\2\0029\3\4\3=\3\4\0026\3\0\0'\4\3\0B\3\2\0029\3\6\3=\3\6\0025\3\f\0005\4\n\0005\5\a\0005\6\b\0=\6\t\5=\5\v\4=\4\r\3=\3\14\2=\2\16\1B\0\2\1K\0\1\0\vserver\1\0\0\rsettings\18rust-analyzer\1\0\0\ncheck\1\0\0\14extraArgs\1\5\0\0\n--all\a--\a-W\16clippy::all\1\0\1\fcommand\vclippy\14on_attach\1\0\0\17capabilities\27plugins.nvim-lspconfig\nsetup\15rust-tools\frequire\0", "config", "rust-tools.nvim")

vim.cmd [[ packadd feline.nvim ]]

-- Config for: feline.nvim
try_loadstring("\27LJ\2\2.\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\19plugins.feline\frequire\0", "config", "feline.nvim")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'CommentToggle', function(cmdargs)
          require('packer.load')({'nvim-comment'}, { cmd = 'CommentToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-comment'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('CommentToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NvimTreeToggle', function(cmdargs)
          require('packer.load')({'nvim-tree.lua'}, { cmd = 'NvimTreeToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-tree.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NvimTreeToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Telescope', function(cmdargs)
          require('packer.load')({'telescope.nvim'}, { cmd = 'Telescope', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'telescope.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Telescope ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NvimTreeFocus', function(cmdargs)
          require('packer.load')({'nvim-tree.lua'}, { cmd = 'NvimTreeFocus', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-tree.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NvimTreeFocus ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'better-escape.nvim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'packer.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'indent-blankline.nvim', 'nvim-scrollbar', 'nvim-surround', 'spellsitter.nvim', 'gitsigns.nvim', 'todo-comments.nvim', 'nvim-colorizer.lua'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
