-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
	-- stylua: ignore
	vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
		lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
	-- stylua: ignore
	vim.api.nvim_echo(
		{ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } },
		true, {})
	vim.fn.getchar()
	vim.cmd.quit()
end

require("lazy_setup")
require("polish")

vim.o.guifont = "BlexMono Nerd Font:h12"
vim.g.neovide_cursor_animation_length = 0
vim.o.wrap = true
vim.o.linebreak = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = false
vim.o.softtabstop = 4
vim.o.scrolloff = 14

vim.keymap.set("n", "<leader>mr", ":CMakeRun<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>mb", ":CMakeBuild<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ms", ":CMakeSettings<CR>", { noremap = true, silent = true })
