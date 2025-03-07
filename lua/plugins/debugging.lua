local pluginTable = {}

--[[

return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
        "leoluz/nvim-dap-go"
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },

        opts = {
            handlers = {},
            snsure_installed = { "codelldb" },
        }
    },


    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        require("dap-go").setup()
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



    end

}



    ]]

local dapPlugin = {

	"mfussenegger/nvim-dap",

	config = function()
		local dap = require("dap")

		dap.adapters.lldb = {
			type = "executable",
			command = "/usr/bin/lldb",
			name = "lldb",
		}

		dap.configurations.cpp = {
			{
				name = "launch",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to ececutable: ", vim.fn.getcwd() .. "/", "file")
				end,
				--program = 'program',

				cmd = "$(workspaceFolder)",
				stopOnEntry = true,
				args = {},
			},
		}

		print("all good upto here!!!")
		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<leader>dc", dap.continue, {})
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
    end 

}

table.insert(pluginTable, dapPlugin)
table.insert(pluginTable, dapuiPlugin)

return pluginTable
