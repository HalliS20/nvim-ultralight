return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		indent = { enabled = true },
		notifier = { enabled = true },
		scroll = { enabled = true },
		words = { enabled = true },
	},
}