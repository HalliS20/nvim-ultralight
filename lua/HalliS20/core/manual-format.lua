vim.api.nvim_create_autocmd("FileType", {
	pattern = "fstab",
	callback = function()
		vim.opt_local.formatoptions = "tcq"
		vim.opt_local.tabstop = 8
		vim.opt_local.shiftwidth = 8
	end
})
