return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"eslint",
				"gopls",
				"clangd", -- c/c++ language server
				"bashls",
				"marksman",
				"elixirls",
				"templ",
				"rust_analyzer",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"ts-standard", -- js linter
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"pylint", -- python linter
				"autopep8", -- python formatter
				"yapf",
				"ruff",
				"quick_lint_js", -- js linter
				"eslint_d", -- js linter
				"stylelint", -- css linter
				"eslint", -- js linter
				"clang-format", -- c/c++ formatter
				"luaformatter", -- lua formatter
				"cpplint", -- c/c++ linter
				"luacheck",
				"markdownlint",
				"gofumpt", -- go formatter
				"golangci-lint", -- go linter
				"shfmt",
				"rustfmt", -- rust formatter
			},
		})
	end,
}
