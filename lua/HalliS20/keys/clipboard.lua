local set = vim.keymap.set
---keymaps for clipboard operations i don't want sending into a register
set({ "n" }, "d", '"_d', { noremap = true })   -- deletes
set({ "n" }, "dd", '"_dd', { noremap = true }) -- deletes line
set({ "v" }, "d", '"_d', { noremap = true })   -- deletes visual
set({ "v" }, "dd", '"_dd', { noremap = true }) -- deletes line visual
set({ "n" }, "x", '"_x')                       -- remove a letter
set("v", "p", '"_dP', { noremap = true })      -- pastes
