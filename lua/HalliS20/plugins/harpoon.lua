-- ////////////////// THIS IS FOR USING TELESCOPE \\\\\\\\\\\\\\--
-- -- For togling telescope
-- -- uncomment for telescope function
-- local conf = require("telescope.config").values
-- local function toggle_telescope(harpoon_files)
-- 	local file_paths = {}
-- 	for _, item in ipairs(harpoon_files.items) do
-- 		table.insert(file_paths, item.value)
-- 	end
--
-- 	require("telescope.pickers").new({}, {
-- 		prompt_title = "Harpoon",
-- 		finder = require("telescope.finders").new_table({
-- 			results = file_paths,
-- 		}),
-- 		previewer = conf.file_previewer({}),
-- 		sorter = conf.generic_sorter({}),
-- 	}):find()
-- end
-- ////////////////// Actual plugin conf \\\\\\\\\\\\\\\\\\\\\--
return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	lazy = false,
	keys = {
		{
			"<C-e>",
			"<cmd>Harpoon<cr>",
			desc = "(Harpoon) Open window",
		},
		{
			"<leader>a",
			"<cmd>Harpoon add<cr>",
			desc = "(Harpoon) Add buffer",
		},
		{
			"<C-a>1",
			"<cmd>Harpoon 1<cr>",
			desc = "(Harpoon) Nav to Buffer 1",
		},
		{
			"<C-a>2",
			"<cmd>Harpoon 2<cr>",
			desc = "(Harpoon) Nav to Buffer 2",
		},
		{
			"<C-a>3",
			"<cmd>Harpoon 3<cr>",
			desc = "(Harpoon) Nav to Buffer 3",
		},
		{
			"<C-a>4",
			"<cmd>Harpoon 4<cr>",
			desc = "(Harpoon) Nav to Buffer 4",
		},
	},
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()
		local pooner = function(opts)
			local arg = opts.args
			local num = tonumber(arg)
			if arg == "" then
				-- commented line is for making harpoon work with telescope
				-- toggle_telescope(harpoon:list())
				harpoon.ui:toggle_quick_menu(harpoon:list())
			elseif arg == "add" then
				harpoon:list():add()
			elseif arg == "next" then
				harpoon:list():next()
			elseif arg == "prev" then
				harpoon:list():prev()
			elseif num then
				harpoon:list():select(num)
			end
		end
		local completer = function(_)
			local commands = { "add", "list", "next", "prev" }
			return commands
		end

		vim.api.nvim_create_user_command("Harpoon", pooner, {
			desc = "Open harpoon window",
			nargs = "?",
			complete = completer,
		})
	end,

}
