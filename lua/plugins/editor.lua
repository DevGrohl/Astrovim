local setup_plugin = function(name, opts, callback, execute_callback_before_setup)
	local status_ok, plugin = pcall(require, name)
	if plugin then
		if callback then
			if execute_callback_before_setup then
				callback(plugin)
			end
			plugin.setup(opts)
			if not execute_callback_before_setup then
				callback(plugin)
			end
		else
			plugin.setup(opts)
		end
	end
end

return {
  {
    "cshuaimin/ssr.nvim",
    keys = {
      {
        "<leader>sr",
        function() require("ssr").open() end,
        desc = "Structural search and replace",
        mode = { "n", "x" },
      },
    },
    opts = {},
  },
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
    event = { "BufWritePre" },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require "configs.luasnip"
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    opts = function()
      return require "configs.cmp"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require "configs.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
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
  { 'lewis6991/gitsigns.nvim' },
  -- {
  --   'kevinhwang91/nvim-ufo',
  --   dependencies = { { "kevinhwang91/promise-async", lazy = true } },
  --   opts = function()
  --     return require "configs.nvim-ufo"
  --   end,
  -- }
}
