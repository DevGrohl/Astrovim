---@type LazySpec
return {
  -- Discord presence
  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      opts.section.header.val = {
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
      return opts
    end,
  },
  { "max397574/better-escape.nvim" },
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    "JunaidQrysh/chameleon.nvim",
    dependencies = { "nvzone/volt" },
    event = "VeryLazy",
  },
  {
    "eldritch-theme/eldritch.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "theamallalgi/zitchdog",
    lazy = false,
    priority = 1000,
  },
  {
    "ficcdaf/ashen.nvim",
    lazy = false,
    priority = 1000,
  },
  -- Stylish Markdown
  {
    "XY2DEV/markview.nvim",
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      -- You will not need this if you installed the
      -- parsers manually
      -- Or if the parsers are in your $RUNTIMEPATH
      "nvim-treesitter/nvim-treesitter",

      "nvim-tree/nvim-web-devicons",
    },
  },
  -- LSP warnings under the line of code
  {
    "Maan2003/lsp_lines.nvim",
    lazy = false,
  },
  -- Breadcumbs between tabs and editor
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
    config = function()
      require("barbecue").setup({
        create_autocmd = false, -- prevent barbecue from updating itself automatically
      })

      vim.api.nvim_create_autocmd({
        "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
        "BufWinEnter",
        "CursorHold",
        "InsertLeave",

        -- include this if you have set `show_modified` to `true`
        -- "BufModifiedSet",
      }, {
          group = vim.api.nvim_create_augroup("barbecue.updater", {}),
          callback = function()
            require("barbecue.ui").update()
          end,
        })
    end,
  },
}
