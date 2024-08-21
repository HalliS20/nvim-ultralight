local M = {}

local api = vim.api
local fn = vim.fn

-- Function to get current mode
function M.mode()
    local mode_map = {
        ['n'] = 'NORMAL',
        ['i'] = 'INSERT',
        ['v'] = 'VISUAL',
        ['V'] = 'V-LINE',
        [''] = 'V-BLOCK',
        ['c'] = 'COMMAND',
        ['R'] = 'REPLACE',
    }
    return mode_map[api.nvim_get_mode().mode] or 'UNKNOWN'
end

-- Function to get git branch
function M.git_branch()
    local branch = fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    return branch ~= "" and (' ' .. branch) or ''
end

-- Function to get file name
function M.file_name()
    local name = fn.expand('%:t')
    return name ~= '' and name or '[No Name]'
end

-- Function to setup the statusline
function M.setup()
    vim.o.statusline = table.concat({
        '%#StatusLineMode#',         -- Highlight group for mode
        '%{%v:lua.require("HalliS20.core.statusline").mode()%}',  -- Mode
        '%#StatusLine#',             -- Reset highlight to default
        ' %{%v:lua.require("HalliS20.core.statusline").file_name()%}',  -- File name
        '%m',                        -- Modified flag
        '%=',                        -- Right align the rest
        '%{%v:lua.require("HalliS20.core.statusline").git_branch()%} ',  -- Git branch
        '%l:%c ',                    -- Line and column
        '%p%% '                      -- Percentage through file
    })

    -- Define highlight groups
    api.nvim_command('highlight StatusLineMode guibg=#98c379 guifg=#282c34 gui=bold')
    api.nvim_command('highlight StatusLine guibg=#3e4452 guifg=#abb2bf')
end

return M
