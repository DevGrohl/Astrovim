return {
  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end
  },
  "nvchad/volt",
  "nvzone/menu",
  {
    "nvzone/minty",
    cmd = { "Huefy", "Shades" }
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = function()
      dofile(vim.g.base46_cache .. "devicons")
      return { override = require "nvchad.icons.devicons" }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    opts = {
      indent = { char = "│", highlight = "IblChar" },
      scope = { char = "│", highlight = "IblScopeChar" },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "blankline")

      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require("ibl").setup(opts)

      dofile(vim.g.base46_cache .. "blankline")
    end,
  },
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
    opts = function()
      dofile(vim.g.base46_cache .. "whichkey")
      return {}
    end,
  },
  {
    "mbbill/undotree",
    keys = {
      { "<leader>uu", "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>", desc = "Toggle undotree" },
    },
  },
  {
    "anuvyklack/fold-preview.nvim",
    lazy = false,
    dependencies = "anuvyklack/keymap-amend.nvim",
    opts = {},
  },
  {
    "anuvyklack/pretty-fold.nvim",
    lazy = false,
    opts = {},
  },
  {
    "folke/noice.nvim",
    lazy = false,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        progress = { enabled = false },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        signature = { enabled = false },
        hover = { enabled = false },
      },
      views = {
        cmdline_popup = {
          border = {
            style = "none",
            padding = { 1, 2 },
          },
          filter_options = {},
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
      },
      presets = {
        -- bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    lazy = false,
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.60)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { focusable = false })
      end,
      render = "default",
      stages = "fade_in_slide_out",
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
}
