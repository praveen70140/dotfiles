return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",

  configure = function()
    require("bufferline").setup {
      options = {
        numbers = "ordinal",                 -- Show buffer numbers
        close_command = "bdelete! %d",       -- Close command
        right_mouse_command = "bdelete! %d", -- Close with right click
        show_close_icon = true,
        separator_style = "slant",           -- Other styles: "thick", "thin"
        diagnostics = "nvim_lsp",            -- Show diagnostics (if LSP is configured)
        offsets = {
          { filetype = "NvimTree", text = "File Explorer", padding = 1 }
        },
        show_buffer_close_icons = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
      },
    }
  end

}
