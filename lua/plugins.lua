vim.cmd.packadd "packer.nvim"

packer = require ("packer")
packer.startup(function(use)
  use "airblade/vim-gitgutter"

  use { "wbthomason/packer.nvim", opt = false }

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "lukas-reineke/lsp-format.nvim",
    "neovim/nvim-lspconfig",
  }

  -- format
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }


  use {
    'hrsh7th/nvim-cmp', --補完エンジン本体

    'hrsh7th/cmp-nvim-lsp', --LSPを補完ソースに
    'hrsh7th/cmp-buffer', --bufferを補完ソースに
    'hrsh7th/cmp-path', --pathを補完ソースに
    'hrsh7th/vim-vsnip', --スニペットエンジン
    'hrsh7th/cmp-vsnip', --スニペットを補完ソースに
    'onsails/lspkind.nvim', --補完欄にアイコンを表示

    {
      "zbirenbaum/copilot.lua",
      -- cmd = "Copilot",
      build = ":Copilot auth",
      event = "InsertEnter",
      config = function()
        require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          markdown = true,
          help = true,
        },
      })
      end,
    },
    {
      "zbirenbaum/copilot-cmp",
      dependencies = "copilot.lua",
      opts = {},
      config = function(_, opts)
        local copilot_cmp = require("copilot_cmp")
        copilot_cmp.setup(opts)
      end,
    },
  }

  use 'nvimdev/lspsaga.nvim'
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
                        vim.lsp.buf.format({ bufnr = bufnr })
                        -- vim.lsp.buf.formatting_sync()
                      end,
                  })
              end
          end,
      })
