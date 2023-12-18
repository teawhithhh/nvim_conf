local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
	{'phaazon/hop.nvim'},
	{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
  	}
	},
	{ "https://github.com/teawhithhh/nvim_auto_compiler.git" },
	{'nvim-treesitter/nvim-treesitter'},
	{'neovim/nvim-lspconfig'},
	{'Abstract-IDE/Abstract-cs'},
	{'catppuccin/nvim', name = 'catppuccin', priority = 1000},
	{'xiyaowong/transparent.nvim'},
	{
		'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
	},
  { "williamboman/mason.nvim"},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"L3MON4D3/LuaSnip",
		}
	},
	{ "https://github.com/p00f/clangd_extensions.nvim.git" },
	{
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{ "https://github.com/rafamadriz/neon.git" },
	{ "https://github.com/neoclide/coc.nvim.git" }
}
)
