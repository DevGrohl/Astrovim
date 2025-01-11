-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  vim.api.nvim_echo(
    { { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } },
    true,
    {}
  )
  vim.fn.getchar()
  vim.cmd.quit()
end

-- Theme switcher
vim.keymap.set("n", "<leader>th", function()
    require("tswitch").open()
end, { desc = "Theme Switcher" })

-- HyDE integration
vim.keymap.set("n", "<leader>tH", function()
    require("chameleon.hyprdots").toggle_hyde()
end, { desc = "Toggle-Hyde" })

-- Transparency toggle
vim.keymap.set("n", "<leader>tT", function()
    require("base46").toggle_transparency()
end, { desc = "Toggle Transparency" })

-- -- Disables codeium on start
-- if pcall(require, "codium-vim") then
--   vim.g.codeium_enabled = false
--   vim.g.codeium_manual = true
-- end
--
-- -- enable clipboard
-- vim.api.nvim_set_option_value("clipboard", "unnamed", {})

require "lazy_setup"
require "polish"
