-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "doomchad", -- default theme
  hl_add = {},
  hl_override = {},
  integrations = {},
  changed_themes = {},
  transparency = false,
  theme_toggle = { "doomchad", "one_light" },
}

-- M.mason = {
--   -- Explicitly add any packages you want to ensure are installed
--   pkgs = {
--     -- Add any additional packages here that aren't automatically detected
--   },
-- }

M.ui = {
  cmp = {
    style = "atom_colored",
  },
  telescope = {
    style = "bordered",
  },
  statusline = {
    theme = "default",
    separator_style = "default",
  },
  tabufline = {
    lazyload = true,
    show_numbers = false,
  },
  which_key = {
    enable = true,
  },
  cheatsheet = {
    theme = "grid", -- The only documented option for cheatsheet
  },
  -- lsp = { signature = true },
}

return M
