local set = vim.keymap.set -- for conciseness


set({ "n" }, "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
set({ "n" }, "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
set({ "n" }, "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
set({ "n" }, "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
