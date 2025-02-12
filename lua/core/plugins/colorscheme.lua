-- Vscode
-- local c = require('vscode.colors').get_colors()
-- local vsc_status, vscode = pcall(require, "vscode");
--  vscode.setup({
--      -- Alternatively set style in setup
--      -- style = 'light'
--
--      -- Enable transparent background
--      transparent = true,
--
--      -- Enable italic comment
--      italic_comments = true,
--
--      -- Disable nvim-tree background color
--      disable_nvimtree_bg = false,
--
--      -- Override colors (see ./lua/vscode/colors.lua)
--      color_overrides = {
--          -- vscLineNumber = '#FFFFFF',
--      },
--
--      -- Override highlight groups (see ./lua/vscode/theme.lua)
--      group_overrides = {
--          -- this supports the same val table as vim.api.nvim_set_hl
--          -- use colors from this colorscheme by requiring vscode.colors!
--          Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
--          Function = { fg = c.vscYellow, bg = 'NONE', bold = true },
--          -- jsVariableDef = { fg = c.vscpink, bg = 'none' },
--          -- typescriptVariableDeclaration = { fg = c.vscBlueGreen, bg = 'none' }
--      }
--  })
--  vscode.load()

-- Kanagawa
local overrides = function(colors)
    local p = colors.palette
    local theme = colors.theme
    return {
        CursorLine = {
            bold = true,
            italic = true,
            bg = p.sumiInk5,
        },
        CursorLineNr = {
            fg = p.peachRed
        },
        Visual = {
            bold = true,
        },
        TreesitterContextBottom = {
            link = "Visual",
        },
        IlluminatedCurWord = {
            italic = false,
        },
        IlluminatedWordText = {
            link = "CursorLine",
            italic = true,
        },
        IlluminatedWordRead = {
            link = "CursorLine",
            italic = true,
        },
        IlluminatedWordWrite = {
            link = "CursorLine",
            italic = true,
        },
        Folded = {
            bg = p.sumiInk3,
        },
        StatusColumnFoldClosed = {
            fg = p.springViolet1,
            bold = false,
        },
        DashboardHeader = {
            fg = p.rainbowBlue,
        },
        DashboardIcon = {
            fg = p.oniViolet,
        },
        DashboardDesc = {
            fg = p.fujiWhite,
            italic = true,
        },
        DashboardKey = {
            fg = p.springViolet1,
            bold = true,
        },
        Pmenu = {
            fg = p.fujiWhite,
            bg = p.waveBlue1,
        },
        PmenuSel = {
            fg = p.crystalBlue,
            bg = p.waveBlue1,
            bold = true,
        },
        PmenuSbar = {
            bg = theme.ui.bg_m1,
        },
        PmenuThumb = {
            bg = theme.ui.bg_p2,
        },
        UfoFoldedBg = {
            bg = p.waveBlue1,
            bold = true,
        },
        Constant = {
            fg = p.vueRed3,
            bg = p.sumiInk3
        },
        -- Floating windows
        -- NormalFloat = {
        --     bg = "none",
        -- },
        -- FloatBorder = {
        --     fg = theme.ui.float.fg_border,
        --     bg = "none",
        -- },
        -- FloatTitle = {
        --     fg = p.crystalBlue,
        --     bold = true,
        --     bg = "none",
        -- },
        -- Save an hlgroup with dark background and dimmed foreground
        -- so that you can use it where your still want darker windows.
        -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
        NormalDark = {
            fg = theme.ui.fg_dim,
            bg = theme.ui.bg_m3,
        },
        -- Popular plugins that open floats will link to NormalFloat by default;
        -- set their background accordingly if you wish to keep them dark and borderless
        LazyNormal = {
            bg = theme.ui.bg_m3,
            fg = theme.ui.fg_dim,
        },
        MasonNormal = {
            bg = theme.ui.bg_m3,
            fg = theme.ui.fg_dim,
        },
        -- Telescope Prompts
        TelescopeTitle = {
            fg = p.crystalBlue,
            bold = true,
        },
        TelescopePromptNormal = {
            bg = theme.ui.bg_p1,
        },
        TelescopePromptBorder = {
            fg = theme.ui.float.fg_border,
            bg = 'none'
        },
        TelescopeResultsNormal = {
            bg = theme.ui.bg_m1,
        },
        TelescopeResultsBorder = {
            fg = theme.ui.float.fg_border,
            bg = "none"
        },
        TelescopePreviewNormal = {
            bg = theme.ui.bg_m1,
        },
        TelescopePreviewBorder = {
            fg = theme.ui.float.fg_border,
            bg = theme.ui.bg_m1
        },
        String = {
            fg = p.vueGreen2,
            bg = p.sumiInk3
        },
        WinSeparator = {
            fg = theme.ui.float.fg_border
        }
        -- Function = {
        --     fg = p.rainbowBlue,
        --     bg = p.sumiInk3,
        -- }

    }
end

require("kanagawa").setup({
    compile = false,
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = true,
    dimInactive = false,
    terminalColors = true,
    colors = {
        palette = {
            rainbowBlue = "#61AFEF",
            vueGreen1 = "#41B883",
            vueGreen2 = "#3ba576",
            vueGreen3 = "#338e64",
            vueRed1 = "#EB717D",
            vueRed2 = "#d66872",
            vueRed3 = "#cc636c"
        },
        theme = {
            wave = {},
            lotus = {},
            dragon = {},
            all = {
                ui = {
                    bg_gutter = "none",
                },
            },
        },
    },
    overrides = overrides,
    background = {     -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus"
    },
})
vim.cmd.colorscheme("kanagawa-dragon")
