-- For togling telescope
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers").new({}, {
		prompt_title = "Harpoon",
		finder = require("telescope.finders").new_table({
			results = file_paths,
		}),
		previewer = conf.file_previewer({}),
		sorter = conf.generic_sorter({}),
	}):find()
end


--////////////////// Actual plugin conf \\\\\\\\\\\\\\\\\\\\\--
return {
	"ThePrimeagen/harpoon",
	branch       = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	lazy         = false,
	keys         = {
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
	},
	config       = function()
		local harpoon = require("harpoon")

		harpoon:setup()
		local pooner = function(opts)
			local arg = opts.args
			local num = tonumber(arg)
			if arg == "" then
				toggle_telescope(harpoon:list())
			elseif arg == "add" then
				harpoon:list():add()
			elseif arg == "remove" then
				harpoon:list():remove()
			elseif arg == "next" then
				harpoon:list():next()
			elseif arg == "prev" then
				harpoon:list():prev()
			elseif num then
				harpoon:list():select(num)
			end
		end
		local completer = function(_)
			local commands = { "add", "remove", "list", "next", "prev" }
			return commands
		end


		vim.api.nvim_create_user_command('Harpoon', pooner,
			{ desc = "Open harpoon window", nargs = "?", complete = completer })
	end,

}
