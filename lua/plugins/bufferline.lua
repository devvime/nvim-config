return {
  "akinsho/bufferline.nvim",
  version = "*",
  options = {
    show_buffer_icons = true,
    show_buffer_close_icons = true,
  },
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        show_close_icon = true,
        show_buffer_close_icons = true,
        always_show_bufferline = true,
      },
    })
  end,
}
