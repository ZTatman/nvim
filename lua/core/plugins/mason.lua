require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "emmet_ls",
        "html",
        "eslint",
        "tsserver",
        "jdtls",
        "tailwindcss",
        "cssls",
        "cssmodules_ls",
        "marksman",
        "volar"
    },
})

-- Mason nvim dap setup
-- --
-- local listeners = function()
--     local dap, dapui = require("dap"), require("dapui")
--     dap.listeners.after.event_initialized["dapui_config"] = function()
--         dapui.open()
--     end
--     dap.listeners.before.event_terminated["dapui_config"] = function()
--         dapui.close()
--     end
--     dap.listeners.before.event_exited["dapui_config"] = function()
--         dapui.close()
--     end
-- end
--
-- require("mason-nvim-dap").setup({
--     ensure_installed = { "stylua" },
--     automatic_installation = true,
--     automatic_setup = true
-- })