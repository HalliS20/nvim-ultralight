return {
    'booperlv/nvim-gomove',
    config = function()
        require("gomove").setup {
            -- whether or not to map default key bindings, (true/false)
            map_defaults = true,
            -- whether or not to reindent lines moved vertically (true/false)
            reindent = true,
            -- whether or not to undojoin same direction moves (true/false)
            undojoin = true,
            -- whether to not to move past end column when moving blocks horizontally, (true/false)
            move_past_end_col = false,
        }

        local map = vim.api.nvim_set_keymap

        map("n", "<C-S-Left>", "<Plug>GoNSMLeft", {})
        map("n", "<C-S-Down>", "<Plug>GoNSMDown", {})
        map("n", "<C-S-Up>", "<Plug>GoNSMUp", {})
        map("n", "<C-S-Right>", "<Plug>GoNSMRight", {})

        map("x", "<C-S-Left>", "<Plug>GoVSMLeft", {})
        map("x", "<C-S-Down>", "<Plug>GoVSMDown", {})
        map("x", "<C-S-Up>", "<Plug>GoVSMUp", {})
        map("x", "<C-S-Right>", "<Plug>GoVSMRight", {})

        map("n", "<C-h>", "<Plug>GoNSDLeft", {})
        map("n", "<C-j>", "<Plug>GoNSDDown", {})
        map("n", "<C-k>", "<Plug>GoNSDUp", {})
        map("n", "<C-l>", "<Plug>GoNSDRight", {})

        map("x", "<C-h>", "<Plug>GoVSDLeft", {})
        map("x", "<C-j>", "<Plug>GoVSDDown", {})
        map("x", "<C-k>", "<Plug>GoVSDUp", {})
        map("x", "<C-l>", "<Plug>GoVSDRight", {})
    end

}
