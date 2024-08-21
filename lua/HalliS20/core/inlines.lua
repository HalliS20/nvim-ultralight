-- vim.opt.list = true
-- vim.opt.listchars = {
--     tab = '│ ',
--     lead = '·',
--     trail = '·',
--     extends = '>',
--     precedes = '<'
-- }

-- Global settings
vim.opt.list = true
vim.opt.listchars = {
	tab = '│ ',
	lead = '·',
	trail = '·',
	extends = '>',
	precedes = '<',
	space = '·'
}

-- Highlighting
vim.cmd([[
    highlight SpecialKey ctermfg=darkgrey guifg=darkgrey
    highlight Whitespace ctermfg=darkgrey guifg=darkgrey
]])

-- Filetype-specific settings
vim.cmd([[
    autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
    autocmd FileType c,cpp setlocal expandtab tabstop=2 shiftwidth=2
]])

-- Function to toggle between tabs and spaces
function ToggleExpandTab()
	if vim.opt.expandtab:get() then
		vim.opt.expandtab = false
		print("Now using tabs for indentation")
	else
		vim.opt.expandtab = true
		print("Now using spaces for indentation")
	end
end

ToggleExpandTab()

vim.api.nvim_set_keymap('n', '<leader>tt', ':lua ToggleExpandTab()<CR>', { noremap = true, silent = true })
