local set = vim.keymap.set
set({ "n" }, "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>", {
	noremap = true,
	silent = true,
	desc = "Rename variable in buffer",
})
