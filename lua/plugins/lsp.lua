-- Setup language servers.
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.clangd.setup{
	cmd = {
		"clangd",
		"--compile-commands-dir=C:\\Users\\240821\\modules\\"
	},
	capabilities = capabilities
}

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim', 'NM', 'IM', 'VM', 'TM'},
      }
    }
  }
}

lspconfig.html.setup{	filetypes =  { "html" } }
lspconfig.cssls.setup{ filetypes = { "css" } }
