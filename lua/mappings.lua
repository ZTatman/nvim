require "nvchad.mappings"

-- ============================================================================
-- Setup
-- ============================================================================

local fn = require "functions"
local map = vim.keymap.set

-- ============================================================================
-- Basic Editing
-- ============================================================================

-- Insert mode escape
map("i", "<C-space>", "<ESC>", { desc = "Escape to Normal Mode" })

-- Save
map({ "n", "i" }, "<C-s>", "<cmd>w<cr>", { desc = "Save File" })

-- Undo/Redo
map({ "n", "i" }, "<C-z>", "<cmd>u<cr>", { desc = "Undo" })
map({ "n", "i" }, "<C-S-z>", "<cmd>redo<cr>", { desc = "Redo" })

-- Select all
map("n", "<C-a>", "ggVG", { desc = "Select All" })

-- ============================================================================
-- LSP & Code Navigation
-- ============================================================================

-- Native LSP
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Documentation" })

-- Lspsaga
map("n", "gh", "<cmd>Lspsaga finder<CR>", { desc = "Symbol Finder" })
map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
map("n", "gy", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Peek Type Definition" })
map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Rename Symbol" })
map("n", "<leader>aa", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })

-- Diagnostics Navigation
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Previous Diagnostic" })
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Diagnostic" })
map("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Show Line Diagnostics" })
map("n", "<leader>db", "<cmd>Lspsaga show_buf_diagnostics<CR>", { desc = "Show Buffer Diagnostics" })

-- Trouble Diagnostics
map("n", "<leader>dd", "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>", { desc = "Buffer Diagnostics" })
map("n", "<leader>dD", "<cmd>Trouble diagnostics toggle focus=true<cr>", { desc = "Workspace Diagnostics" })

-- LSP Info
map("n", "<leader>ai", "<cmd>LspInfo<cr>", { desc = "LSP Info" })

-- ============================================================================
-- Buffer Navigation
-- ============================================================================

map("n", "[b", "<cmd>bp<cr>", { desc = "Previous Buffer" })
map("n", "]b", "<cmd>bn<cr>", { desc = "Next Buffer" })
map("n", "bf", "<cmd>bfirst<cr>", { desc = "First Buffer" })
map("n", "bl", "<cmd>blast<cr>", { desc = "Last Buffer" })

-- ============================================================================
-- File Explorer (NvimTree)
-- ============================================================================

map("n", "<C-b>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle File Explorer" })
map("n", "<C-f>", "<cmd>NvimTreeFindFile<cr>", { desc = "Find File in Explorer" })

-- ============================================================================
-- File Operations
-- ============================================================================

map("n", "<leader>ff", function()
  require("snacks").picker.smart()
end, { desc = "Find Files" })
map("n", "<leader>ft", function()
  local filetype = vim.bo.filetype
  fn.notify(filetype ~= "" and filetype or "No filetype detected", vim.log.levels.INFO, "Filetype")
end, { desc = "Show Filetype" })

-- ============================================================================
-- Copy Operations (Yank)
-- ============================================================================

map("n", "<leader>yf", "<cmd>let @+ = expand('%:t')<cr>", { desc = "Copy File Name" })
map("n", "<leader>yr", "<cmd>let @+ = expand('%')<cr>", { desc = "Copy Relative Path" })
map("n", "<leader>yp", "<cmd>let @+ = expand('%:p')<cr>", { desc = "Copy Absolute Path" })

-- ============================================================================
-- Code Execution
-- ============================================================================

map("n", "<leader>jr", function()
  vim.cmd "w"
  local term = fn.execute_horizontal_terminal("node " .. vim.fn.shellescape(vim.fn.expand "%:p"))
  term:toggle()
  fn.notify("Running " .. vim.fn.expand "%:t", vim.log.levels.INFO, "JavaScript Runner")
end, { desc = "Run JavaScript" })

map("n", "<leader>ts", function()
  vim.cmd "w"
  local term = fn.execute_horizontal_terminal("tsc " .. vim.fn.shellescape(vim.fn.expand "%:p"))
  term:toggle()
  fn.notify("Compiling " .. vim.fn.expand "%:t", vim.log.levels.INFO, "TypeScript Compiler")
end, { desc = "Compile TypeScript" })

-- ============================================================================
-- Live Preview
-- ============================================================================

map("n", "<leader>vp", function()
  vim.cmd "LivePreview start"
  fn.notify("Live Preview started at http://localhost:5500", vim.log.levels.INFO, "Live Preview", 3000)
end, { desc = "Start Live Preview" })

map("n", "<leader>vP", function()
  vim.cmd "LivePreview close"
  fn.notify("Live Preview server closed", vim.log.levels.WARN, "Live Preview")
end, { desc = "Close Live Preview" })

map("n", "<leader>vf", "<cmd>LivePreview pick<cr>", { desc = "Pick File to Preview" })

-- ============================================================================
-- Git Operations
-- ============================================================================

-- Note: Most git keymaps are defined in plugins/init.lua (gitsigns)
-- We'll update those to use consistent prefixes
map({ "n", "v" }, "<leader>gb", function()
  require("snacks").gitbrowse()
end, { desc = "Git Browse" })

map("n", "<leader>gg", function()
  require("snacks").lazygit.open()
end, { desc = "LazyGit" })

-- ============================================================================
-- Word Navigation & References
-- ============================================================================

map({ "n", "t" }, "]w", function()
  require("snacks").words.jump(vim.v.count1)
end, { desc = "Next Word Reference" })

