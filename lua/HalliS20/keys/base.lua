local set = vim.keymap.set

vim.g.mapleader = " "
set({ "i" }, "jk", "<ESC>", { desc = "Exit insert mode with jk" })
set({ "n" }, "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
set({ "n", "v" }, "<CR>", ":<up>", { silent = false, noremap = true, desc = "enter for last command" })
