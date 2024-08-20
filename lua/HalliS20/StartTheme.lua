local schemes = {}
schemes.b = "nightfly"
schemes.e = "oxocarbon"
schemes.h = "moonfly"
local scheme = schemes.b

vim.cmd("colorscheme " .. scheme)

--------------------------- Some cute theme fixes
--------------------------- fold column bg color ---------------------------

vim.cmd("autocmd VimEnter * hi FoldColumn guibg=bg")
vim.cmd("autocmd ColorScheme * hi FoldColumn guibg=bg")

------------------Set Vertical Split border color------------------

vim.cmd("set winblend=0")

-- Set the vertical split line to the same color as the background
function SetVertSplitHighlight()
    vim.cmd("highlight VertSplit guifg=bg guibg=bg")
end

---------------------- Un comment code below to remove vertical split line ----------------------
vim.cmd("autocmd VimEnter * lua SetVertSplitHighlight()")
vim.cmd("autocmd ColorScheme * lua SetVertSplitHighlight()")
