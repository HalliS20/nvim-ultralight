require("HalliS20.core.keymaps")
require("HalliS20.core.options")
require("HalliS20.core.tabline")
require("HalliS20.core.inlines")

---====== SETUP REQUIRED FILES ======---
local statusline = require("HalliS20.core.statusline")
statusline.setup()

local folds = require("HalliS20.core.simple-fold")
folds.setup()
