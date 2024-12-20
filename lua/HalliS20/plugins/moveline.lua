return {
	'fedepujol/move.nvim',

	config = function()
		require('move').setup({
		})
		local opts = { noremap = true, silent = true }
		vim.keymap.set('n', '<C-S-k>', ':MoveLine(-1)<CR>', opts)
		vim.keymap.set('n', '<C-S-j>', ':MoveLine(1)<CR>', opts)
		vim.keymap.set('n', '<C-S-h>', ':MoveHChar(-1)<CR>', opts)
		vim.keymap.set('n', '<C-S-l>', ':MoveHChar(1)<CR>', opts)

		vim.keymap.set('n', '<C-S-Up>', ':MoveLine(-1)<CR>', opts)
		vim.keymap.set('n', '<C-S-Down>', ':MoveLine(1)<CR>', opts)
		vim.keymap.set('n', '<C-S-Right>', ':MoveHChar(1)<CR>', opts)
		vim.keymap.set('n', '<C-S-Left>', ':MoveHChar(-1)<CR>', opts)


		vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
		vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

		-- Visual-mode commands
		vim.keymap.set('v', '<C-S-j>', ':MoveBlock(1)<CR>', opts)
		vim.keymap.set('v', '<C-S-k>', ':MoveBlock(-1)<CR>', opts)
		vim.keymap.set('v', '<C-S-h>', ':MoveHBlock(-1)<CR>', opts)
		vim.keymap.set('v', '<C-S-l>', ':MoveHBlock(1)<CR>', opts)
	end

}