map({ "n", "t" }, "[w", function()
  require("snacks").words.jump(-vim.v.count1)
end, { desc = "Previous Word Reference" })

map("n", "<leader>ws", function()
  local enabled = require("snacks").words.is_enabled()
  fn.notify(
    "Word module is " .. (enabled and "enabled" or "disabled"),
    enabled and vim.log.levels.INFO or vim.log.levels.WARN,
    "Word Module"
  )
end, { desc = "Check Word Status" })

-- ============================================================================
-- Multi-cursor
-- ============================================================================

map("n", "<leader>m", function()
  vim.cmd("normal! viw")
  vim.cmd("MCstart")
end, { desc = "Multi-cursor (Word)" })

map("v", "<leader>m", "<cmd>MCstart<cr>", { desc = "Multi-cursor (Selection)" })

-- ============================================================================
-- History & Pickers
-- ============================================================================

map("n", "<leader>hh", function()
  require("snacks").picker.command_history()
end, { desc = "Command History" })

map("n", "<leader>hn", function()
  require("snacks").picker.notifications()
end, { desc = "Notification History" })

map("n", "<leader>hy", function()
  local history = require("snacks").notifier.get_history()
  if #history > 0 then
    local last = history[#history]
    local text = string.format("[%s] %s: %s", last.level, last.title or "Notification", last.msg)
    vim.fn.setreg("+", text)
    fn.notify("Copied notification to clipboard", vim.log.levels.INFO, "Notification")
  else
    fn.notify("No notifications to copy", vim.log.levels.WARN, "Notification")
  end
end, { desc = "Copy Last Notification" })

map("n", "<leader>hk", function()
  require("snacks").picker.keymaps()
end, { desc = "Show Keymaps" })

-- ============================================================================
-- Toggles
-- ============================================================================

-- Format on Save
local format_on_save = true
map("n", "<leader>of", function()
  format_on_save = not format_on_save
  require("conform").setup {
    format_on_save = format_on_save and {
      timeout_ms = 500,
      lsp_fallback = true,
    } or false,
  }
  fn.notify(
    format_on_save and "Format on save enabled" or "Format on save disabled",
    format_on_save and vim.log.levels.INFO or vim.log.levels.WARN,
    "Format on Save"
  )
end, { desc = "Toggle Format on Save" })

-- Inlay Hints
map("n", "<leader>oi", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local enabled = vim.lsp.inlay_hint.is_enabled { bufnr = bufnr }
  vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
  fn.notify(
    not enabled and "Inlay hints enabled" or "Inlay hints disabled",
    not enabled and vim.log.levels.INFO or vim.log.levels.WARN,
    "Inlay Hints"
  )
end, { desc = "Toggle Inlay Hints" })

-- Word References
map("n", "<leader>ow", function()
  local enabled = require("snacks").words.is_enabled()
  if enabled then
    require("snacks").words.disable()
    fn.notify("Word references disabled", vim.log.levels.WARN, "Word Module")
  else
    require("snacks").words.enable()
    fn.notify("Word references enabled", vim.log.levels.INFO, "Word Module")
  end
end, { desc = "Toggle Word References" })

-- Smooth Scroll
local scroll_enabled = false
map("n", "<leader>os", function()
  if scroll_enabled then
    require("snacks").scroll.disable()
    scroll_enabled = false
    fn.notify("Smooth scrolling disabled", vim.log.levels.WARN, "Scroll")
  else
    require("snacks").scroll.enable()
    scroll_enabled = true
    fn.notify("Smooth scrolling enabled", vim.log.levels.INFO, "Scroll")
  end
end, { desc = "Toggle Smooth Scroll" })

-- Picker
map("n", "<leader>op", function()
  require("snacks").picker()
end, { desc = "Toggle Picker" })

-- Zen Mode
map("n", "<leader>oz", function()
  require("snacks").zen()
end, { desc = "Toggle Zen Mode" })

-- ============================================================================
-- Terminal
-- ============================================================================

-- Default terminal (horizontal)
map("n", ";t", function()
  require("toggleterm").toggle()
end, { desc = "Toggle Terminal" })

-- Floating terminal
map("n", ";tf", function()
  fn.toggle_terminal("float")
end, { desc = "Toggle Floating Terminal" })

-- Horizontal terminal
map("n", ";th", function()
  fn.toggle_terminal("horizontal", 15)
end, { desc = "Toggle Horizontal Terminal" })

-- Vertical terminal
map("n", ";tv", function()
  fn.toggle_terminal("vertical", 80)
end, { desc = "Toggle Vertical Terminal" })

-- ============================================================================
-- Utilities
-- ============================================================================

map("n", ";l", "<cmd>Lazy<cr>", { desc = "Lazy Plugin Manager" })
map("n", ";lu", "<cmd>Lazy update<cr>", { desc = "Lazy Update" })
map("n", ";m", "<cmd>Mason<cr>", { desc = "Mason LSP Manager" })
map("n", ";mu", "<cmd>MasonUpdate<cr>", { desc = "Mason Update" })
map("n", ";h", function()
  require("snacks").picker.help()
end, { desc = "Help Pages" })

-- ============================================================================
-- Which-Key
-- ============================================================================

map("n", "<leader>?", function()
  require("which-key").show { global = false }
end, { desc = "Show Buffer Keymaps" })

-- ============================================================================
-- Load which-key configuration after all keymaps are registered
-- ============================================================================

vim.schedule(function()
  require("configs.whichkey")
end)
