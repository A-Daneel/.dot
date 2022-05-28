local cmp = require("cmp")

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "path" },
        { name = "calc" },
        { name = "buffer" },
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    formatting = {
        format = require("lspkind").cmp_format({
            with_text = true,
            menu = {
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[LSP]",
                luasnip = "[LuaSnip]",
                path = "[Path]",
                calc = "[Calc]",
            },
        }),
    },
    preselect = "none",
    view = {
        entries = "native",
    },
    experimental = {
        ghost_text = true,
    },
})
