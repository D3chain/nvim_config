return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "clangd" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            -- Configure clangd
            vim.lsp.config("clangd", {})
            vim.lsp.enable("clangd")
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<C-n>'] = cmp.mapping.select_next_item(),      -- Ctrl+n: suivant
                    ['<C-p>'] = cmp.mapping.select_prev_item(),      -- Ctrl+p: précédent
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Ctrl+y: confirmer
                    ['<C-Space>'] = cmp.mapping.complete(),          -- Ctrl+Space: forcer popup
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },  -- LSP
                    { name = 'buffer' },     -- Mots du fichier
                    { name = 'path' },       -- Chemins de fichiers
                }),
            })
        end,
    },
}
