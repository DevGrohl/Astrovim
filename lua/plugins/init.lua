return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
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
    "JunaidQrysh/chameleon.nvim",
    dependencies = { "nvzone/volt" },
    event = "VeryLazy",
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
    },
    config = function()
      require("barbecue").setup({
        create_autocmd = false,
      })

      vim.api.nvim_create_autocmd({
        "WinScrolled",
        "BufWinEnter",
        "CursorHold",
        "InsertLeave",
      }, {
          group = vim.api.nvim_create_augroup("barbecue.updater", {}),
          callback = function()
            require("barbecue.ui").update()
          end,
        })
    end,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require('tiny-inline-diagnostic').setup()
      vim.diagnostic.config({ virtual_text = false })
    end
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
  },
  "nvim-lua/plenary.nvim",
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end
  },
  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  "nvchad/volt",
  {
    'nvim-telescope/telescope.nvim',
    config = function ()
      require 'telescope'.setup {
        extensions = {
          fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = 'smart_case' },
          ['ui-select'] = { require 'telescope.themes'.get_dropdown() }
        },
        vimgrep_argument = { 'rg', '--smart-case' }
      }

      require 'telescope'.load_extension 'fzf'
      require 'telescope'.load_extension 'ui-select'
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
      },
      'nvim-telescope/telescope-ui-select.nvim'
    },
    ft = 'mason', -- SOLUTION
    keys = {
      { '<C-f>', function () require 'telescope.builtin'.live_grep() end },
      { '<C-q>', function () require 'telescope.builtin'.quickfix() end }
    }
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    opts = {
      adapters = {
        ["rustaceanvim.neotest"] = {},
      },
    },
  },
  "mfussenegger/nvim-dap",
}
