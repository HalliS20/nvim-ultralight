return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local lint = require("lint")
		----------------------- js linters -----------------------
		local jslinter = {}
		jslinter.extrajs = { "eslint", "eslint_d" }
		jslinter.mainjs = { "eslint" }
		-----------------------------------------------------------
		lint.linters_by_ft = {
			css = { "stylelint" },
			html = { "eslint" },
			javascript = jslinter.mainjs,
			typescript = { "eslint" },
			javascriptreact = { "eslint" },
			typescriptreact = { "eslint" },
			tsx = { "eslint" },
			jsx = { "eslint" },
			svelte = { "eslint" },
			python = { "ruff" },
			json = { "eslint" },
			lua = { "luacheck" },
			c = { "cpplint" },
			h = { "cpplint" },
			cpp = { "cpplint" },
			hpp = { "cpplint" },
			markdown = { "markdownlint" },
			go = { "golangcilint" },

		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		lint.linters.cpplint.args = {
			'--rcfile=' .. vim.fn.stdpath('config') .. '/.cpplintrc'
		}
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
