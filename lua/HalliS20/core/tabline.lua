
----------------------------- tabline upgrade --------------------------------
local function get_short_path(filepath)
    local name = vim.fn.fnamemodify(filepath, ':t')
    if name == '' then
        name = '[No Name]'
    end
    local parent = vim.fn.fnamemodify(filepath, ':h:t')
    if parent ~= '.' then
        return parent .. '/' .. name
    end
    return name
end

-- Function to generate custom tabline
function custom_tabline()
    local s = ''
    for i = 1, vim.fn.tabpagenr('$') do
        local buflist = vim.fn.tabpagebuflist(i)
        local winnr = vim.fn.tabpagewinnr(i)
        local bufnr = buflist[winnr]
        local filepath = vim.fn.bufname(bufnr)
        local short_path = get_short_path(filepath)

        s = s .. '%' .. i .. 'T'
        s = s .. (i == vim.fn.tabpagenr() and '%#TabLineSel#' or '%#TabLine#')
        s = s .. ' ' .. short_path .. ' '
    end
    s = s .. '%#TabLineFill#'
    return s
end

-- Set the custom tabline
vim.o.tabline = '%!v:lua.custom_tabline()'

vim.cmd[[
    highlight TabLine guifg=#888888 guibg=#444444
    highlight TabLineSel guifg=#ffffff guibg=#666666
    highlight TabLineFill guibg=#222222
]]
