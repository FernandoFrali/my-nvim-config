-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use({ 'rose-pine/neovim',
  	as = 'rose-pine',
	config = function()
		vim.cmd('colorscheme rose-pine')
	end
})

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

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
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')

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
