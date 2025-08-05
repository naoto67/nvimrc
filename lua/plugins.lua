return {
	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/nvim-cmp",
		},
		event = "VeryLazy",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local on_attach = function(_, bufnr)
				vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
				vim.lsp.inlay_hint.enable(true)

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
			end

			local lspconfig = require("lspconfig")
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"gopls",
					"lua_ls",
					"yamlls",
					"graphql",
					"terraformls",
					-- "buf_language_server",
				},
				automatic_installation = true,
			})
		end,
	},

	--
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				mode = "n",
				"<space>e",
				"<cmd>Trouble diagnostics fold_more<CR>",
			},
		},
	},

	-- completion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp", --LSPを補完ソースに
			"hrsh7th/cmp-buffer", --bufferを補完ソースに
			"hrsh7th/cmp-path", --pathを補完ソースに
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim", --補完欄にアイコンを表示
			"saadparwaiz1/cmp_luasnip", --スニペットを補完ソースに
			{
				"L3MON4D3/LuaSnip",
				build = "make install_jsregexp",
				dependencies = "rafamadriz/friendly-snippets",
				config = function()
					local luasnip = require("luasnip")
					luasnip.filetype_extend("go", { "go" })
					local vscode = require("luasnip.loaders.from_vscode")
					vscode.lazy_load()
					vscode.lazy_load({ paths = { "~/.config/nvim/snippets" } })
				end,
			},
		},
		event = { "InsertEnter", "LspAttach" },
		config = function()
			vim.opt.completeopt = { "menu", "menuone", "noselect" }
			vim.opt.completefunc = 'v:lua.require("cmp").complete()'
			local types = require("cmp.types")
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
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
					}, --ソース類を設定
					-- { name = "buffer" },
					-- { name = 'copilot',  group_index = 2 },
					{ name = "path" },
					{ name = "luasnip" },
					-- { name = "buffer" },
				},
				mapping = cmp.mapping.preset.insert({
					["<S-TAB>"] = cmp.mapping.select_prev_item(), --Ctrl+pで補完欄を一つ上に移動
					["<TAB>"] = cmp.mapping.select_next_item(), --Ctrl+nで補完欄を一つ下に移動
					["<C-k>"] = cmp.mapping.select_prev_item(), --Ctrl+pで補完欄を一つ上に移動
					["<C-j>"] = cmp.mapping.select_next_item(), --Ctrl+pで補完欄を一つ上に移動
					["<C-Space>"] = cmp.mapping.complete(),
					-- ["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = false }), --Ctrl+yで補完を選択確定
				}),
				experimental = {
					ghost_text = true,
				},
				completion = {
					autocomplete = {
						types.cmp.TriggerEvent.InsertEnter,
						types.cmp.TriggerEvent.TextChanged,
					},
					completeopt = "longest,menu,menuone,noselect,noinsert,preview",
					keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
					keyword_length = 1,
				},
			})
		end,
	},

	-- Github Copilot
	{
		"github/copilot.vim",
		event = "VeryLazy",
		config = function()
			-- vim.g.copilot_no_tab_map = true
			vim.g.copilot_no_tab_map = true
		end,
	},

	-- code highlight
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "VeryLazy",
		init = function(plugin)
			require("lazy.core.loader").add_to_rtp(plugin)
			-- pcall(require, "nvim-treesitter.query_predicates")
		end,
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"go",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"html",
					"yaml",
					"graphql",
					"bash",
					"json",
					"css",
					"javascript",
					"typescript",
					"tsx",
					"terraform",
					"cue",
				},
				sync_install = false,
				auto_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				-- colorschema = "sonokai",
			})
		end,
	},

	-- format
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		cmd = { "ConformInfo" },
		config = function()
			local slow_format_filetypes = { "go" }
			vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"
			require("conform").setup({
				default_format_opts = {
					lsp_format = "fallback",
				},
				format_on_save = function(bufnr)
					if slow_format_filetypes[vim.bo[bufnr].filetype] then
						return
					end
					local function on_format(err)
						if err and err:match("timeout$") then
							slow_format_filetypes[vim.bo[bufnr].filetype] = true
						end
					end

					return { timeout_ms = 200, lsp_format = "fallback" }, on_format
				end,

				format_after_save = function(bufnr)
					if not slow_format_filetypes[vim.bo[bufnr].filetype] then
						return
					end
					return { lsp_format = "fallback" }
				end,
				-- brew install prettierd

				formatters_by_ft = {
					["*"] = { "trim_whitespace" },
					bash = { "shfmt" },
					zsh = { "shfmt" },
					lua = { "stylua" },
					markdown = { "prettierd" },
					json = { "prettierd" },
					yaml = { "prettierd" },
					toml = { "dprint" },
					html = { "prettierd" },
					css = { "prettierd" },
					xml = { "xmlformat" },
					javascript = { "prettierd" },
					javascriptreact = { "prettierd" },
					typescript = { "prettierd" },
					typescriptreact = { "prettierd" },
					go = { "gofmt", "goimports" },
					graphql = { "prettierd" },
					cue = { "cue_fmt" },
					proto = { "buf" },
				},
			})
		end,
	},

	-- indent highlight
	{
		"echasnovski/mini.indentscope",
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("mini.indentscope").setup({
				options = {
					try_as_border = true,
					indent_at_cursor = true,
				},
				draw = {
					delay = 300,
				},
			})
		end,
	},

	-- Google 翻訳
	{
		"potamides/pantran.nvim",
		event = "VeryLazy",
		config = function()
			local pantran = require("pantran")
			pantran.setup({
				default_engine = "google",
				engines = {
					google = {
						fallback = {
							default_source = "auto",
							default_target = "ja",
						},
					},
				},
			})
			local opts = { noremap = true, silent = true, expr = true }
			vim.keymap.set("n", "<S-t>", function()
				return pantran.motion_translate() .. "_"
			end, opts)
			vim.keymap.set("x", "<S-t>", pantran.motion_translate, opts)
		end,
	},

	-- Golang
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		ft = { "go", "gomod" },
		config = function()
			require("go").setup({
				lsp_cfg = false,
				lsp_on_attach = false,
				lsp_gofumpt = false,
				test_runner = "go",
				-- run_in_floaterm = true,
			})
		end,
	},

	-- colorschema
	{
		-- {
		-- 	"sainnhe/sonokai",
		-- 	lazy = false,
		-- 	priority = 1000,
		-- 	config = function()
		-- 		vim.g.sonokai_style = "maia"
		-- 		vim.g.sonokai_enable_italic = true
		-- 		vim.cmd.colorscheme("sonokai")
		-- 	end,
		-- },
		{
			"tanvirtin/monokai.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				require("monokai").setup({
					palette = require("monokai"),
				})
				vim.cmd.colorscheme("monokai")
			end,
		},
	},

	-- finder
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local function nvim_tree_on_attach(bufnr)
				local api = require("nvim-tree.api")

				api.config.mappings.default_on_attach(bufnr)

				-- vimのマッピングに回す
				vim.keymap.del("n", "<C-e>", { buffer = bufnr })
				-- live filter
				vim.keymap.set("n", "f", api.live_filter.start, { desc = "filter", buffer = bufnr })
				vim.keymap.set("n", "F", api.live_filter.clear, { desc = "clear", buffer = bufnr })
				vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, { desc = "clear", buffer = bufnr })
				vim.keymap.set("n", "s", api.node.open.vertical, { desc = "split vertical", buffer = bufnr })
				vim.keymap.set("n", "m", api.fs.rename, { desc = "rename node", buffer = bufnr })
				vim.keymap.set("n", "<C-r>", api.tree.reload, { desc = "refresh root", buffer = bufnr })
			end
			require("nvim-tree").setup({
				sort_by = "case_sensitive",
				view = {
					width = 30,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = true,
					git_ignored = false,
					custom = {
						"node_modules",
						-- ".*mock_gen.go",
					},
				},
				filesystem_watchers = {
					enable = true,
					debounce_delay = 500,
					ignore_dirs = {},
				},
				live_filter = {
					prefix = "[FILTER]: ",
					always_show_folders = false, -- Turn into false from true by default
				},
				on_attach = nvim_tree_on_attach,
			})
		end,
	},

	-- git
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		keys = {
			{
				mode = "n",
				"<leader>gs",
				"<cmd>Gitsigns blame_line<CR>",
			},
		},
		config = function()
			require("gitsigns").setup({
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 500,
					ignore_whitespace = false,
					virt_text_priority = 100,
				},
			})
		end,
	},

	{
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
		config = function()
			local lint = require("lint")
			vim.api.nvim_create_autocmd({
				"BufWritePost",
				"BufReadPost",
				-- "InsertLeave",
				-- "TextChanged"
			}, {
				group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
				callback = function()
					local names = lint.linters_by_ft[vim.bo.filetype] or {}

					local ctx = { filename = vim.api.nvim_buf_get_name(0) }
					ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")
					names = vim.tbl_filter(function(name)
						local linter = lint.linters[name]
						return linter
							and not (type(linter) == "table" and linter.condition and not linter.condition(ctx))
					end, names)

					if #names > 0 then
						lint.try_lint(names)
					end
				end,
			})
			lint.linters_by_ft = {
				javascript = { "eslint_d", "typos" },
				typescript = { "eslint_d", "typos" },
				javascriptreact = { "eslint_d", "typos" },
				typescriptreact = { "eslint_d", "typos" },
				css = { "typos" },
				sh = { "typos" },
				lua = { "typos" },
				json = { "jsonlint", "typos" },
				yaml = { "typos" },
				terraform = { "typos" },
				go = { "typos" },
			}
		end,
	},

	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
		-- config = function()
	},

	{
		"ruifm/gitlinker.nvim",
		requires = "nvim-lua/plenary.nvim",
		event = "VeryLazy",
		config = function()
			require("gitlinker").setup()
		end,
	},

	{
		"greggh/claude-code.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for git operations
		},
		config = function()
			require("claude-code").setup({
				window = {
					split_ratio = 0.5, -- Percentage of screen for the terminal window (height or width)
					position = "botright", -- Position of the window: "botright", "topleft", "vertical", "vsplit", etc.
					enter_insert = true, -- Whether to enter insert mode when opening Claude Code
					start_in_normal_mode = false, -- Whether to start in normal mode instead of insert mode
					hide_numbers = true, -- Hide line numbers in the terminal window
					hide_signcolumn = true, -- Hide the sign column in the terminal window
				},
			})
			vim.keymap.set("n", "<leader>cc", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude Code" })
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
}
