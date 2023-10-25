--補完関係の設定
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	sources = {
		{
			name = "nvim_lsp",
			group_index = 1,
  		-- entry_filter = function(entry, ctx)
  		--   local kind = types.lsp.CompletionItemKind[entry:get_kind()]

  		--   if kind == "Text" then return false end
  		--   return true
			-- end,
		},            --ソース類を設定
		-- { name = "buffer" },
		{ name = 'copilot',  group_index = 2 },
		{ name = "path" },
	},
	mapping = cmp.mapping.preset.insert({
		["<S-TAB>"] = cmp.mapping.select_prev_item(), --Ctrl+pで補完欄を一つ上に移動
		["<TAB>"] = cmp.mapping.select_next_item(), --Ctrl+nで補完欄を一つ下に移動
		-- ['<C-l>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), --Ctrl+yで補完を選択確定
	}),
	experimental = {
		ghost_text = true,
	},
	-- Lspkind(アイコン)を設定
	-- formatting = {
	--   format = lspkind.cmp_format({
	--     mode = 'symbol', -- show only symbol annotations
	--     ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
	--     -- The function below will be called before any actual modifications from lspkind
	--     -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
	--   })
	-- }
})
