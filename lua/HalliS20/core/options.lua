local opt = vim.opt -- for conciseness

----=====================TAB SETTINGS===========================-----
local tabsize = 4;       -- SET SIZE HERE

opt.tabstop = tabsize    -- number of visual spaces per TAB
opt.shiftwidth = tabsize -- number of spaces to use for autoindent
opt.expandtab = true     -- tabs are spaces
opt.smarttab = true      -- backspace deletes a 'shiftwidth' amount of spaces
opt.shiftround = true    -- round indent to multiple of 'shiftwidth'
opt.smartindent = true   -- insert indents automatically
opt.autoindent = true    -- copy indent from current line when starting new one

----======================== FORCE TABS ==============================----
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"make", "go", "c", "cpp", "rust",
		"lua", "python",
		"javascript", "typescript", "javascriptreact", "typescriptreact",
		"html", "css", "svelte"
	},
	callback = function()
		vim.opt_local.expandtab = false
		vim.opt_local.tabstop = tabsize
		vim.opt_local.shiftwidth = tabsize
	end
})

----======================== FOLD SETTINGS ==============================----


vim.o.foldcolumn = '1' -- '0' is another option
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true


----======================== OTHER SETTINGS ==============================----
-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true         -- shows absolute line number on cursor line (when relative number is on)

opt.wrap = false          -- set wraping to false
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
-- backspace
opt.backspace = "indent,eol,start"  -- allow backspace on indent, end of line or insert mode start position
-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
opt.splitright = true
opt.splitbelow = true
opt.swapfile = false
vim.opt.numberwidth = 3


----======================= MAXIMUM PERFORMANCE SETTINGS =================================----
-- autocmd to clear undo history for large files

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		local file_size = vim.fn.getfsize(vim.fn.expand("%"))
		if file_size > 100000 then -- 100KB
			vim.cmd("wundo! " .. vim.fn.expand("%:p:h") .. "/." .. vim.fn.expand("%:t") .. ".un~")
		end
	end,
})


-- Periodically clean memory
vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		vim.schedule(function()
			vim.cmd("silent! call luaeval('vim.fn.jobstart([\"sync\"])')")
		end)
	end,
})

-- Set a reasonable limit for undo levels
vim.opt.undolevels = 1000

-- Enable persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.local/share/nvim/undo//')

-- Disable some default plugins if you don't use them
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1


----======================= MISCELLANEOUS SETTINGS =================================----
----------------------- set zsh files to bash syntax for treesitter --------------------
vim.cmd([[autocmd BufNewFile,BufRead *.zsh set filetype=bash]])
vim.cmd([[
  function! SetFileType()
    let l:firstline = getline(1)
    if l:firstline =~ '^#!/bin/zsh'
      set filetype=bash
    endif
  endfunction

  autocmd BufRead,BufNewFile * call SetFileType()
]])
