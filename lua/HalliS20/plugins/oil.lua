return {
    'stevearc/oil.nvim',
    opts = {
        skip_confirm_for_simple_edits = true,
    },
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
    vim.keymap.set("n", "_", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
    vim.keymap.set("n","<Leader>l","<CMD>Oil .<CR>", {desc="reload oil buffer"}),

    vim.keymap.set("n","<Leader>.","<CMD>Oil .<CR>", {desc="reload oil buffer"}),


    preview = {
        max_width = 0.9,
        min_width = { 80, 0.4 },
        width = nil,
        max_height = 0.9,
        min_height = { 5, 0.1 },
        height = nil,
        border = "rounded",
        win_options = {
            winblend = 0,
        },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
