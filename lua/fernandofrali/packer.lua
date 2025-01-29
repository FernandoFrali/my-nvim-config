-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

--   use({ 'rose-pine/neovim',
--   	as = 'rose-pine',
-- 	config = function()
-- 		vim.cmd('colorscheme rose-pine')
-- 	end
-- })

  use {
	  'nvim-telescope/telescope.nvim', 
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Theme
  -- use("sainnhe/sonokai")
  use("nyoom-engineering/oxocarbon.nvim")

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('christoomey/vim-tmux-navigator')
  use('nvim-tree/nvim-tree.lua')
  use('nvim-tree/nvim-web-devicons')
  use('mfussenegger/nvim-dap')
  use('rcarriga/nvim-dap-ui', { requires = 'mfussenegger/nvim-dap'})
  use('nvim-neotest/nvim-nio')
  use('nvimtools/none-ls.nvim', { requires = 'nvimtools/none-ls-extras.nvim'})
  use('nvimtools/none-ls-extras.nvim')
  use('mhartington/formatter.nvim')
  use('NvChad/nvim-colorizer.lua')
  use('folke/todo-comments.nvim', { requires = 'nvim-lua/plenary.nvim'})
  use('akinsho/toggleterm.nvim')
  use('numToStr/Comment.nvim')
  use("supermaven-inc/supermaven-nvim")
  use("jay-babu/mason-nvim-dap.nvim")
  use("nvim-lualine/lualine.nvim")
  use("MunifTanjim/nui.nvim")
  use("folke/noice.nvim")
  -- use("rcarriga/nvim-notify")
  use("antosha417/nvim-lsp-file-operations")

  -- JS Debugger
  use('mxsdev/nvim-dap-vscode-js', { requires = 'mfussenegger/nvim-dap'})

  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    --- Uncomment these if you want to manage LSP servers from neovim
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-nvim-lua'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
    {'saadparwaiz1/cmp_luasnip'},
    {'rafamadriz/friendly-snippets'},
  }
}

end)
