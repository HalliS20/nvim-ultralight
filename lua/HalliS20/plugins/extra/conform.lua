return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier", "eslint", "prettierd" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				tsx = { "prettier" },
				jsx = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				less = { "prettier" },
				html = { "prettier" },
				json = { "prettier", "prettierd", "eslint" },
				yaml = { "prettier" },
				markdown = { "markdownlint" },
				graphql = { "prettier" },
				lua = { "lua_format" },
				python = { "autopep8", "black" },
				cpp = { "clang_format" },
				c = { "clang_format" },
				h = { "clang_format" },
				hpp = { "clang_format" },
				elixir = { "mixfmt" },
				go = { "gofumpt" },
			},
			--------------- format on save (moved to none-ls) -------------------
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000
			}
		})

		------------------- format key map (moved to none-ls) -------------------
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format(
				{ lsp_fallback = true, async = false, timeout_ms = 1000 })
		end, { desc = "Format file or range (in visual mode)" })
	end
}
