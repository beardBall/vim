local M = {}


function M.config()
    local null_ls = require("null-ls")
    
    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.formatting.prettier,
            null_ls.builtins.formatting.erb_lint,
            --
            ----
            ---
        },
    })


vim.keymap.set("n", "<leader>fmt", vim.lsp.buf.format, {})
end


return M
