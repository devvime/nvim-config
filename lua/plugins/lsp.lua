return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {
        "ts_ls",     -- TypeScript / Angular
        "html",
        "cssls",
        "pyright",
      },
    })

    -- ✅ NOVA API OFICIAL (Neovim 0.11+)
    vim.lsp.config("ts_ls", {})
    vim.lsp.config("html", {})
    vim.lsp.config("cssls", {})
    vim.lsp.config("pyright", {})
  end,
}
