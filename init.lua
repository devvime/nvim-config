-- ======================
-- Lazy.nvim bootstrap
-- ======================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"https://github.com/folke/lazy.nvim",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format()
	end,
})

require("keymaps")

-- Background transparente
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

-- NvimTree
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { bg = "NONE" })

-- ======================
-- VS Code-like options
-- ======================
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.relativenumber = false
vim.opt.signcolumn = "yes:1"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.numberwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
