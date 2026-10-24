-- ================================================================================================
-- TITLE : efm-langserver
-- ABOUT : a general purpose language server protocol implemented here for linters/formatters
-- LINKS :
--   > github : https://github.com/mattn/efm-langserver
--   > configs: https://github.com/creativenull/efmls-configs-nvim/tree/main
-- ================================================================================================
--- LSP client capabilities (from nvim-cmp)
--- @param capabilities table
--- @return nil
return function(capabilities)
	local luacheck = require("efmls-configs.linters.luacheck") -- lua linter
	local stylua = require("efmls-configs.formatters.stylua") -- lua formatter
	local flake8 = require("efmls-configs.linters.flake8") -- python linter
	local black = require("efmls-configs.formatters.black") -- python formatter
	local go_revive = require("efmls-configs.linters.go_revive") -- go linter
	local gofumpt = require("efmls-configs.formatters.gofumpt") -- go formatter
	local mdformat = require("efmls-configs.formatters.mdformat") -- Markdown formatter
	local shellcheck = require("efmls-configs.linters.shellcheck") -- bash linter
	local shfmt = require("efmls-configs.formatters.shfmt") -- bash formatter
	local hadolint = require("efmls-configs.linters.hadolint") -- docker linter
	local dockerfmt = {
		formatCommand = "dockerfmt",
		formatStdin = true,
	}

	vim.lsp.config("efm", {
		capabilities = capabilities,

		filetypes = {
			"dockerfile",
			"go",
			"lua",
			"markdown",
			"python",

			"sh",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				dockerfile = { hadolint, dockerfmt },
				go = { gofumpt, go_revive },
				lua = { luacheck, stylua },
				markdown = { mdformat },
				python = { flake8, black },
				sh = { shellcheck, shfmt },
			},
		},
	})
end
