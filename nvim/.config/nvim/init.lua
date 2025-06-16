vim.api.nvim_set_option("clipboard", "unnamed")
vim.g.neo_tree_show_hidden = true
vim.g.copilot_enabled = false

vim.api.nvim_create_autocmd({"InsertLeave", "TextChanged"}, {
    pattern = "*",
    command = "silent! write"
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.keymap.set("n", "<C-f>", function()
  vim.lsp.buf.format()
end, { noremap = true, silent = true })

--local opts = {}
require("vim-options")
require("lazy").setup("plugins")



