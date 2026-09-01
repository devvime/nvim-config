return {
  {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    config = function()
      require("vscode").setup({
        transparent = true,
        italic_comments = true,
        underline_links = true,
        disable_nvimtree_bg = true,
      })
      vim.cmd.colorscheme("vscode")
    end,
  },
}
