return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.api.nvim_set_keymap("n", "<A-i>", [[:Neotree toggle<CR>]], { noremap = true, silent = true })
    -- Map Alt+j to switch to the next tab
    vim.api.nvim_set_keymap("n", "<M-k>", ":tabnext<CR>", { noremap = true, silent = true })
    -- Map Alt+k to switch to the previous tab
    vim.api.nvim_set_keymap("n", "<M-j>", ":tabprevious<CR>", { noremap = true, silent = true })

    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false, -- Show hidden files (dotfiles)
          hide_gitignored = false, -- Optionally, to show git ignored files
        },
      },
      close_if_last_window = true, -- Close Neo-tree if it's the last open window
      window = {
        position = "float",
      },
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
        {
          event = "tab_opened",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
    })
  end,
}
