return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      local actions = require("telescope.actions")

      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<CR>"] = actions.select_default, -- Enter to open in current buffer
              ["<C-t>"] = actions.select_tab,    -- Ctrl+t to open in new tab
            },
            n = {
              ["<CR>"] = actions.select_default, -- Enter to open in current buffer
              ["t"] = actions.select_tab,        -- t to open in new tab
            },
          },
        },
      })
      vim.keymap.set("n", "<A-r>", builtin.find_files, {})
      vim.keymap.set("n", "<A-d>", builtin.live_grep, {})
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
