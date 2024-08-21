-- nvim/lua/Hallis20/core/simple-fold.lua

local M = {}

local function debug_print(msg)
	vim.api.nvim_echo({ { msg, "WarningMsg" } }, true, {})
end

local function apply_indent_folding()
	vim.wo.foldmethod = 'indent'
	vim.wo.foldnestmax = 10
	vim.wo.foldminlines = 2
	vim.cmd('normal! zR') -- Open all folds
	debug_print("Applied indent-based folding")
end

function M.setup()
	debug_print("Simple Fold plugin setup started")

	-- Apply folding to C and C++ files
	vim.api.nvim_create_autocmd({ "FileType" }, {
		pattern = {
			"c", "cpp", "rust", "go",
			"python", "lua",
			"javascript", "typescript", "javascriptreact", "typescriptreact",
			"html", "css", "scss", "sass",
			"svelte", "vue",
			"json", "yaml", "toml",
			"markdown", "text"
		},
		callback = function()
			apply_indent_folding()
		end
	})

	-- Command to refresh folding
	vim.api.nvim_create_user_command('FoldRefresh', apply_indent_folding, {})

	debug_print("Simple Fold plugin setup completed")
end

return M
