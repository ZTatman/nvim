local autocmd = vim.api.nvim_create_autocmd

-- Format on save
autocmd("BufWritePre", {
  pattern = "*.lua",
  callback = function()
    -- vim.lsp.buf.format()
    require("conform").format()
  end,
})

-- Enable snacks.words for relevant buffers
-- autocmd("BufEnter", {
--   callback = function()
--     local buftype = vim.bo.buftype
--     local filetype = vim.bo.filetype
--     local bufname = vim.api.nvim_buf_get_name(0)
    
--     -- List of buffer types and filetypes to exclude
--     local excluded_buftypes = {
--       "nofile",    -- scratch buffers
--       "prompt",    -- prompt buffers
--       "terminal",  -- terminal buffers
--       "quickfix",  -- quickfix buffers
--     }
    
--     local excluded_filetypes = {
--       "help",      -- help buffers
--       "qf",        -- quickfix
--       "dashboard", -- dashboard
--     }
    
--     -- List of buffer names to exclude
--     local excluded_bufnames = {
--       "snacks_dashboard",
--       "NvimTree",
--       "Trouble",
--     }
    
--     -- Check if current buffer should be excluded
--     local should_exclude = 
--       vim.tbl_contains(excluded_buftypes, buftype) or
--       vim.tbl_contains(excluded_filetypes, filetype) or
--       vim.tbl_contains(excluded_bufnames, vim.fn.fnamemodify(bufname, ":t"))
    
--     if not should_exclude then
--       require("snacks").words.enable()
--     end
--   end,
-- })

-- Enable snacks.scroll for relevant buffers
-- autocmd("BufEnter", {
--   callback = function()
--     local buftype = vim.bo.buftype
--     local filetype = vim.bo.filetype
--     local bufname = vim.api.nvim_buf_get_name(0)
    
--     -- List of buffer types and filetypes to exclude
--     local excluded_buftypes = {
--       "nofile",    -- scratch buffers
--       "prompt",    -- prompt buffers
--       "terminal",  -- terminal buffers
--       "quickfix",  -- quickfix buffers
--       "nofile",    -- scratch buffers
--     }
    
--     local excluded_filetypes = {
--       "help",      -- help buffers
--       "qf",        -- quickfix
--       "dashboard", -- dashboard
--       "man",       -- man pages
--     }
    
--     -- List of buffer names to exclude
--     local excluded_bufnames = {
--       "snacks_dashboard",
--       "NvimTree",
--       "Trouble",
--       "TelescopePrompt",
--       "DressingInput",
--     }
    
--     -- Check if current buffer should be excluded
--     local should_exclude = 
--       vim.tbl_contains(excluded_buftypes, buftype) or
--       vim.tbl_contains(excluded_filetypes, filetype) or
--       vim.tbl_contains(excluded_bufnames, vim.fn.fnamemodify(bufname, ":t"))
    
--     if not should_exclude then
--       require("snacks").scroll.enable()
--     end
--   end,
-- })

-- Highlight yanked text
autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

-- Auto-save HTML files on leaving insert mode for live preview
autocmd("InsertLeave", {
  pattern = "*.html",
  callback = function()
    if vim.bo.modifiable then
      vim.cmd("silent! write")
    end
  end,
})