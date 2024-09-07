return { 

    {"tiagovla/scope.nvim" },

    {
        "romgrk/barbar.nvim",
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons'
        },
        
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        opts = {
        
        },
        version = '^1.0.0',
        config = function()
            require('barbar').setup()
            
            local map = vim.api.nvim_set_keymap
            local opts = { noremap = true, silent = true }

            -- Move to previous/next
            map('n', '<M-,>', '<Cmd>BufferPrevious<CR>', opts)
            map('n', '<M-.>', '<Cmd>BufferNext<CR>', opts)
            map('n', '<C-t>', '<Cmd>BufferNext<CR>', opts)
        end
    }


}
