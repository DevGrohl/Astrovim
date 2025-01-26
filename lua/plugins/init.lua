return {
  "nvim-lua/plenary.nvim",
  "max397574/better-escape.nvim",
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
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
  {
    'nvim-telescope/telescope.nvim',
    lazy = false,
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
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  }
}
