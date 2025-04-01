return{
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup() -- Initialize Harpoon

    -- Keybindings (Customized)
    vim.keymap.set("n", "<leader>c", function() harpoon:list():append() end, { desc = "Add file to Harpoon" })
    vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open Harpoon menu" })
    vim.keymap.set("n", "<leader>a", function() harpoon:list():select(1) end, { desc = "Go to file a" })
    vim.keymap.set("n", "<leader>s", function() harpoon:list():select(2) end, { desc = "Go to file s" })
    vim.keymap.set("n", "<leader>d", function() harpoon:list():select(3) end, { desc = "Go to file d" })
    vim.keymap.set("n", "<leader>f", function() harpoon:list():select(4) end, { desc = "Go to file f" })
    vim.keymap.set("n", "<leader>r", function() harpoon:list():remove() end, { desc = "Remove file from Harpoon" }) -- Remove file
  end,
}

