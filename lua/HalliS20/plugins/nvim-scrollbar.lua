return {
  "petertriho/nvim-scrollbar",

  config = function()
    local colors = require("tokyonight.colors").setup()

    require("scrollbar").setup({
      handle = {
        color = vim.g.nvcode_termcolors_bg,

      },
      marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
      }
    })
  end

}
