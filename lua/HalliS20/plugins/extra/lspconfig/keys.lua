return {
	{
		"gR",
		"<cmd>Telescope lsp_references<CR>",
		desc = "(LSP) Show references"
	},
	{
		"gd",
		"<cmd>Telescope lsp_definitions<CR>",
		desc = "(LSP) Show definitions"
	},
	{
		"gi",
		"<cmd>Telescope lsp_implementations<CR>",
		desc = "(LSP) Show implementations"
	},
	{
		"gt",
		"<cmd>Telescope lsp_type_definitions<CR>",
		desc = "(LSP) Show type definitions"
	},
	{
		"<leader>ca",
		vim.lsp.buf.code_action,
		mode = { "n", "v" },
		desc = "(LSP) See available code actions"
	},
	{
		"<leader>rn",
		vim.lsp.buf.rename,
		desc = "(LSP) Smart rename"
	},
	{
		"<leader>D",
		"<cmd>Telescope diagnostics bufnr=0<CR>",
		desc = "(LSP) Show buffer diagnostics"
	},
	{
		"<leader>d",
		vim.diagnostic.open_float,
		desc = "(LSP) Show line diagnostics"
	},
	{
		"[d",
		vim.diagnostic.goto_prev,
		desc = "(LSP) Go to previous diagnostic"
	},
	{
		"]d",
		vim.diagnostic.goto_next,
		desc = "(LSP) Go to next diagnostic"
	},
	{
		"K",
		vim.lsp.buf.hover,
		desc = "(LSP) Show documentation under cursor"
	},
	{
		"<leader>rs",
		"<cmd>LspRestart<CR>",
		desc = "(LSP) Restart LSP"
	},
	-- Goto Preview mappings
	{
		"gp",
		"<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
		desc = "(LSP) Goto preview definition"
	},
	{
		"gpi",
		"<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
		desc = "(LSP) Goto preview implementation"
	},
	{
		"gpt",
		"<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
		desc = "(LSP) Goto preview type definition"
	},
	{
		"gpr",
		"<cmd>lua require('goto-preview').goto_preview_references()<CR>",
		desc = "(LSP) Goto preview references"
	},
	{
		"gpc",
		"<cmd>lua require('goto-preview').close_all_win()<CR>",
		desc = "(LSP) Close all preview windows"
	}
}
