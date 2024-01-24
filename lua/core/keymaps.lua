-- local diff = require "core.utils.diff"
local fn = require("core.util.functions")
local u = require("core.util.utils")
local P = {}
keymaps = P

local opts = { noremap = false, silent = true }

-- General Keymaps --
function map_base_keys()
    vim.g.mapleader = '\\'

    -- Open Mason and LspInfo
    u.create_map('n', '<leader>m', '<cmd>:Mason<cr>', opts)
    u.create_map('n', '<leader>l', '<cmd>:Lazy<cr>', opts)
    u.create_map('n', '<leader>li', '<cmd>:LspInfo<cr>', opts)

    -- Help
    u.create_map('n', '<leader>hh', '<cmd>:Help<cr>', opts)
    u.create_map('n', '<leader>hw', '<cmd>:HelpWord<cr>', opts)
    u.create_map('n', '<leader>hg', '<cmd>:HelpGrep<cr>', opts)

    -- Remap exit insert
    u.create_map('i', '<c-space>', '<ESC>', opts)

    -- Move faster between windows
    u.create_map('n', '<C-h>', '<C-w>h', opts)
    u.create_map('n', '<C-j>', '<C-w>j', opts)
    u.create_map('n', '<C-k>', '<C-w>k', opts)
    u.create_map('n', '<C-l>', '<C-w>l', opts)

    -- Source files and init vim
    u.create_map('n', '<leader>ev', ':vsplit $MYVIMRC<cr>', opts)
    u.create_map('n', '<leader>sv', ':source $MYVIMRC<cr>', opts)
    u.create_map('n', '<leader>so', ':source %<cr>', opts)

    -- Remap undo
    u.create_map('n', '<c-z>', 'u', opts)
    u.create_map('i', '<c-z>', '<c-o>u', opts)

    -- Remap substitute
    u.create_map('n', '<leader>s', ':%s/', opts);
    u.create_map('n', '<leader>r', fn.substitute_word_under_cursor, opts)
    u.create_map('n', '<leader>ri', fn.substitute_word_under_cursor_insensitive, opts)

    -- Remap write to buffer
    u.create_map('i', '<c-s>', '<C-O>:update<cr>', opts)

    -- Remap half-page up/down
    u.create_map('n', '<c-u>', '<c-u>zz', opts)
    u.create_map('n', '<c-d>', '<c-d>zz', opts)

    -- Navigate up/down to first non blank character of line
    u.create_map('i', '<c-k>', '<ESC><Up><ESC>^i', opts)
    u.create_map('i', '<c-j>', '<ESC><Down><ESC>^i', opts)

    -- Move lines up and down
    u.create_map('n', '<Space>k', ':m .-2<cr>==', opts)
    u.create_map('n', '<Space>j', ':m .+1<cr>==', opts)
    u.create_map('v', '<Space>j', ':m \'>+1<cr>gv=gv', opts)
    u.create_map('v', '<Space>k', ':m \'<-2<cr>gv=gv', opts)

    -- Exit insert mode
    u.create_map('i', '<c-space>', '<Esc>', opts)

    -- Toggle nvim-tree
    u.create_map('n', '<c-b>', ':NvimTreeToggle<cr>', opts)
    u.create_map('n', '<c-f>', ':NvimTreeFindFile<cr>', opts)

    -- Clear highlight
    u.create_map('n', '<space><leader>', ':nohlsearch<cr>', opts)

    -- Print highlight group under cursor
    u.create_map('n',
        '<leader>hi',
        function()
            local result = vim.treesitter.get_captures_at_cursor(0)
            print(vim.inspect(result))
        end, opts
    )
    u.create_map('n', '<leader>hl', fn.print_hl_under_cursor, opts)

    -- Tab create, delete, navigation
    u.create_map('n', 'tn', ':tabnew<cr>', opts)
    u.create_map('n', 'tnf', ':tabnew<space>', opts)
    u.create_map('n', '[t', ':tabprevious<cr>', opts)
    u.create_map('n', ']t', ':tabnext<cr>', opts)
    u.create_map('n', 'tq', ':confirm tabclose<cr>', opts)
    u.create_map('n', 'tl', ':tabs<cr>', opts)

    -- Bufferline Keymaps
    u.create_map('n', '<leader>bs', ':BufferLineSortByTabs<cr>', opts)

    -- Format Buffer
    u.create_map('n', '<leader>f', ':Format<cr>', opts)

    -- Select All
    u.create_map('n', '<c-a>', 'gg<S-v>G', opts)

    -- Sort Tailwind Classes
    u.create_map('n', '<leader>ts', ':TailwindSort<cr>', opts)

    -- Resize Vertical Splits
    u.create_map('n', '<leader>=', '<C-w>=', opts)
    u.create_map('n', '<leader>>', '<C-w>50>', opts)
    u.create_map('n', '<leader><', '<C-w>50<', opts)

    -- Toggle expand/collapse blocks
    u.create_map('n', '<space>m', ':TSJToggle<cr>', opts)

    -- Gitsigns hunks
    u.create_map('n', '[h', ':Gitsigns prev_hunk<cr>', opts)
    u.create_map('n', ']h', ':Gitsigns next_hunk<cr>', opts)
    u.create_map('n', 'ph', ':Gitsigns preview_hunk<cr>', opts)
    u.create_map('n', 'vh', ':Gitsigns select_hunk<cr>', opts)
    u.create_map('n', 'sh', ':Gitsigns stage_hunk<cr>', opts)
    u.create_map('n', 'rh', ':Gitsigns reset_hunk<cr>', opts)

    -- Git diff this file
    u.create_map('n', '<leader>df', '<cmd>lua require("core.util.diff")()<cr>', opts)

    -- Git conflicts
    u.create_map('n', '[c', ':GitConflictPrevConflict<cr>', opts)
    u.create_map('n', ']c', ':GitConflictNextConflict<cr>', opts)

    -- Copy buffer file name
    u.create_map('n', '<leader>cf', '<cmd>let @+ = expand("%:t")<cr>', opts)
    -- Copy buffer relative path 
    u.create_map('n', '<leader>cr', '<cmd>let @+ = expand("%")<cr>', opts)
    -- Copy buffer absolute path
    u.create_map('n', '<leader>ca', '<cmd>let @+ = expand("%:p")<cr>', opts)
