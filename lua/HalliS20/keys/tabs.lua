local set = vim.keymap.set
set({ "n" }, "<leader>to", "<cmd>tabnew<CR>", {
	desc = "Open new tab",
})
set({ "n" }, "<leader>tf", "<cmd>tabnew %<CR>",
    { desc = "Open current buffer in new tab" })
set({ "n" }, "<leader>tx", "<cmd>tabclose<CR>", {
	desc = "Close current tab",
})
set({ "n" }, "<C-.>", "<cmd>tabn<CR>", {
	desc = "Go to next tab",
})
set({ "n" }, "<C-,>", "<cmd>tabp<CR>", {
	desc = "Go to previous tab",
})
set({ "n" }, "<leader>xx", ":bd<bar>bnext<CR>", {
	noremap = true,
	silent = true,
	desc = "close current buffer",
})
