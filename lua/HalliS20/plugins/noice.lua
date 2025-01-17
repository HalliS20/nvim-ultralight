return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},

	dependencies = {
		"MunifTanjim/nui.nvim",
		--   `nvim-notify` is only needed, if you want to use the notification view.
		-- "rcarriga/nvim-notify",
	},

	config = function()
		require("noice").setup({

			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		})


		-- require("notify").setup({
		-- 	timeout = 100, -- 1 sec to view notification increase for more
		-- 	max_width = 80, -- max width of notifications
		-- 	max_height = 5, -- max height of notifications
		-- })
	end,
}
