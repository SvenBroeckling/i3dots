vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'tpope/vim-sleuth'
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use {
		'folke/todo-comments.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use { "catppuccin/nvim", as = "catppuccin",
		config = function()
			vim.cmd("colorscheme catppuccin-mocha")
		end
	}
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use('github/copilot.vim')
	use('ThePrimeagen/harpoon')
	use('mbbill/undotree')
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },    -- Required
			{ 'williamboman/mason.nvim' },  -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' }, -- Required
		}
	}
	use "stevearc/conform.nvim"
	use('nvim-tree/nvim-tree.lua')
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
end)
