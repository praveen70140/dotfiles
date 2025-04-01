return {
	"akinsho/toggleterm.nvim",
	config = function()
 require("toggleterm").setup {
  size = 20,                      -- Height for horizontal terminals
  open_mapping = [[<A-h>]],       -- Shortcut to toggle terminal
  hide_numbers = true,            -- Hide line numbers in terminal
  shade_filetypes = {},
  shade_terminals = true,         -- Apply shading to terminal background
  shading_factor = 2,             -- Degree of shading
  start_in_insert = true,         -- Start terminal in insert mode
  persist_size = true,            -- Remember terminal size
  direction = "horizontal",       -- Options: "horizontal", "vertical", "float", "tab"
  close_on_exit = true,           -- Close terminal on process exit
  shell = vim.o.shell,            -- Use default shell
}


end
}
