-- Make line numbers darker/more subtle with moonfly
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "moonfly",
	callback = function() vim.api.nvim_set_hl(0, "LineNr", {
		fg = "#3a3a3a",
	}) end,
})
