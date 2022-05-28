vim.diagnostic.config({
	underline = true,
	virtual_text = true,
	signs = true,
	update_in_insert = false,
})

require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.stylua.with({
			extra_args = { "IndentWidth:", "4" },
		}),
		require("null-ls").builtins.formatting.phpcsfixer.with({
			only_local = "vendor/bin",
		}),
		require("null-ls").builtins.diagnostics.phpstan.with({
			only_local = "vendor/bin",
		}),
	},
})
