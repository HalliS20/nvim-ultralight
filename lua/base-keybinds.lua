---------------- switch : and ; ----------------
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })
vim.api.nvim_set_keymap("n", ":", ";", { noremap = true })

----------------- remove keybinds -----------------
vim.api.nvim_set_keymap("n", "grr", "<nop>", { noremap = true, silent = true })
