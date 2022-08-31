local nvim_lsp = require("lspconfig")

return {
    filetypes = {"ruby", "rakefile"},
    root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git", "."),
    settings = {
        solargraph = {
            autoformat = true,
            completion = true,
            diagnostic = true,
            folding = true,
            references = true,
            rename = true,
            symbols = true
        }
    }
}
