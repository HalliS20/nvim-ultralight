--------------------------------- Keymaps ---------------------------------------
vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness

--------------------------------- Exit insert mode --------------------------------
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

--------------------------------- clear highlights --------------------------------
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-------------------------------- Window Management --------------------------------
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })                   -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })                 -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })                    -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })               -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-----------Think this is a keymap to press up for last command in nvim-------
local def_opts = { silent = false, noremap = true }

vim.keymap.set({ "n", "v" }, "<CR>", ":<up>", def_opts)

-----------------Keymaps for opening files in different browsers----------------
vim.api.nvim_set_keymap("n", "<leader>op", "<CMD>!safari %<CR>", { silent = true, noremap = true })

-----------------------------Better deletes-------------------------------------
vim.api.nvim_set_option("clipboard", "unnamed,unnamedplus")
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true })
vim.api.nvim_set_keymap("n", "dd", '"_dd', { noremap = true })
vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true })
vim.api.nvim_set_keymap("v", "dd", '"_dd', { noremap = true })
keymap.set("n", "x", '"_x')

-----------------------------Better paste-------------------------------------
vim.api.nvim_set_keymap("v", "p", '"_dP', { noremap = true })

-----------------------------rename variable-------------------------------------
vim.api.nvim_set_keymap(
    "n",
    "<leader>rr",
    "<cmd>lua vim.lsp.buf.rename()<CR>",
    { noremap = true, silent = true, desc = "Rename variable locally" }
)

------------------------- Write all and quit all -----------------------------
vim.cmd("command! -nargs=0 WAQ wa | qa")
vim.cmd("cabbrev waq WAQ")

-------------------------- right and left arrow to next line ------------------

-- Move to next line on right arrow at start of line
-- Move to the beginning of the next line on right arrow at start of line
vim.api.nvim_set_keymap(
    "i",
    "<Right>",
    'col(".") == col("$") ?  "<Down><Home>" : "<Right>"',
    { expr = true, noremap = true, silent = true }
)

-- Move to previous line on left arrow at beginning of line
vim.api.nvim_set_keymap(
    "i",
    "<Left>",
    'col(".") == 1 ? "<Up><End>" : "<Left>"',
    { expr = true, noremap = true, silent = true }
)
-- Move to next line on right arrow at end of line
--
--
----------------------- close current buffer ----------------------------
vim.api.nvim_set_keymap("n", "<leader>xx", ":bd<bar>bnext<CR>", { noremap = true, silent = true })
