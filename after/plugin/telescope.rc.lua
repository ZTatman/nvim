
local t_status, telescope = pcall(require, "telescope")
local a_status, actions = pcall(require, "telescope.actions")
local b_status, builtin = pcall(require, 'telescope.builtin')

if (not t_status) then return end 
if (not a_status) then return end 
if (not b_status) then return end 

-- Keymap options
local opts = { noremap = true, silent = true }


-- Keymaps
vim.api.nvim_set_keymap('n', ';f', "<cmd>lua require('telescope.builtin').find_files({layout_strategy='bottom_pane', layout_config={width=0.45}})<cr>", opts)
vim.api.nvim_set_keymap('n', ';r', "<cmd>lua require('telescope.builtin').live_grep({layout_strategy='bottom_pane', layout_config={width=0.45}})<cr>", opts)
vim.api.nvim_set_keymap('n', ';pf', "<cmd>lua require('telescope.builtin').oldfiles({layout_strategy='bottom_pane', layout_config={height=0.45}})<cr>", opts)
vim.api.nvim_set_keymap('n', ';ps', "<cmd>lua require('telescope.builtin').search_history({layout_strategy='bottom_pane', layout_config={height=0.25}})<cr>", opts)
vim.api.nvim_set_keymap('n', ';k', "<cmd>lua require('telescope.builtin').keymaps({layout_strategy='bottom_pane', layout_config={height=0.25}})<cr>", opts)
vim.api.nvim_set_keymap('n', ';s', "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({layout_strategy='bottom_pane', layout_config={height=0.25}})<cr>", opts)
vim.api.nvim_set_keymap('n', '\\', "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
vim.api.nvim_set_keymap('n', ';;', "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)

-- Lua functions
function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

-- Telescope setup
telescope.setup({
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
        ["<C-s>"] = actions.select_vertical,
      },
      i = {
        ["Q"] = actions.close,
        ["<C-s>"] = actions.select_vertical
      },
    },
    layout_config = {
      -- other layout configuration here
    },
  }
})
