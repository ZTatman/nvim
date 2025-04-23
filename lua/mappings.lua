require "nvchad.mappings"

-- add yours here
local fn = require("functions")
local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "<c-space>", "<ESC>")

-- LSP Mappings

-- Native LSP
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })

-- Lspsaga
map("n", "gh", "<cmd>Lspsaga finder<CR>", { desc = "Advanced Symbol Finder" })
map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
map("n", "gy", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Peek Type Definition" })
map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Rename Symbol (UI)" })
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Doc" })
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Previous Error" })
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Error" })
map("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Line Diagnostics" })
map("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", { desc = "Buffer Diagnostics" })

-- Trouble diagnostics
map("n", "<leader>d", "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>",
  { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>D", "<cmd>Trouble diagnostics toggle focus=true<cr>", { desc = "Workspace Diagnostics (Trouble)" })

-- Move between buffers
map("n", "[b", ":bp<cr>", { desc = "Previous Buffer" })
map("n", "]b", ":bn<cr>", { desc = "Next Buffer" })
map("n", "bf", ":bfirst<cr>", { desc = "First Buffer" })
map("n", "bl", ":blast<cr>", { desc = "Last Buffer" })

-- Toggle format on save
local format_on_save = true
map("n", "<leader>tf", function()
  format_on_save = not format_on_save
  require("conform").setup({
    format_on_save = format_on_save and {
      timeout_ms = 500,
      lsp_fallback = true,
    } or false,
  })
  fn.notify(
    format_on_save and "Format on save enabled" or "Format on save disabled",
    format_on_save and vim.log.levels.INFO or vim.log.levels.WARN,
    "Format on Save"
  )
end, { desc = "Toggle Format on Save" })

-- Toggle nvim-tree
map('n', '<c-b>', ':NvimTreeToggle<cr>', { desc = "Toggle NvimTree" })
map('n', '<c-f>', ':NvimTreeFindFile<cr>', { desc = "Find File in NvimTree" })

-- Undo/Redo
map({ "n", "i" }, "<C-z>", "<cmd>u<cr>", { desc = "Undo" })
map({ "n", "i" }, "<C-S-z>", "<cmd>redo<cr>", { desc = "Redo" })

-- move lines with <c-j> and <c-k>
map("n", "<c-Up>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<c-Down>", "<cmd>m .-2<cr>==", { desc = "Move line up" })

-- Save
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save" })
map("i", "<C-s>", "<cmd>w<cr>", { desc = "Save" })

-- Select all
map("n", "<C-a>", "ggVG", { desc = "Select All" })

-- Lazy Update and MasonUpdate
map("n", ";l", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", ";lu", "<cmd>Lazy update<cr>", { desc = "Lazy Update" })
map("n", ";m", "<cmd>Mason<cr>", { desc = "Mason" })
map("n", ";mu", "<cmd>MasonUpdate<cr>", { desc = "Mason Update" })

-- Lspinfo
map("n", "<leader>li", "<cmd>Lspinfo<cr>", { desc = "Lspinfo" })

-- Snacks LazyGit
map("n", "<leader>lg", function()
  require("snacks").lazygit.open()
end, { desc = "LazyGit (Floating)" })

-- Snacks Inlay Hints
map("n", "<leader>ih", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
  vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
  fn.notify(
    not enabled and "Inlay hints enabled" or "Inlay hints disabled",
    not enabled and vim.log.levels.INFO or vim.log.levels.WARN,
    "Inlay Hints"
  )
end, { desc = "Toggle Inlay Hints" })

-- Snacks Pickers
map("n", "<leader>tp", function()
  require("snacks").picker()
end, { desc = "Toggle Picker" })

map("n", "<leader>fs", function()
  require("snacks").picker.smart()
end, { desc = "Smart Find Files" })

map("n", "<leader>ch", function()
  require("snacks").picker.command_history()
end, { desc = "Command History" })

map("n", "<leader>nh", function()
  require("snacks").picker.notifications()
end, { desc = "Notification History" })

map("n", "<leader>km", function()
  require("snacks").picker.keymaps()
end, { desc = "Show Keymaps" })

map("n", ";sh", function() require("snacks").picker.help() end, { desc = "Help Pages" })

-- File Path Operations
map("n", "<leader>cf", "<cmd>let @+ = expand('%:t')<cr>", { desc = "Copy File Name" })
map("n", "<leader>cr", "<cmd>let @+ = expand('%')<cr>", { desc = "Copy Relative Path" })
map("n", "<leader>cp", "<cmd>let @+ = expand('%:p')<cr>", { desc = "Copy Absolute Path" })

-- Which-Key
map("n", "<leader>?", function()
  require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })

-- Word Navigation
map({ "n", "t" }, "]w", function()
  require("snacks").words.jump(vim.v.count1)
end, { desc = "Next Reference" })

map({ "n", "t" }, "[w", function()
  require("snacks").words.jump(-vim.v.count1)
end, { desc = "Prev Reference" })

-- Word Module Status
map("n", "<leader>ws", function()
  local enabled = require("snacks").words.is_enabled()
  print("Word module is " .. (enabled and "enabled" or "disabled"))
end, { desc = "Check Word Module Status" })

-- Toggle Word Module with Notification
map("n", "<leader>tw", function()
  local enabled = require("snacks").words.is_enabled()
  if enabled then
    require("snacks").words.disable()
    fn.notify(
      "Word references disabled",
      vim.log.levels.WARN,
      "Word Module"
    )
  else
    require("snacks").words.enable()
    fn.notify(
      "Word references enabled",
      vim.log.levels.INFO,
      "Word Module"
    )
  end
end, { desc = "Toggle Word References" })

-- Git Browse
map({ "n", "v" }, "<leader>gB", function()
  require("snacks").gitbrowse()
end, { desc = "Git Browse" })

-- Zen Mode
map("n", "<leader>z", function()
  require("snacks").zen()
end, { desc = "Toggle Zen Mode" })

-- Scroll Toggle
local scroll_enabled = false
map("n", "<leader>ts", function()
  if scroll_enabled then
    require("snacks").scroll.disable()
    scroll_enabled = false
    fn.notify(
      "Smooth scrolling disabled",
      vim.log.levels.WARN,
      "Scroll"
    )
  else
    require("snacks").scroll.enable()
    scroll_enabled = true
    fn.notify(
      "Smooth scrolling enabled",
      vim.log.levels.INFO,
      "Scroll"
    )
  end
end, { desc = "Toggle Smooth Scrolling" })

-- Show current buffer filetype
map("n", "<leader>fy", function()
  local filetype = vim.bo.filetype
  fn.notify(
    filetype ~= "" and filetype or "No filetype detected",
    vim.log.levels.INFO,
    "Filetype"
  )
end, { desc = "Show Current Filetype" })

-- Live Preview
map("n", "<leader>lp", function()
  vim.cmd("LivePreview start")
  fn.notify(
    "Live Preview started at http://localhost:5500",
    vim.log.levels.INFO,
    "Live Preview",
    3000
  )
end, { desc = "Start Live Preview" })

map("n", "<leader>lP", function()
  vim.cmd("LivePreview close")
  fn.notify(
    "Live Preview server closed",
    vim.log.levels.WARN,
    "Live Preview"
  )
end, { desc = "Close Live Preview" })
map("n", "<leader>lf", "<cmd>LivePreview pick<cr>", { desc = "Pick File to Preview" })

-- JavaScript Runner
map("n", "<leader>jr", function()
  vim.cmd("w")
  local term = fn.execute_horizontal_terminal("node " .. vim.fn.shellescape(vim.fn.expand("%:p")))
  term:toggle()
  fn.notify(
    "Running " .. vim.fn.expand("%:t"),
    vim.log.levels.INFO,
    "JavaScript Runner"
  )
end, { desc = "Run JavaScript in Terminal" })

-- TypeScript Compiler
map("n", "<leader>tc", function()
  vim.cmd("w")
  local term = fn.execute_horizontal_terminal("tsc " .. vim.fn.shellescape(vim.fn.expand("%:p")))
  term:toggle()
  fn.notify(
    "Compiling " .. vim.fn.expand("%:t"),
    vim.log.levels.INFO,
    "TypeScript Compiler"
  )
end, { desc = "Compile TypeScript" })

-- multi cursor sele