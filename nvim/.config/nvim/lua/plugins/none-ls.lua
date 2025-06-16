return {
  "nvimtools/none-ls.nvim",
  -- Replace "vX.Y.Z" with an actual stable tag you find on the none-ls.nvim GitHub page
  -- For example: version = "v0.5.0"
  -- If you prefer a commit, use: commit = "your_chosen_commit_hash"
  version = "vX.Y.Z", -- <<< IMPORTANT: Update this line!
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    local b = null_ls.builtins -- Shorter alias for builtins

    local sources = {
      -- Formatting
      b.formatting.prettier.with({ -- For JavaScript, TypeScript, JSON, YAML, Markdown, HTML, CSS
        extra_filetypes = { "toml" },
        extra_args = { "--tab-width", "2" },
      }),
      b.formatting.stylua, -- For Lua
      b.formatting.black.with({ extra_args = { "--line-length", "88" } }), -- For Python
      b.formatting.shfmt, -- For shell scripts
      b.formatting.gofmt, -- For Go

      -- Diagnostics (Linters)
      b.diagnostics.eslint_d.with({ -- For JavaScript, TypeScript
        prefer_local = "node_modules/.bin",
      }),
      b.diagnostics.flake8.with({ extra_args = { "--max-line-length", "88" } }), -- For Python
      b.diagnostics.luacheck.with({ extra_args = { "--globals", "vim" } }), -- For Lua
      b.diagnostics.shellcheck.with({ extra_args = { "--severity=style" } }), -- For shell scripts
      b.diagnostics.golangci_lint, -- For Go
      b.diagnostics.jsonlint, -- For JSON
    }

    null_ls.setup({
      sources = sources,
      -- Optional: Enable debug mode for troubleshooting
      -- debug = true,
      on_attach = function(client, bufnr)
        -- Only attach if the client supports formatting
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr, async = true })
            end,
          })

          -- Example keymap for manual formatting (adjust as needed)
          vim.keymap.set("n", "<leader>gf", function()
            vim.lsp.buf.format({ bufnr = bufnr, async = true })
            print("Formatted buffer " .. bufnr)
          end, { buffer = bufnr, noremap = true, silent = true, desc = "[G]o [F]ormat buffer" })
        end

        -- You can add similar checks for other capabilities like code_actions
        -- if client.supports_method("textDocument/codeAction") then
        --   vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, { buffer = bufnr, noremap = true, silent = true, desc = "[G]o Code [A]ction" })
        -- end
      end,
    })

    -- Your existing keymap (if you prefer it outside on_attach or for global use)
    -- Note: Formatting via LSP is often buffer-specific, so on_attach is a good place.
    -- If you want a global keymap that works on the current buffer, this is also fine.
    vim.keymap.set("n", "<A-f>", function()
      vim.lsp.buf.format({ async = true }) -- Formats the current buffer
      print("Attempted format on current buffer")
    end, { noremap = true, silent = true, desc = "Format current buffer (Alt-f)" })

  end,
}
