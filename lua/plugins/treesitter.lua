return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "scss",
        "json",
        "python",
        "php",
        "c",
        "cpp",
        "c_sharp",
        "java",
        "dockerfile",
        "bash",
        "markdown",
        "markdown_inline",
        "yaml",
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    })

    -- Workaround for https://github.com/neovim/neovim/issues/39032:
    -- `(#set! conceal_lines "")` on markdown fenced code blocks crashes
    -- vim.treesitter.highlighter on Neovim 0.12+. nvim-treesitter's
    -- `master` branch is archived and won't ship a fix, so rebuild the
    -- markdown highlights query with that predicate stripped.
    local files = vim.api.nvim_get_runtime_file("queries/markdown/highlights.scm", true)
    if #files > 0 then
      local merged = {}
      for _, file in ipairs(files) do
        for _, line in ipairs(vim.fn.readfile(file)) do
          -- Strip only the predicate itself, not the whole line: it shares
          -- a line with closing parens that must stay to keep the query valid.
          table.insert(merged, (line:gsub('%(#set!%s+conceal_lines%s+""%)', "")))
        end
      end
      vim.treesitter.query.set("markdown", "highlights", table.concat(merged, "\n"))
    end
  end,
}
