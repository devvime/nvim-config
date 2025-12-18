return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
  config = function()
    require("nvim-tree").setup({
      view = { width = 30 },
      renderer = {
        icons = { show = { file = true, folder = true } }
      }
    })
    vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>")
  end
}
