return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
    require("nvchad.configs.lspconfig").defaults()
    require "configs.lspconfig"
    end,
  },
  --
  {
    "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
        "lua-language-server", "stylua",
        "html-lsp", "css-lsp" , "prettier"
      },
    },
  },
  --
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
          "vim", "lua", "vimdoc",
          "html", "css"
        },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {

      }
    }
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    configs = function()
      local dap = require('dap')
      local dapui = require('dapui')
      dapui.setup()
      dap.listeners.after.event_initialized['dapui_config'] = function ()
        dapui.setup()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end
    end
  }
}
