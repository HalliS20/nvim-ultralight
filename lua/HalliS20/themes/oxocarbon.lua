return {
    "nyoom-engineering/oxocarbon.nvim",
    name = "oxocarbon",
    config = function()
        vim.cmd([[autocmd colorscheme oxocarbon colorscheme oxocarbon]]) ---- was to fix bufferline issue may not be needed anymore

        ------------------------------------ make background blend in with statusline ------------------------------------
        vim.cmd([[autocmd colorscheme oxocarbon highlight CursorLine guibg=#121212]])
        vim.cmd([[autocmd colorscheme oxocarbon highlight background guibg=#121212]])

        ------------------------------------ make popup background blend in ------------------------------------
        vim.cmd([[autocmd colorscheme oxocarbon highlight NoiceCmdlinePopupBorder guibg=#121212]])
        vim.cmd([[autocmd colorscheme oxocarbon highlight NoiceCmdlinePopupBorder guifg=#121212]])
        vim.cmd([[autocmd colorscheme oxocarbon highlight NoiceCmdlinePopup guibg=#121212]])

        ------------------------------------ fix treesitter highlight ------------------------------------
        vim.cmd([[autocmd colorscheme oxocarbon highlight @string.plain guifg=#2af999]])
        vim.cmd([[autocmd colorscheme oxocarbon highlight @function guifg=coral]])
        vim.cmd([[autocmd colorscheme oxocarbon highlight @string guifg=#90EE90]])
        vim.cmd([[autocmd colorscheme oxocarbon highlight FoldColumn guifg=#7f7f7f]])
    end,
}

--   event = foo,
--   config = bar
--   end,
