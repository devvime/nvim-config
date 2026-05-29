return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
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

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local servers = { "ts_ls", "html", "cssls", "jsonls", "pyright", "intelephense", "clangd", "omnisharp", "dockerls" }
    for _, server in ipairs(servers) do
      vim.lsp.config(server, { capabilities = capabilities })
    end
  end,
}
