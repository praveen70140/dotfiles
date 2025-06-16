
return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {},
    config = function()
      vim.keymap.set("n", "<A-q>", ":Copilot disable<CR>", { desc = "Disable Copilot" })
      vim.keymap.set("n", "<A-w>", ":Copilot enable<CR>", { desc = "Enable Copilot" })
    end,
  },
}

