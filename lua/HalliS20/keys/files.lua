local set = vim.keymap.set -- for conciseness

-- Writing and quitting all
vim.cmd("command! -nargs=0 WAQ wa | qa")
vim.cmd("cabbrev waq WAQ")

----\/\/\/\/ LINE START AND END NAV \/\/\/\/\/
set("i", "<Right>", function()
	return vim.fn.col(".") == vim.fn.col("$") and "<Down><Home>" or "<Right>"
end, { expr = true })

set("i", "<Left>",
    function() return vim.fn.col(".") == 1 and "<Up><End>" or "<Left>" end,
    { expr = true }) -- nav to next/prev line at line ends/starts

---- \/\/\/\/ BETTER NAV IN TABBED FILES
-- j and k normal navving
local function smart_up_down(key)
	local count = vim.v.count1
	local mode = vim.fn.mode()

	-- Save original column position
	local current_col = vim.fn.col(".")

	-- Execute the movement
	vim.cmd("normal! " .. count .. key)

	-- Only adjust column in normal and visual modes
	if mode == "n" or mode:sub(1, 1) == "v" then
		local start_indent = vim.fn.match(vim.fn.getline("."), "\\S") + 1
		if current_col < start_indent then vim.cmd("normal! _") end
	end
end

-- Apply to normal, visual, and operator-pending modes
for _, mode in ipairs({ "n", "v", "o" }) do
	vim.keymap.set(mode, "j", function() smart_up_down("j") end,
	               { noremap = true, silent = true })
	vim.keymap.set(mode, "k", function() smart_up_down("k") end,
	               { noremap = true, silent = true })
	vim.keymap.set(mode, "<Down>", function() smart_up_down("j") end,
	               { noremap = true, silent = true })
	vim.keymap.set(mode, "<Up>", function() smart_up_down("k") end,
	               { noremap = true, silent = true })
end -- This is a partial fix navigating between different indents can still do weird stuff
