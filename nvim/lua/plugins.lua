require("plugins-conf.cmp")
require("plugins-conf.gitsigns")
require("plugins-conf.lualine")
require("plugins-conf.nvim-tree")
require("plugins-conf.telescope")
require("plugins-conf.treesitter")
require("plugins-conf.autopairs")
require("plugins-conf.bufferline")
require("plugins-conf.trouble")
require("Comment").setup()

-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- General
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")
	use("kyazdani42/nvim-tree.lua")
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("p00f/nvim-ts-rainbow")
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")
	use("christoomey/vim-tmux-navigator")
	use("windwp/nvim-autopairs")

	-- buffers
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")

	-- cmp plugins
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- snippets
	use("rafamadriz/friendly-snippets")
	use("L3MON4D3/LuaSnip")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("jose-elias-alvarez/null-ls.nvim")
	use("folke/trouble.nvim")

	-- colorscheme
	use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })

	-- comments
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
