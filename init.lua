require("my")
-- print("hello from init.lua")

vim.o.relativenumber = true
vim.g.mapleader = " "
--dsfsd

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

vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")


-- require("lazy").setup(plugins, opts)
-- ######## PROJECT NVIM.LUA #########
-- Loan nvim.lua for project if it exists

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end


vim.keymap.set({'n','v','i'}, '<C-q>', '<cmd>:q<CR>')
vim.keymap.set({'n','v','i'}, '<C-s>', '<cmd>:w<CR>')



print(vim.fn.getcwd() .. "/nvim.lua")
if( file_exists(vim.fn.getcwd() .. "/nvim.lua") ) then
	dofile(vim.fn.getcwd() .. "/nvim.lua")
else
	--print("nvim.lua not found!")
end
--print("fdafdsfds")

