local set = vim.keymap.set -- for conciseness


-- Writing and quitting all
vim.cmd("command! -nargs=0 WAQ wa | qa")
vim.cmd("cabbrev waq WAQ")

vim.keymap.set('i', '<Right>', function()
	return vim.fn.col('.') == vim.fn.col('$') and '<Down><Home>' or '<Right>'
end, { expr = true })

vim.keymap.set('i', '<Left>', function()
	return vim.fn.col('.') == 1 and '<Up><End>' or '<Left>'
end, { expr = true }) -- nav to next/prev line at line ends/starts
