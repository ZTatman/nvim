-- Use the new vim.lsp.config API (Nvim 0.11+) instead of deprecated require('lspconfig')
-- See: https://github.com/neovim/nvim-lspconfig

require("nvchad.configs.lspconfig").defaults()

-- ============================================================================
-- Shared Configuration
-- ============================================================================

local on_attach = function(client, bufnr)
  require("nvchad.configs.lspconfig").on_attach(client, bufnr)
end

local capabilities = require("nvchad.configs.lspconfig").capabilities

-- ============================================================================
-- Helper Functions
-- ============================================================================

--- Find project root directory for TypeScript/JavaScript projects
--- @param fname string|number File path or buffer number
--- @return string Root directory path
local function find_ts_root_dir(fname)
  -- Convert buffer number to file path if needed
  local path = fname
  if type(fname) == "number" then
    path = vim.api.nvim_buf_get_name(fname)
    -- If buffer has no file, use current working directory
    if path == "" then
      return vim.fn.getcwd()
    end
  end

  -- Ensure path is a string
  if type(path) ~= "string" or path == "" then
    return vim.fn.getcwd()
  end

  local root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" }
  local root = vim.fs.find(root_markers, { path = path, upward = true })[1]
  if root then
    return vim.fs.dirname(root)
  end
  return vim.fs.dirname(path)
end

--- Shared inlay hints configuration for TypeScript and JavaScript
local function get_inlay_hints_config()
  return {
    includeInlayEnumMemberValueHints = true,
    includeInlayFunctionLikeReturnTypeHints = true,
    includeInlayFunctionParameterTypeHints = true,
    includeInlayParameterNameHints = "all",
    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
    includeInlayPropertyDeclarationTypeHints = true,
    includeInlayVariableTypeHints = true,
  }
end

-- ============================================================================
-- Basic LSP Servers (Default Configuration)
-- ============================================================================

local basic_servers = {
  "html",
  "cssls",
  "lua_ls",
  "pyright",
  "rust_analyzer",
  "gopls",
  "jsonls",
  "yamlls",
}

for _, server_name in ipairs(basic_servers) do
  vim.lsp.config(server_name, {
    on_attach = on_attach,
    capabilities = capabilities,
  })
  vim.lsp.enable(server_name)
end

-- ============================================================================
-- TypeScript Language Server
-- ============================================================================

vim.lsp.config("ts_ls", {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "typescript-language-server", "--stdio" },
  root_dir = find_ts_root_dir,
  settings = {
    typescript = {
      inlayHints = get_inlay_hints_config(),
    },
    javascript = {
      inlayHints = get_inlay_hints_config(),
    },
  },
})
vim.lsp.enable("ts_ls")

-- ============================================================================
-- ESLint Language Server
-- ============================================================================

vim.lsp.config("eslint", {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    -- Enable ESLint formatting
    client.server_capabilities.documentFormattingProvider = true
  end,
  capabilities = capabilities,
  settings = {
    workingDirectory = { mode = "auto" },
    format = { enable = true },
    lint = { enable = true },
  },
})
vim.lsp.enable("eslint")
