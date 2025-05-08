local schemes = {}
schemes.a = "monokai-pro-default"
schemes.b = "nightfly"
schemes.e = "oxocarbon"
schemes.h = "moonfly"
local scheme = schemes.h

-- Make line numbers darker/more subtle with moonfly
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "moonfly",
	callback = function() vim.api.nvim_set_hl(0, "LineNr", {
		fg = "#3a3a3a",
	}) end,
})

vim.cmd("colorscheme " .. scheme)

--------------------------- Some cute theme fixes
--------------------------- fold column bg color ---------------------------

vim.cmd("autocmd VimEnter * hi FoldColumn guibg=bg")
vim.cmd("autocmd ColorScheme * hi FoldColumn guibg=bg")

------------------Set Vertical Split border color------------------

vim.cmd("set winblend=0")

-- Set the vertical split line to the same color as the background
function SetVertSplitHighlight() vim.cmd("highlight VertSplit guifg=bg guibg=bg") end

---------------------- Un comment code below to remove vertical split line ----------------------
vim.cmd("autocmd VimEnter * lua SetVertSplitHighlight()")
vim.cmd("autocmd ColorScheme * lua SetVertSplitHighlight()")
