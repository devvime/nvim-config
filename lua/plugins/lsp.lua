return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Mason
    require("mason").setup()

    -- LSPs que serão instalados automaticamente
    require("mason-lspconfig").setup({
      ensure_installed = {
        -- JS / TS
        "ts_ls",

        -- Web
        "html",
        "cssls",
        "jsonls",

        -- Backend
        "pyright",
        "intelephense",

        -- C / C++
        "clangd",

        -- C#
        "omnisharp",

        -- Docker
        "dockerls",
      },
      automatic_installation = true,
    })

    -- ⚠️ Neovim 0.11+ (nova API)
    vim.lsp.config("ts_ls", {})
    vim.lsp.config("html", {})
    vim.lsp.config("cssls", {})
    vim.lsp.config("jsonls", {})
    vim.lsp.config("pyright", {})
    vim.lsp.config("intelephense", {})
    vim.lsp.config("clangd", {})
    vim.lsp.config("omnisharp", {})
    vim.lsp.config("dockerls", {})
  end,
}
