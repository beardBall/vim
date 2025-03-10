local pluginTable = {}

local dapPlugin = {

	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")

		dap.adapters.lldb = {
			type = "executable",
			command = "lldb",
			--command = "/Library/Developer/CommandLineTools/usr/bin/lldbusr/bin/lldb",
			name = "lldb",
		}
		---
		-----
		---
		---
		--print("all good upto here!!!")
		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<leader>dc", dap.continue, {})
		vim.keymap.set(
			"n",
			"<leader>do",
			"<cmd>lua require'dap'.step_over()<cr>",
			{ desc = "DAP | Step Over", silent = true }
		)

		vim.keymap.set(
			"n",
			"<leader>di",
			"<cmd>lua require'dap'.step_into()<cr>",
			{ desc = "DAP | Step Into", silent = true }
		)

		vim.keymap.set(
			"n",
			"<leader>du",
			"<cmd>lua require'dap'.step_out()<cr>",
			{ desc = "DAP | Step Out", silent = true }
		)

		vim.keymap.set(
			"n",
			"<leader>db",
			"<cmd>lua require'dap'.toggle_breakpoint()<cr>",
			{ desc = "DAP | Breakpoint", silent = true }
		)

		vim.keymap.set(
			"n",
			"<leader>dB",
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
			{ desc = "DAP | Breakpoint Condition", silent = true }
		)

		vim.keymap.set(
			"n",
			"<leader>dd",
			"<cmd>lua require'dapui'.toggle()<cr>",
			{ desc = "DAP | Dap UI", silent = true }
		)

		vim.keymap.set(
			"n",
			"<leader>dl",
			"<cmd>lua require'dap'.run_last()<cr>",
			{ desc = "DAP | Run Last", silent = true }
		)

		require("plugins.dap.codelldb")
	end,
}

--
--
--
--
local masonDapPlugin = {

	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},

	opts = {
		handlers = {},
		ensure_installed = {
			"codelldb",
		},
	},

	event = "VeryLazy",

	config = function()
		local dap = require("dap")
	end,
}

local dapuiPlugin = {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"leoluz/nvim-dap-go",
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		--require("dap-go").setup()
		require("dapui").setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end

		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end

		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		--vim.keymap.set("n", "<leader>dw", ":lua require'dapui'.elements.add(vim.fn.expand('<cword><cr>'))", {})
	end,
}

table.insert(pluginTable, dapPlugin)
table.insert(pluginTable, dapuiPlugin)
--table.insert(pluginTable, masonDapPlugin)

return pluginTable
