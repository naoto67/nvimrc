vim.lsp.config("lua_ls", {
	-- nvim-lspconfig が設定したコンフィグにsettingsを追加する
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

vim.lsp.config("gopls", {
	-- on_attach = on_attach,
	-- capabilities = capabilities,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
			gofumpt = true,
			completeUnimported = true,
			completionDocumentation = true,
			deepCompletion = true,
		},
	},
})
-- vim.lsp.config("golangci_lint_ls", {
-- 	settings = {
-- 		golangci_lint_ls = {
-- 			cmd = { "golangci-lint", "run", "--out-format", "json" },
-- 			filetypes = { "go" },
-- 			root_dir = vim.loop.cwd,
-- 			lint_command = "golangci-lint run --out-format json",
-- 			lint_source = "golangci-lint",
-- 		},
-- 	},
-- })
vim.lsp.enable({ "gopls", "graphql", "lua_ls", "yamlls" })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'Go to definition' })
		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "vgd", "<cmd>:vsplit <CR> <cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", bufopts)
		vim.keymap.set("n", "<C-m>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", bufopts)
		vim.keymap.set("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", bufopts)
		vim.keymap.set("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", bufopts)
		vim.keymap.set("n", "ma", "<cmd>lua vim.lsp.buf.code_action()<CR>", bufopts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", bufopts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", bufopts)
		vim.keymap.set("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", bufopts)
		vim.keymap.set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", bufopts)
		-- 他のキーマッピングもここに追加できます
	end,
})
