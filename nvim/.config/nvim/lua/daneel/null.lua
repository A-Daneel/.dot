vim.diagnostic.config({
	underline = true,
	virtual_text = true,
	signs = true,
	update_in_insert = false,
})

require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.clang_format,
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
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
            augroup LspFormatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
		end
	end,
})
