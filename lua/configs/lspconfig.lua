-- load defaults from NvChad
require("nvchad.configs.lspconfig").defaults()

-- load default functions from NvChad
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- list of all servers configured
lspconfig.servers = {
    "lua_ls",
    "clangd",
    "pyright",
    "rust_analyzer",
    "jdtls",
}

-- list of servers configured with default config
local default_servers = {
    "pyright",
    "jdtls",
}

for _, lsp in ipairs(default_servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    })
end

-- rust lsp config
lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "rust" },
    root_dir = lspconfig.util.root_pattern("Cargo.toml"),
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
                -- target = "thumbv7em-none-eabihf",
            },
            check = {
                allTargets = false,
            },
        },
    },
})

-- c/c++ lsp config
lspconfig.clangd.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
    on_init = on_init,
    capabilities = capabilities,
})

-- lua lsp config
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    on_init = on_init,

    settings = {
        Lua = {
            diagnostics = {},
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/luv/library",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup({
--     on_attach = on_attach,
--     on_init = on_init,
--     capabilities = capabilities,
-- })
