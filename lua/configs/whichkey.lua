local wk = require("which-key")

-- Register keymap groups for better organization in which-key popup
-- Documentation: https://github.com/folke/which-key.nvim
-- Using the new which-key spec format (v3.0+)

wk.register({
    -- ============================================================================
    -- Leader Key Groups (new spec format)
    -- ============================================================================
    { "<leader>a", group = "Actions" },
    { "<leader>d", group = "Diagnostics" },
    { "<leader>f", group = "File" },
    { "<leader>g", group = "Git" },
    { "<leader>h", group = "History" },
    { "<leader>j", group = "JavaScript" },
    { "<leader>m", group = "Multi-cursor" },
    { "<leader>o", group = "On/Off Toggle" },
    { "<leader>r", group = "Rename" },
    { "<leader>t", group = "TypeScript" },
    { "<leader>v", group = "Preview" },
    { "<leader>w", group = "Word" },
    { "<leader>y", group = "Yank/Copy" },
})

-- Register visual mode groups
wk.register({
    { "<leader>g", group = "Git",          mode = "v" },
    { "<leader>m", group = "Multi-cursor", mode = "v" },
})

-- Register utility keymaps (using ; prefix)
wk.register({
    { ";", group = "Utils" },
})

-- Add detailed group labels for better organization
wk.add({
    {
        { "<leader>a",  group = "Actions" },
        { "<leader>aa", desc = "Code Action" },
        { "<leader>ai", desc = "LSP Info" },
    },
    {
        { "<leader>d",  group = "Diagnostics" },
        { "<leader>dd", desc = "Buffer Diagnostics" },
        { "<leader>dD", desc = "Workspace Diagnostics" },
        { "<leader>dl", desc = "Show Line Diagnostics" },
        { "<leader>db", desc = "Show Buffer Diagnostics" },
    },
    {
        { "<leader>f",  group = "File" },
        { "<leader>ff", desc = "Find Files" },
        { "<leader>ft", desc = "Show Filetype" },
    },
    {
        { "<leader>g",  group = "Git" },
        { "<leader>gb", desc = "Toggle Line Blame" },
        { "<leader>gB", desc = "Git Browse" },
        { "<leader>gd", desc = "Diff This" },
        { "<leader>gD", desc = "Diff This ~" },
        { "<leader>gg", desc = "LazyGit" },
        { "<leader>gh", desc = "Preview Hunk" },
        { "<leader>gH", desc = "Preview Hunk Inline" },
        { "<leader>gr", desc = "Reset Hunk" },
        { "<leader>gs", desc = "Stage Hunk" },
        { "<leader>gv", desc = "Select Hunk" },
    },
    {
        { "<leader>h",  group = "History" },
        { "<leader>hh", desc = "Command History" },
        { "<leader>hn", desc = "Notification History" },
        { "<leader>hk", desc = "Show Keymaps" },
        { "<leader>hy", desc = "Copy Last Notification" },
    },
    {
        { "<leader>j",  group = "JavaScript" },
        { "<leader>jr", desc = "Run JavaScript" },
    },
    {
        { "<leader>o",  group = "Toggle" },
        { "<leader>of", desc = "Toggle Format on Save" },
        { "<leader>oi", desc = "Toggle Inlay Hints" },
        { "<leader>op", desc = "Toggle Picker" },
        { "<leader>os", desc = "Toggle Smooth Scroll" },
        { "<leader>ow", desc = "Toggle Word References" },
        { "<leader>oz", desc = "Toggle Zen Mode" },
    },
    {
        { "<leader>r",  group = "Rename" },
        { "<leader>rn", desc = "Rename Symbol" },
    },
    {
        { "<leader>t",  group = "TypeScript" },
        { "<leader>ts", desc = "Compile TypeScript" },
    },
    {
        { "<leader>v",  group = "Preview" },
        { "<leader>vf", desc = "Pick File to Preview" },
        { "<leader>vp", desc = "Start Live Preview" },
        { "<leader>vP", desc = "Close Live Preview" },
    },
    {
        { "<leader>w",  group = "Word" },
        { "<leader>ws", desc = "Check Word Status" },
    },
    {
        { "<leader>y",  group = "Yank/Copy" },
        { "<leader>yf", desc = "Copy File Name" },
        { "<leader>yp", desc = "Copy Absolute Path" },
        { "<leader>yr", desc = "Copy Relative Path" },
    },
})

-- Add utility keymaps (; prefix)
wk.add({
    {
        { ";",   group = "Utils" },
        { ";t",  desc = "Toggle Terminal" },
        { ";tf", desc = "Toggle Floating Terminal" },
        { ";th", desc = "Toggle Horizontal Terminal" },
        { ";tv", desc = "Toggle Vertical Terminal" },
        { ";l",  desc = "Lazy Plugin Manager" },
        { ";lu", desc = "Lazy Update" },
        { ";m",  desc = "Mason LSP Manager" },
        { ";mu", desc = "Mason Update" },
        { ";h",  desc = "Help Pages" },
    },
})
