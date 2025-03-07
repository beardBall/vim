return {

    "olimorris/onedarkpro.nvim",

    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,

        config = function()
            vim.cmd("colorscheme onedark")
            -- vim.cmd.colorscheme "catppuccin-mocha"
            --print("catppuccin!!")
            --vim.cmd("colorscheme catppuccin")
        end,
    },
}
