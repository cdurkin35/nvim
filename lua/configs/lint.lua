local lint = require("lint")

lint.linters_by_ft = {
    markdown = { "markdownlint" },
    yaml = { "yamllint" },
    python = { "flake8" },
}

-- clangd already publishes diagnostics for C and C++, so avoid running a second
-- linter for those filetypes to prevent duplicate messages.
local lsp_diagnostic_filetypes = {
    c = true,
    cpp = true,
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        local ft = vim.bo.filetype

        if lsp_diagnostic_filetypes[ft] then
            return
        end

        lint.try_lint()
    end,
})
