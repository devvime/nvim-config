local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- =========================
-- Básico (arquivo / edição)
-- =========================
map({ "n", "i", "v" }, "<C-s>", "<Esc>:w<CR>", opts)       -- Save
map({ "n", "i", "v" }, "<C-q>", "<Esc>:q<CR>", opts)       -- Quit
map("n", "<C-z>", "u", opts)                              -- Undo
map("n", "<C-y>", "<C-r>", opts)                          -- Redo

-- =========================
-- Clipboard (igual VS Code)
-- =========================
map({ "n", "v" }, "<C-c>", '"+y', opts)                   -- Copy
map({ "n", "v" }, "<C-x>", '"+d', opts)                   -- Cut
map({ "n", "i" }, "<C-v>", '"+p', opts)                   -- Paste

-- =========================
-- Seleção / navegação
-- =========================
map("n", "<C-a>", "ggVG", opts)                            -- Select all
map("n", "<C-f>", "/", opts)                               -- Find
map("n", "<Esc>", ":nohlsearch<CR>", opts)                -- Clear search

-- =========================
-- Explorer (Ctrl+B)
-- =========================
map("n", "<C-b>", ":NvimTreeToggle<CR>", opts)

-- =========================
-- Telescope (VS Code style)
-- =========================
map("n", "<C-p>", ":Telescope find_files<CR>", opts)      -- Quick open
map("n", "<C-S-f>", ":Telescope live_grep<CR>", opts)     -- Global search

-- =========================
-- LSP (igual VS Code)
-- =========================
map("n", "gd", vim.lsp.buf.definition, opts)              -- Go to definition
map("n", "gr", vim.lsp.buf.references, opts)              -- Find references
map("n", "gi", vim.lsp.buf.implementation, opts)
map("n", "K", vim.lsp.buf.hover, opts)                    -- Hover
map("n", "<F2>", vim.lsp.buf.rename, opts)                -- Rename symbol
map("n", "<F12>", vim.lsp.buf.definition, opts)           -- Go to definition
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

-- =========================
-- Diagnostics (VS Code)
-- =========================
map("n", "<leader>e", vim.diagnostic.open_float, opts)
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)

-- =========================
-- Terminal integrado
-- =========================
map("n", "<C-`>", ":ToggleTerm<CR>", opts)

-- =========================
-- Buffers (abas)
-- =========================
map("n", "<C-Tab>", ":bnext<CR>", opts)
map("n", "<C-S-Tab>", ":bprevious<CR>", opts)
map("n", "<C-w>", ":bdelete<CR>", opts)                   -- Close tab

-- Tabs estilo VS Code
vim.keymap.set("n", "<C-Tab>", ":BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<C-S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })

vim.keymap.set("n", "<C-w>", ":bdelete<CR>", { silent = true }) -- fechar aba

-- Shift + arrows = seleção
vim.keymap.set("n", "<S-Left>", "v<Left>")
vim.keymap.set("n", "<S-Right>", "v<Right>")
vim.keymap.set("n", "<S-Up>", "v<Up>")
vim.keymap.set("n", "<S-Down>", "v<Down>")

vim.keymap.set("v", "<S-Left>", "<Left>")
vim.keymap.set("v", "<S-Right>", "<Right>")
vim.keymap.set("v", "<S-Up>", "<Up>")
vim.keymap.set("v", "<S-Down>", "<Down>")

-- Indentação estilo VS Code
vim.keymap.set("v", "<Tab>", ">gv", { silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { silent = true })

vim.keymap.set("n", "<Tab>", ">>", { silent = true })
vim.keymap.set("n", "<S-Tab>", "<<", { silent = true })

vim.keymap.set("n", "<S-A-f>", vim.lsp.buf.format, { silent = true })

-- Ctrl + arrows = pular palavras
vim.keymap.set({ "n", "v" }, "<C-Left>", "b")
vim.keymap.set({ "n", "v" }, "<C-Right>", "w")

-- Ctrl + Shift + arrows = seleção por palavra
vim.keymap.set("n", "<C-S-Left>", "vb")
vim.keymap.set("n", "<C-S-Right>", "vw")

vim.keymap.set("v", "<C-S-Left>", "b")
vim.keymap.set("v", "<C-S-Right>", "w")

vim.keymap.set({ "n", "v" }, "<Home>", "^")
vim.keymap.set({ "n", "v" }, "<End>", "$")

vim.keymap.set("n", "<S-Home>", "v^")
vim.keymap.set("n", "<S-End>", "v$")

vim.keymap.set("n", "<C-S-Up>", "V<Up>")
vim.keymap.set("n", "<C-S-Down>", "V<Down>")

vim.keymap.set("v", "<C-S-Up>", "<Up>")
vim.keymap.set("v", "<C-S-Down>", "<Down>")
