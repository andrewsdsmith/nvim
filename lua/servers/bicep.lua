return function(capabilities)
	vim.filetype.add({
		extension = {
			bicep = "bicep",
			bicepparam = "bicep-params",
		},
	})
	vim.lsp.config("bicep", {
		cmd = { "bicep-lsp" },
		capabilities = capabilities,
	})
end
