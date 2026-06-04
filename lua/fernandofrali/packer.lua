-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    -- 	config = function()
    -- 		vim.cmd('colorscheme rose-pine')
    -- 	end
  })

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Theme
  use("nyoom-engineering/oxocarbon.nvim")

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate', branch = 'main' })
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('christoomey/vim-tmux-navigator')
  use('nvim-tree/nvim-tree.lua')
  use('nvim-tree/nvim-web-devicons')
  use('nvim-neotest/nvim-nio')
  use('nvimtools/none-ls.nvim', { requires = 'nvimtools/none-ls-extras.nvim' })
  use('nvimtools/none-ls-extras.nvim')
  use('mhartington/formatter.nvim')
  use('NvChad/nvim-colorizer.lua')
  use('folke/todo-comments.nvim', { requires = 'nvim-lua/plenary.nvim' })
  use('numToStr/Comment.nvim')
  use("supermaven-inc/supermaven-nvim")
  use("nvim-lualine/lualine.nvim")
  use("folke/noice.nvim")
  use("antosha417/nvim-lsp-file-operations")
  use("andreasvc/vim-256noir")
  use("jackplus-xyz/binary.nvim")
  use {
    "jesseleite/nvim-noirbuddy",
    requires = { "tjdevries/colorbuddy.nvim" }
  }
  use("OmniSharp/omnisharp-vim")
  use("rktjmp/lush.nvim")
  use("zenbones-theme/zenbones.nvim")

  -- Debuggers
  use('mfussenegger/nvim-dap')
  use('rcarriga/nvim-dap-ui', { requires = 'mfussenegger/nvim-dap' })
  use("jay-babu/mason-nvim-dap.nvim")
  use('mxsdev/nvim-dap-vscode-js', { requires = 'mfussenegger/nvim-dap' })
  use('leoluz/nvim-dap-go')
  use('nvim-java/nvim-java')
  use {
    'JavaHello/spring-boot.nvim',
    commit = '218c0c26c14d99feca778e4d13f5ec3e8b1b60f0',
  }
  use('MunifTanjim/nui.nvim')

  -- LSP Support
  use('neovim/nvim-lspconfig')
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-nvim-lua')
  use('hrsh7th/cmp-nvim-lsp')
  use('L3MON4D3/LuaSnip')
  use('saadparwaiz1/cmp_luasnip')
  use('rafamadriz/friendly-snippets')
end)
