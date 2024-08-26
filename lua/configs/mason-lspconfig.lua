local M = {}



function M.config()
    require("mason-lspconfig").setup()
        ensure_installed = {
"lua_ls", "clangd", "cmake"
        }
end


return M

