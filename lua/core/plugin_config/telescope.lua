local t_status, telescope = pcall(require, "telescope")
local a_status, actions = pcall(require, "telescope.actions")

if (not t_status) then return end
if (not a_status) then return end

-- Keymap options
local opts = { noremap = true, silent = true }


-- Keymaps
vim.api.nvim_set_keymap('n', ';f',
    "<cmd>lua require('telescope.builtin').find_files({layout_strategy='bottom_pane', layout_config={width=0.45}})<cr>",
    opts)
vim.api.nvim_set_keymap('n', ';r',
    "<cmd>lua require('telescope.builtin').live_grep({layout_strategy='bottom_pane', layout_config={width=0.45}})<cr>",
    opts)
vim.api.nvim_set_keymap('n', ';rc',
    "<cmd>lua require('telescope.builtin').grep_string({layout_strategy='bottom_pane', layout_config={width=0.45}})<cr>",
    opts)
vim.api.nvim_set_keymap('n', ';pf',
    "<cmd>lua require('telescope.builtin').oldfiles({layout_strategy='bottom_pane', layout_config={height=0.45}})<cr>",
    opts)
vim.api.nvim_set_keymap('n', ';ps',
    "<cmd>lua require('telescope.builtin').search_history({layout_strategy='bottom_pane', layout_config={height=0.25}})<cr>",
    opts)
vim.api.nvim_set_keymap('n', ';k',
    "<cmd>lua require('telescope.builtin').keymaps({layout_strategy='bottom_pane', layout_config={height=0.25}})<cr>",
    opts)
vim.api.nvim_set_keymap('n', ';s',
    "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({layout_strategy='bottom_pane', layout_config={height=0.25}})<cr>",
    opts)
vim.api.nvim_set_keymap('n', ';b', "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
vim.api.nvim_set_keymap('n', ';;', "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)

-- Lua functions
local telescope_buffer_dir = function()
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
                ["<C-s>"] = actions.select_vertical,
                ['<C-j>'] = actions.cycle_history_next,
                ['<C-k>'] = actions.cycle_history_prev
            },
        },
        layout_config = {
            -- other layout configuration here
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        workspaces = {
            -- keep insert mode after selection in the picker, default is false
            keep_insert = true,
        }
    }
})

local extensions = {
    "fzf",
    "workspaces",
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
for e in ipairs(extensions) do
    telescope.load_extension(extensions[e])
end
