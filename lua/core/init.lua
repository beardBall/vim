vim.keymap.set({ "n", "v", "i" }, "<C-q>", "<cmd>:q<CR>")
vim.keymap.set({ "n", "v", "i" }, "<C-s>", "<cmd>:w<CR><ESC>")

require("core.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
--vim.opt.relativenumber = true
vim.opt.rtp:prepend(lazypath)
--require("lazy").setup("plugins")

require("core.plugins")
require("core.gui")

-- require("lazy").setup(plugins, opts)
-- ######## PROJECT NVIM.LUA #########
-- Loan nvim.lua for project if it exists
require("configs.autocomplete").config()
require("configs.statusline").config()
require("configs.treesitter").config()
require("configs.git").config()
require("configs.bufferline").config()
require("configs.grammar").config()
require("configs.terminal").config()
require("configs.filemanager").config()
require("configs.telescope").config()
require("configs.neotree").config()
require("configs.mason").config()
require("configs.mason-lspconfig").config()
require("configs.lspconfig").config()
require("configs.null").config()

--- If there is a `configs.lang.ft`, load it and call `.config()` on it.
local function try_load_lang_config(ft) end
vim.api.nvim_create_autocmd("BufRead", {
	pattern = "*",
	callback = function()
		local ft = vim.api.nvim_buf_get_option(0, "filetype")
		local name = "configs.lang." .. ft
		if not package.loaded[name] then
			local success, module = pcall(require, name)
			if success then
				print(name .. " loaded")
				module.config()
			end
		end
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		local bg = vim.opt.background:get()
		if bg == "dark" then
			vim.cmd("hi Visual guifg=Black guibg=White")
		elseif bg == "light" then
			vim.cmd("hi Visual guifg=White guibg=Black")
		end
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format()
		print("formatted")
	end,
})

require("core.keymaps")
require("core.theme")

function file_exists(name)
	local f = io.open(name, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

print(vim.fn.getcwd() .. "/nvim.lua")
if file_exists(vim.fn.getcwd() .. "/nvim.lua") then
	dofile(vim.fn.getcwd() .. "/nvim.lua")
else
	--print("nvim.lua not found!")
end
