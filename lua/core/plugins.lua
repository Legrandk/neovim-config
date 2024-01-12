local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  -- My plugins here
  -- use "foo1/bar1.nvim"
  -- use "foo2/bar2.nvim"

  -- Dashboard
  use {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup {
        --config
      }
    end,
    requires = {"nvim-tree/nvim-web-devicons"}
  }

  -- Tabbar
  -- use "romgrk/barbar.nvim" -- requires nvim-web-devicons

  -- WhichKey
  -- Lua
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use "ellisonleao/gruvbox.nvim"
  use "nvim-tree/nvim-tree.lua"
  use "nvim-tree/nvim-web-devicons"
  use "nvim-lualine/lualine.nvim"

  -- Gitblame: https://github.com/kessejones/git-blame-line.nvim
  use "kessejones/git-blame-line.nvim"

  -- https://github.com/numToStr/Comment.nvim
  use "numToStr/Comment.nvim"

  -- Wraps the code blocks with ┊ char
  use "lukas-reineke/indent-blankline.nvim"

  -- Completion
  use "hrsh7th/nvim-cmp" -- main plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  --use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-nvim-lsp" -- LSP integration
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip"

  -- Folding
  -- use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  -- Snippets (completions)
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- [[ Highlight on yank ]]
  -- See `:help vim.highlight.on_yank()`
  local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
  })

  -- syntax highlighting
  use "nvim-treesitter/nvim-treesitter"

  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  use { "ibhagwan/fzf-lua",
    -- optional for icon support
    requires = { "nvim-tree/nvim-web-devicons" }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
