local Plugins = {
	{ 'tpope/vim-fugitive' },
	{ 'wellle/targets.vim' },
	{ 'tpope/vim-repeat' },
	{ 'kyazdani42/nvim-web-devicons', lazy = true },
	{ 'numToStr/Comment.nvim',        config = true, event = 'VeryLazy' },
	{ 'aklt/plantuml-syntax' },
	{ 'nvim-lua/plenary.nvim' },
	{ 'ThePrimeagen/harpoon' },

	-- Themes
	{ 'folke/tokyonight.nvim' },
	{ 'joshdick/onedark.vim' },
	{ 'tanvirtin/monokai.nvim' },
	{ 'lunarvim/darkplus.nvim' },
	{ 'phha/zenburn.nvim' },
}

return Plugins
