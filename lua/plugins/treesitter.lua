return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function()
    -- Workaround for a breaking change in Neovim 0.12: captures passed to
    -- vim.treesitter.query.add_predicate/add_directive handlers are now
    -- always `TSNode[]` lists (the old `all=false` single-node compat shim
    -- was removed). nvim-treesitter's `master` branch (archived, no fixes
    -- coming) ships custom predicates/directives in query_predicates.lua
    -- written for the old single-node contract, e.g. `local node =
    -- match[id]; if not node then return end` followed by `node:range()`.
    -- A list is always truthy, so the nil check no-ops and `node:range()`
    -- crashes with "attempt to call method 'range' (a nil value)" -- this
    -- is what breaks markdown fenced-code-block language detection
    -- (`#set-lang-from-info-string!`) among others.
    --
    -- nvim-treesitter registers these from its `plugin/nvim-treesitter.lua`
    -- (auto-sourced at startup, before this `config` runs), so we can't
    -- intercept the registration -- instead, force-reregister corrected
    -- versions here that unwrap the list to its first node, matching the
    -- old contract.
    local function first(match, id)
      local nodes = match[id]
      return nodes and nodes[1] or nil
    end

    vim.treesitter.query.add_predicate("nth?", function(match, _pattern, _bufnr, pred)
      local node = first(match, pred[2])
      local n = tonumber(pred[3])
      if node and node:parent() and node:parent():named_child_count() > n then
        return node:parent():named_child(n) == node
      end
      return false
    end, { force = true })

    vim.treesitter.query.add_predicate("is?", function(match, _pattern, bufnr, pred)
      local locals = require("nvim-treesitter.locals")
      local node = first(match, pred[2])
      local types = { unpack(pred, 3) }
      if not node then
        return true
      end
      local _, _, kind = locals.find_definition(node, bufnr)
      return vim.tbl_contains(types, kind)
    end, { force = true })

    vim.treesitter.query.add_predicate("kind-eq?", function(match, _pattern, _bufnr, pred)
      local node = first(match, pred[2])
      local types = { unpack(pred, 3) }
      if not node then
        return true
      end
      return vim.tbl_contains(types, node:type())
    end, { force = true })

    local html_script_type_languages = {
      importmap = "json",
      module = "javascript",
      ["application/ecmascript"] = "javascript",
      ["text/ecmascript"] = "javascript",
    }
    vim.treesitter.query.add_directive("set-lang-from-mimetype!", function(match, _, bufnr, pred, metadata)
      local node = first(match, pred[2])
      if not node then
        return
      end
      local type_attr_value = vim.treesitter.get_node_text(node, bufnr)
      local configured = html_script_type_languages[type_attr_value]
      if configured then
        metadata["injection.language"] = configured
      else
        local parts = vim.split(type_attr_value, "/", {})
        metadata["injection.language"] = parts[#parts]
      end
    end, { force = true })

    local non_filetype_match_injection_language_aliases = {
      ex = "elixir",
      pl = "perl",
      sh = "bash",
      uxn = "uxntal",
      ts = "typescript",
    }
    local function get_parser_from_markdown_info_string(injection_alias)
      local match = vim.filetype.match({ filename = "a." .. injection_alias })
      return match or non_filetype_match_injection_language_aliases[injection_alias] or injection_alias
    end
    vim.treesitter.query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
      local node = first(match, pred[2])
      if not node then
        return
      end
      local injection_alias = vim.treesitter.get_node_text(node, bufnr):lower()
      metadata["injection.language"] = get_parser_from_markdown_info_string(injection_alias)
    end, { force = true })

    vim.treesitter.query.add_directive("downcase!", function(match, _, bufnr, pred, metadata)
      local id = pred[2]
      local node = first(match, id)
      if not node then
        return
      end
      local text = vim.treesitter.get_node_text(node, bufnr, { metadata = metadata[id] }) or ""
      if not metadata[id] then
        metadata[id] = {}
      end
      metadata[id].text = string.lower(text)
    end, { force = true })

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
