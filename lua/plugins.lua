vim.cmd.packadd "packer.nvim"

packer = require("packer")
packer.startup(function(use)
	use "airblade/vim-gitgutter"

	use { "wbthomason/packer.nvim", opt = false }

	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"lukas-reineke/lsp-format.nvim",
		"neovim/nvim-lspconfig",
	}
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}
  -- use {
  --   "lukas-reineke/indent-blankline.nvim"
  --   config = function()
  --     require("ibl").setup {}
  --   end,
  -- }
  use {
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
            -- animation = require("mini.indentscope").gen_animation.none(),
          },
          -- mappings = {
          --   object_scope = "ii",
          --   object_scope_with_border = "ai",
          --   goto_top = "[i",
          --   goto_bottom = "]i",
          -- },
          -- symbol = "󰍳",
        })
    end,
  }

	-- format
	use {
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	}


	use {
		'hrsh7th/nvim-cmp',   --補完エンジン本体

		'hrsh7th/cmp-nvim-lsp', --LSPを補完ソースに
		'hrsh7th/cmp-buffer', --bufferを補完ソースに
		'hrsh7th/cmp-path',   --pathを補完ソースに
		'hrsh7th/vim-vsnip',  --スニペットエンジン
		'hrsh7th/cmp-vsnip',  --スニペットを補完ソースに
		'onsails/lspkind.nvim', --補完欄にアイコンを表示

    {
      "github/copilot.vim",
      config = function()
        -- vim.g.copilot_no_tab_map = true
        vim.g.copilot_no_tab_map = true
      end,
    },
    -- {
    --   'VonHeikemen/fine-cmdline.nvim',
    --   requires = {
    --     {'MunifTanjim/nui.nvim'}
    --   },
    -- },
		-- {
		-- 	"zbirenbaum/copilot.lua",
		-- 	-- cmd = "Copilot",
		-- 	build = ":Copilot auth",
		-- 	event = "InsertEnter",
		-- 	config = function()
		-- 		require("copilot").setup({
    --       server_opts_overrides = {
    --         settings = {
    --           advanced = {
    --             listCount = 3, -- #completions for panel
    --             inlineSuggestCount = 2, -- #completions for getCompletions
    --           }
    --         },
    --       },
		-- 			suggestion = { enabled = true },
		-- 			panel = {
    --         enabled = true,
    --         -- keymap = {
    --         --   jump_prev = "[[",
    --         --   jump_next = "]]",
    --         --   accept = "<CR>",
    --         --   refresh = "gr",
    --         --   open = "<M-CR>"
    --         -- },
    --       },
		-- 			filetypes = {
		-- 				markdown = true,
		-- 				help = true,
    --         go = true,
		-- 			},
		-- 		})
		-- 	end,
		-- },
		-- {
		-- 	"zbirenbaum/copilot-cmp",
		-- 	dependencies = "copilot.lua",
		-- 	opts = {},
		-- 	config = function(_, opts)
		-- 		local copilot_cmp = require("copilot_cmp")
		-- 		copilot_cmp.setup(opts)
		-- 	end,
		-- },
	}


	use {
		'nvimdev/lspsaga.nvim',
		after = "nvim-lspconfig",
		config = function()
			require('lspsaga').setup({})
		end,
	}
	-- use {
	--   'j-hui/fidget.nvim',
	--   tag = 'legacy',
	--   config = function()
	--     require("fidget").setup {
	--       -- options
	--     }
	--   end,
	-- }

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
	}

	use { "ibhagwan/fzf-lua",
		-- optional for icon support
		requires = { "nvim-tree/nvim-web-devicons" }
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "go", "lua", "vim", "vimdoc", "query", "html", "yaml", "graphql" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				-- colorschema = "sonokai",
			})
		end,
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

	use 'sainnhe/sonokai'
	use "rebelot/kanagawa.nvim"

	use {
		"tanvirtin/monokai.nvim",
		config = function()
			require('monokai').setup { palette = require('monokai').soda }
		end,
	}

  -- use 'mfussenegger/nvim-dap'
  -- use 'leoluz/nvim-dap-go'
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-neotest/neotest-go",
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    },
    config = function()
    end,
  }
end)

local function nvim_tree_on_attach(bufnr)
	local api = require "nvim-tree.api"

	api.config.mappings.default_on_attach(bufnr)

	-- vimのマッピングに回す
	vim.keymap.del('n', '<C-e>', { buffer = bufnr })
	-- live filter
	vim.keymap.set('n', 'f', api.live_filter.start, { desc = 'filter', buffer = bufnr })
	vim.keymap.set('n', 'F', api.live_filter.clear, { desc = 'clear', buffer = bufnr })
	vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, { desc = 'clear', buffer = bufnr })
	vim.keymap.set('n', 's', api.node.open.vertical, { desc = 'split vertical', buffer = bufnr })
	vim.keymap.set('n', 'm', api.fs.rename, { desc = 'rename node', buffer = bufnr })
	vim.keymap.set('n', '<C-r>', api.tree.reload, { desc = 'refresh root', buffer = bufnr })
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
    custom = {'node_modules', ".*mock_gen.go"},
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

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require('null-ls')
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.terraform_fmt,
		null_ls.builtins.formatting.cue_fmt,
		-- null_ls.builtins.diagnostics.markdownlint_cli2,
		-- null_ls.builtins.formatting.markdownlint,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- vim.lsp.buf.formatting({ async = false })
					vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
					-- vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})
-- local fineline = require('fine-cmdline')
-- local fn = fineline.fn
--
-- fineline.setup({
--   cmdline = {
--     -- Prompt can influence the completion engine.
--     -- Change it to something that works for you
--     prompt = ': ',
--
--     -- Let the user handle the keybindings
--     enable_keymaps = true
--   },
--   popup = {
--     buf_options = {
--       -- Setup a special file type if you need to
--       filetype = 'FineCmdlinePrompt'
--     }
--   },
--   hooks = {
--     set_keymaps = function(imap, feedkeys)
--       -- Restore default keybindings...
--       -- Except for `<Tab>`, that's what everyone uses to autocomplete
--       imap('<Esc>', fn.close)
--
--       imap('<Up>', fn.up_search_history)
--       imap('<Down>', fn.down_search_history)
--     end
--   }
-- })
--
--
--
      -- get neotest namespace (api call creates or returns namespace)
local neotest_ns = vim.api.nvim_create_namespace("neotest")
vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      local message =
        diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
      return message
    end,
  },
}, neotest_ns)
require("neotest").setup({
  -- your neotest config here
  adapters = {
    require("neotest-go"),
  },
})
