require('keys/alias')

-- AUTO COMPILE  KEYBINDS --
	NM('<S-i>', ':Compile<CR>')

-- NEOTREE KEYBINDS --
	NM('<Space>e', ':Neotree float focus<CR>')
	NM('<Space>o', ':Neotree float git_status<CR>')

-- LSP SERVER KEYBINDS --

	-- Global mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	--vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
	--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
	--vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
	--vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

	-- Use LspAttach autocommand to only map the following keys
	-- after the language server attaches to the current buffer
	vim.api.nvim_create_autocmd('LspAttach', {
		group = vim.api.nvim_create_augroup('UserLspConfig', {}),
		callback = function(ev)
			-- Enable completion triggered by <c-x><c-o>
			vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf }
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			--vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
			--vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
			--vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
			--vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
			--vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
			--vim.keymap.set('n', '<space>wl', function()
			 -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			--end, opts)
			--vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
			--vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
			--vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
			--vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
			--vim.keymap.set('n', '<space>f', function()
				--vim.lsp.buf.format { async = true }
			--end, opts)
		end,
	})

-- COC KEYBINDS --
	local keyset = vim.keymap.set
	-- Use Tab for trigger completion with characters ahead and navigate
	-- NOTE: There's always a completion item selected by default, you may want to enable
	-- no select by setting `"suggest.noselect": true` in your configuration file
	-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
	-- other plugins before putting this into your config
	local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
	keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
	keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

	-- Make <CR> to accept selected completion item or notify coc.nvim to format
	-- <C-g>u breaks current undo, please make your own choice
	keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

	-- Use <c-j> to trigger snippets
	keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")

	-- Use <c-space> to trigger completion
	keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

	-- Use `[g` and `]g` to navigate diagnostics
	-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
	keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
	keyset("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

	-- GoTo code navigation
	keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
	keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
	keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
	keyset("n", "gr", "<Plug>(coc-references)", {silent = true})

	-- Use K to show documentation in preview window
	keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

	-- Symbol renaming
	keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})


	-- Formatting selected code
	keyset("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
	keyset("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})


	-- Apply codeAction to the selected region
	-- Example: `<leader>aap` for current paragraph
	local opts = {silent = true, nowait = true}
	keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
	keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

	-- Remap keys for apply code actions at the cursor position.
	keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", opts)
	-- Remap keys for apply source code actions for current file.
	keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts)
	-- Apply the most preferred quickfix action on the current line.
	keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

	-- Remap keys for apply refactor code actions.
	keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
	keyset("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
	keyset("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

	-- Run the Code Lens actions on the current line
	keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)


	-- Map function and class text objects
	-- NOTE: Requires 'textDocument.documentSymbol' support from the language server
	keyset("x", "if", "<Plug>(coc-funcobj-i)", opts)
	keyset("o", "if", "<Plug>(coc-funcobj-i)", opts)
	keyset("x", "af", "<Plug>(coc-funcobj-a)", opts)
	keyset("o", "af", "<Plug>(coc-funcobj-a)", opts)
	keyset("x", "ic", "<Plug>(coc-classobj-i)", opts)
	keyset("o", "ic", "<Plug>(coc-classobj-i)", opts)
	keyset("x", "ac", "<Plug>(coc-classobj-a)", opts)
	keyset("o", "ac", "<Plug>(coc-classobj-a)", opts)


	-- Remap <C-f> and <C-b> to scroll float windows/popups
	---@diagnostic disable-next-line: redefined-local
	local opts = {silent = true, nowait = true, expr = true}
	keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
	keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
	keyset("i", "<C-f>",
				 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
	keyset("i", "<C-b>",
				 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
	keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
	keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)


	-- Use CTRL-S for selections ranges
	-- Requires 'textDocument/selectionRange' support of language server
	keyset("n", "<C-s>", "<Plug>(coc-range-select)", {silent = true})
	keyset("x", "<C-s>", "<Plug>(coc-range-select)", {silent = true})

	---@diagnostic disable-next-line: redefined-local
	local opts = {silent = true, nowait = true}
	-- Show all diagnostics
	-- keyset("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
	-- Manage extensions
	-- keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
	-- Show commands
	-- keyset("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
	-- Find symbol of current document
	-- keyset("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
	-- Search workspace symbols
	-- keyset("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
	-- Do default action for next item
	-- keyset("n", "<space>j", ":<C-u>CocNext<cr>", opts)
	-- Do default action for previous item
	-- keyset("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
	-- Resume latest coc list
	-- keyset("n", "<space>p", ":<C-u>CocListResume<cr>", opts)

