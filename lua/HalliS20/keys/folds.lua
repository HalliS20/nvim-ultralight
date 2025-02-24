local set = vim.keymap.set -- for conciseness
local def = { noremap = true, silent = true }

set("n", "<C-f>", "<Nop>", { noremap = true, silent = true })
def.desc = "(Folds) Fold current function (zfam)"
set("n", "<C-f>f", "<cmd>normal zfam<cr>", def)

def.desc = "(Folds) Fold current class/struct (zfac)"
set("n", "<C-f>c", "<cmd>normal zfac<cr>", def)

def.desc = "(Folds) Toggle current fold"
set("n", "<C-f>t", "<cmd>normal za<cr>", def)

vim.opt.foldtext = ""

