
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "pyright" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({})

      lspconfig.ts_ls.setup({
        init_options = {
          maxTsServerMemory = 8192,
          disableAutomaticTypingAcquisition = false,
        },
        handlers = {
          ["textDocument/definition"] = require('vim.lsp.util').buf_location_handler,
        },
        root_dir = lspconfig.util.root_pattern("package.json", "index.js", ".git", "controllers", "model", "routes", "utils"),
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      })

      lspconfig.pyright.setup({
        on_init = function(client)
          local venv_path = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
          if venv_path then
            client.config.settings.python = {
              pythonPath = venv_path .. "/bin/python"
            }
          end
        end,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}

