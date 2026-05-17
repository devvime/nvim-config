return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- opcional, para ícones bonitos
  },
  config = function()
    require("diffview").setup({
      -- Você pode deixar vazio para usar o padrão, 
      -- ou customizar o comportamento aqui dentro depois.
    })
  end,
  -- Opcional: Carrega o plugin apenas quando você usar os comandos dele
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFileHistory" },
}
