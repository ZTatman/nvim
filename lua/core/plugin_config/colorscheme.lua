local hl = vim.api.nvim_set_hl
local g = vim.g
local o = vim.o

-- vim.cmd [[colorscheme zephyr]]


-- Vscode
-- For dark theme (neovim's default)
-- o.background = 'dark'
-- For light theme
-- o.background = 'light'
-- local c = require('vscode.colors').get_colors()
-- local vsc_status, vscode = pcall(require, "vscode");
-- vscode.setup({
--     -- Alternatively set style in setup
--     -- style = 'light'

--     -- Enable transparent background
--     transparent = true,

--     -- Enable italic comment
--     italic_comments = true,

--     -- Disable nvim-tree background color
--     disable_nvimtree_bg = false,

--     -- Override colors (see ./lua/vscode/colors.lua)
--     color_overrides = {
--         -- vscLineNumber = '#FFFFFF',
--     },

--     -- Override highlight groups (see ./lua/vscode/theme.lua)
--     group_overrides = {
--         -- this supports the same val table as vim.api.nvim_set_hl
--         -- use colors from this colorscheme by requiring vscode.colors!
--         Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
--         Function = { fg = c.vscYellow, bg = 'NONE', bold = true },
--         -- jsVariableDef = { fg = c.vscpink, bg = 'none' },
--         -- typescriptVariableDeclaration = { fg = c.vscBlueGreen, bg = 'none' }
--     }
-- })
-- vscode.load()

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
            fg = p.waveBlue1,
            bg = p.oniViolet,
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
            fg = p.waveRed,
            bg = p.sumiInk3
        },
        -- Floating windows
        NormalFloat = {
            bg = "none",
        },
        FloatBorder = {
            fg = p.oniViolet,
            bg = "none",
        },
        FloatTitle = {
            bg = "none",
        },
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
            fg = theme.ui.special,
            bold = true,
        },
        TelescopePromptNormal = {
            bg = theme.ui.bg_p1,
        },
        TelescopePromptBorder = {
            fg = theme.ui.bg_p1,
            bg = theme.ui.bg_p1,
        },
        TelescopeResultsNormal = {
            fg = theme.ui.fg_dim,
            bg = theme.ui.bg_m1,
        },
        TelescopeResultsBorder = {
            fg = theme.ui.bg_m1,
            bg = theme.ui.bg_m1,
        },
        TelescopePreviewNormal = {
            bg = theme.ui.bg_dim,
        },
        TelescopePreviewBorder = {
            bg = theme.ui.bg_dim,
            fg = theme.ui.bg_dim,
        },
        -- Function = {
        --     fg = rainbowBlue,
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
    dimInactive = true,
    terminalColors = true,
    colors = {
        palette = {
            rainbowBlue = "#61AFEF"
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
    -- background = {     -- map the value of 'background' option to a theme
    --     dark = "dragon", -- try "dragon" !
    --     light = "lotus"
    -- },
})
vim.cmd.colorscheme("kanagawa-dragon")

-- Midnight
-- local colors = require('midnight.colors')
-- require('midnight').setup({
--
-- })
-- vim.cmd.colorscheme("midnight")