end

-- LSP Keymaps --
function map_lsp_keys()
    u.create_map('n', "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
    u.create_map("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
    u.create_map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    u.create_map("n", "gp", "<cmd>Lspsaga peek_definition<cr>", opts)
    u.create_map("n", "gt", "<cmd>Lspsaga peek_type_definition<cr>", opts)
    u.create_map("n", "<space>f", "<cmd>Lspsaga finder<cr>", opts)

    u.create_map("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
    u.create_map("n", "rn", "<cmd>Lspsaga rename<cr>", opts)
    u.create_map("n", "<leader>o", "<cmd>Lspsaga outline<cr>", opts)
    u.create_map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
    u.create_map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
    u.create_map("n", "<leader>es", "<cmd>EslintFixAll<cr>", opts)
    vim.cmd [[ command! Format execute "lua vim.lsp.buf.format({ async = true })" ]]

    -- Trouble.nvim Keymaps
    u.create_map("n", "<leader>t", "<cmd>TroubleToggle<cr>", opts)
    u.create_map("n", "<leader>tq", "<cmd>TroubleToggle quickfix<cr>", opts)
    u.create_map("n", "<leader>tl", "<cmd>TroubleToggle loclist<cr>", opts)
    u.create_map("n", "gr", "<cmd>TroubleToggle lsp_references<cr>", opts)
    u.create_map("n", "<leader>d", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
    u.create_map("n", "<leader>D", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
end

-- Java Keymaps --
function P.map_java_keys()
    map_lsp_keys()

    local spring_boot_run_command =
    ':lua require("toggleterm").exec("mvn spring-boot:run -Dspring-boot.run.profiles=local")<cr>'
    local mvn_clean_install_command = ':lua require("toggleterm").exec("mvn clean install -U")<cr>'
    local mcv_dependency_sources = 'lua:require("toggleterm).exec("mvn dependency:sources)<cr>'

    u.create_map('n', '<leader>sr', spring_boot_run_command, opts)
    u.create_map('n', '<leader>ci', mvn_clean_install_command, opts)
    u.create_map('n', '<leader>sc', mcv_dependency_sources, opts)
    u.create_map('n', '<leader>oi', ':lua require("jdtls").organize_imports()<cr>', opts)
    u.create_map('n', '<leader>jc', ':lua require("jdtls").compile("incremental")<cr>', opts)
end

map_base_keys()

return P
