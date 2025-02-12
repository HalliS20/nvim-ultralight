local path = vim.fn.stdpath("config")

return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier", "eslint" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				tsx = { "prettier" },
				jsx = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				sass = { "prettier" },
				less = { "prettier" },
				html = { "prettier" },
				json = { "prettier", "eslint" },
				yaml = { "prettier" },
				markdown = { "markdownlint" },
				graphql = { "prettier" },
				lua = { "lua_format" },
				python = { "yapf" },
				cpp = { "clang_format" },
				c = { "clang_format" },
				h = { "clang_format" },
				hpp = { "clang_format" },
				elixir = { "mixfmt" },
				go = { "gofumpt" },
				templ = { "templ" },
			},
			--------------- format on save (moved to none-ls) -------------------
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},

			formatters = {
				prettier = {
					prepend_args = {
						"--config-precedence",
						"prefer-file",
						"--config",
						path .. "/.prettierrc",
					},
				},
				yapf = { args = { "--style", path .. "/.style.yapf" } },
				clang_format = {
					args = { "--style=file:" .. path .. "/.clang-format" },
				},
				lua_format = {
					command = "lua-format",
					prepend_args = { "--config", path .. "/.lua-format" },
				},
			},
		})
		------------------- format key map (moved to none-ls) -------------------
		vim.api.nvim_create_user_command("Format", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,

	keys = {
		{
			"<leader>mp",
			"Format",
			desc = "(Conform) runs formatter",
		},
	},
}
