return function(capabilities)
	vim.lsp.config("biome", {
		cmd = { "biome", "lsp-proxy" },
		capabilities = capabilities,
		filetypes = { "json", "jsonc", "yaml" },
		workspace_required = false,
		root_dir = function(bufnr, on_dir)
			on_dir(
				vim.fs.root(bufnr, { "biome.json", "biome.jsonc", ".git" })
					or vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
			)
		end,
	})
end
