local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd.packadd "packer.nvim"

packer.startup(function(use)
  use "airblade/vim-gitgutter"

  use { "wbthomason/packer.nvim", opt = true }

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "lukas-reineke/lsp-format.nvim",
    "neovim/nvim-lspconfig",
  }

  use {
    'hrsh7th/nvim-cmp', --補完エンジン本体
    event = "InsertEnter",

    dependencies = {
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
        opts = {
          suggestion = { enabled = false },
          panel = { enabled = false },
          filetypes = {
            markdown = true,
            help = true,
          },
        },
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
  }

  use 'nvimdev/lspsaga.nvim'
  use {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    config = function()
      require("fidget").setup {
        -- options
      }
    end,
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
