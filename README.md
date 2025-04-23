# My NvChad Configuration

A customized NvChad configuration with enhanced terminal integration, JavaScript/TypeScript support, and custom utility functions.

> **Important Note**: This repo is meant to be used as a config by NvChad users! The main NvChad repo (NvChad/NvChad) is used as a plugin by this repo, which imports its modules via `require "nvchad.options"`, `require "nvchad.mappings"`, etc. When you clone this repo locally, you should delete the `.git` folder or fork it for your own use.

## Features

- JavaScript/TypeScript development support
- Some utility functions for notifications and terminal management
- Git integration with Gitsigns and Snacks.nvim
- LSP configuration with Lspconfig and Lspsaga
- Completion with nvim-cmp
- Live HTML preview support
- Snacks.nvim
- Treesj
- Treesitter
- Toggleterm
- Nvim-tree
- Trouble
- Rustaceanvim
- Conform.nvim
- Live-preview.nvim

## Installation

1. Backup your existing Neovim configuration
   1. `mv ~/.config/nvim ~/.config/nvim.backup` or `mv ~/.config/nvim ~/.config/nvim.old`
2. Clone this repo into your config folder:

   ```bash
   git clone https://github.com/ZTatman/nvim -b nvchad ~/.config/nvim && nvim
   ```

3. Run `:MasonInstallAll` command after lazy.nvim finishes downloading plugins.
4. Delete the **.git** folder from your nvim directory.
5. Learn customization of UI & base46 from `:h nvui`.

### Update

To update plugins, run `:Lazy sync` in Neovim.

### Customization

#### Chadrc.lua

According to the NvChad documentation, your chadrc.lua file is located in `nvim/lua/chadrc.lua`, and should look exactly like [this](https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua). Or you can keep and use the one in this repo [here](https://github.com/ZTatman/nvim/blob/nvchad/lua/chadrc.lua).

```lua
local options = {

  base46 = {
    theme = "onedark", -- default theme
    hl_add = {},
    hl_override = {},
    integrations = {},
    changed_themes = {},
    transparency = false,
    theme_toggle = { "onedark", "one_light" },
  },

  ui = {
    cmp = {
      icons_left = false, -- only for non-atom styles!
      style = "default", -- default/flat_light/flat_dark/atom/atom_colored
      abbr_maxwidth = 60,
      -- for tailwind, css lsp etc
      format_colors = { lsp = true, icon = "󱓻" },
    },

    telescope = { style = "borderless" }, -- borderless / bordered

    statusline = {
      enabled = true,
      theme = "default", -- default/vscode/vscode_colored/minimal
      -- default/round/block/arrow separators work only for default statusline theme
      -- round and block will work for minimal theme only
      separator_style = "default",
      order = nil,
      modules = nil,
    },

    -- lazyload it when there are 1+ buffers
    tabufline = {
      enabled = true,
      lazyload = true,
      order = { "treeOffset", "buffers", "tabs", "btns" },
      modules = nil,
      bufwidth = 21,
    },
  },

  nvdash = {
    load_on_startup = false,
    header = {
      "                            ",
      "     ▄▄         ▄ ▄▄▄▄▄▄▄   ",
      "   ▄▀███▄     ▄██ █████▀    ",
      "   ██▄▀███▄   ███           ",
      "   ███  ▀███▄ ███           ",
      "   ███    ▀██ ███           ",
      "   ███      ▀ ███           ",
      "   ▀██ █████▄▀█▀▄██████▄    ",
      "     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀   ",
      "                            ",
      "     Powered By  eovim    ",
      "                            ",
    },

    buttons = {
      { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
      { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
      { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
      { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
      { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

      { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

      {
        txt = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime) .. " ms"
          return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
        end,
        hl = "NvDashFooter",
        no_gap = true,
      },

      { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    },
  },

  term = {
    base46_colors = true,
    winopts = { number = false, relativenumber = false },
    sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
    float = {
      relative = "editor",
      row = 0.3,
      col = 0.25,
      width = 0.5,
      height = 0.4,
      border = "single",
    },
  },

  lsp = { signature = true },

  cheatsheet = {
    theme = "grid", -- simple/grid
    excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
  },

  mason = { pkgs = {}, skip = {} },

  colorify = {
    enabled = true,
    mode = "virtual", -- fg, bg, virtual
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true },
  },
}

local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", options, status and chadrc or {})
```

For further customization of your NvChad config, see the [NvChad Website](https://nvchad.com).

## Custom Functions

The configuration includes utility functions in [functions.lua](https://github.com/ZTatman/nvim/blob/nvchad/lua/functions.lua):

## Custom Auto-Commands

The configuration includes custom auto-commands in [autocmds.lua](https://github.com/ZTatman/nvim/blob/nvchad/lua/autocmds.lua):

## Some Custom Keymaps

The rest of the custom keymaps are in the [mappings.lua](https://github.com/ZTatman/nvim/blob/nvchad/lua/mappings.lua) file.

### Terminal & Running Code

- `<leader>jr` - Run JavaScript file in terminal
- `<leader>tc` - Compile TypeScript file

### LSP & Code Navigation

- `gh` - Advanced Symbol Finder
- `gp` - Peek Definition
- `gy` - Peek Type Definition
- `<leader>rn` - Rename Symbol
- `K` - Hover Documentation
- `<leader>ca` - Code Actions

### Git Integration

- `[h` / `]h` - Previous/Next Hunk
- `<leader>ph` - Preview Hunk
- `<leader>gb` - Toggle Line Blame

## Plugins

### Core

- [NvChad](https://github.com/NvChad/NvChad) - Base configuration
- [snacks.nvim](https://github.com/folke/snacks.nvim) - Enhanced UI components
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) - File explorer
- [trouble.nvim](https://github.com/folke/trouble.nvim) - Pretty diagnostics

### LSP & Completion

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configuration
- [lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim) - Enhanced LSP UI
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion engine
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet engine

### Language Support

- [rustaceanvim](https://github.com/mrcjkb/rustaceanvim) - Rust support
- [crates.nvim](https://github.com/saecki/crates.nvim) - Rust crate management
- [conform.nvim](https://github.com/stevearc/conform.nvim) - Code formatting

### Git

- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git integration

### Terminal & Preview

- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) - Terminal management
- [live-preview.nvim](https://github.com/brianhuster/live-preview.nvim) - HTML live preview

### Utilities

- [treesj](https://github.com/Wansmer/treesj) - Split/join language-specific code blocks
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting

## Requirements

- Neovim >= 0.9.0
- Git
- Node.js (for JavaScript/TypeScript support)
- Rust (for Rustaceanvim)
- A Nerd Font
