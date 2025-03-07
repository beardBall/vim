local M = {

	"nvim-lualine/lualine.nvim",
}

M.config = function()
	require("lualine").setup({

		options = {
			theme = "dracula",
		},
	})
end
return M
