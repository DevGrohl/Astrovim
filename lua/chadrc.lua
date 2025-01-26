
---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "ashes",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.nvdash = { 
  load_on_startup = true,
  header = {
    "      _______                                    ",
    "____ |      /____ ____ ___  ____ ___/\\    __     ",
    "\\_  \\|     /_   /     \\   \\/   /___/  \\  /  \\    ",
    " /   \\    / /  /_  \\   \\  /   /   /    \\/    \\   ",
    "/   \\    /    / / _/   /\\    /   /       /    \\  ",
    "\\____\\  /\\_____/\\_____/  \\__/___/______\\/      \\ ",
    "      \\/                                \\______/ ",
    "                                                 ",
    "______/\\  __________________/\\     n e o v i m   ",
    "        \\/  d e v g r o h l   \\  _______________ ",
    "                               \\/                "
  }
}

M.ui = {
  telescope = {
    style = "bordered",
  },
  tabufline = {
    lazyload = false
  }
}

return M
