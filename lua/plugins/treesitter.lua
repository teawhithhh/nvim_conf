require'nvim-treesitter.configs'.setup {
	ensure_installed = { "cpp", "python", "lua" },
	sync_install = false,
	auto_install = false,
	highlight = {
		enable = true,
	},
}
