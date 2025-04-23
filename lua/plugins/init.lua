return {
  -- Snacks
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      dashboard = {
        enabled = true
      },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      lazygit = {
        enabled = true,
      },
      word_ = {
        enabled = true,
        config = {
          debounce = 200,            -- time in ms to wait before updating
          notify_jump = false,       -- show a notification when jumping
          notify_end = true,         -- show a notification when reaching the end
          foldopen = true,           -- open folds after jumping
          jumplist = true,           -- set jump point before jumping
          modes = { "n", "i", "c" }, -- modes to show references
          filter = function(buf)     -- what buffers to enable `snacks.words`
            return vim.g.snacks_words ~= false and vim.b[buf].snacks_words ~= false
          end,
        },
      },
      scroll = {
        enabled = true,
        config = {
          animate = {
            duration = { step = 15, total = 250 },
            easing = "linear",
          },
          -- faster animation when repeating scroll after delay
          animate_repeat = {
            delay = 100, -- delay in ms before using the repeat animation
            duration = { step = 5, total = 50 },
            easing = "linear",
          },
          -- what buffers to animate
          filter = function(buf)
            return vim.g.snacks_scroll ~= false and vim.b[buf].snacks_scroll ~= false and
                vim.bo[buf].buftype ~= "terminal"
          end,
        }
      },
      zen = {
        enabled = true,
        config = {
          width = 120,
          height = 30,
        }
      }
    }
  },

  -- NvimTree
  {
    "nvim-tree/nvim-tree.lua",
    init = function()
      -- Prevent buffer from having swapfile
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "NvimTree_*",
        callback = function()
          vim.opt_local.swapfile = false
        end,
      })
    end,
  },

  -- Trouble
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      position = "bottom",
      height = 10,
      mode = "workspace_diagnostics",
      use_diagnostic_signs = true,
      action_keys = {
        close = "q",
        cancel = "<esc>",
        refresh = "r",
        jump = { "<cr>", "<tab>" },
        toggle_mode = "m",
        toggle_preview = "P",
        preview = "p",
        close_folds = { "zM", "zm" },
        open_folds = { "zR", "zr" },
        toggle_fold = { "zA", "za" },
        previous = "k",
        next = "j",
      },
    },
  },

  -- Conform
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- Lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
      signs                        = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged                 = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged_enable          = true,
      signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
      numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir                 = {
        follow_files = true
      },
      auto_attach                  = true,
      attach_to_untracked          = false,
      current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts      = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = true,
        virt_text_priority = 100,
        use_focus = true,
      },
      current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
      sign_priority                = 6,
      update_debounce              = 100,
      status_formatter             = nil,   -- Use default
      max_file_length              = 40000, -- Disable if file is longer than this (in lines)
      preview_config               = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
      on_attach                    = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- Gitsigns hunks
        map("n", "[h", ":Gitsigns prev_hunk<cr><cr>", "Git: Previous Hunk")
        map("n", "]h", ":Gitsigns next_hunk<cr><cr>", "Git: Next Hunk")
        map("n", "<leader>ph", ":Gitsigns preview_hunk<cr>", "Git: Preview Hunk")
        map("n", "<leader>pH", ":Gitsigns preview_hunk_inline<cr>", "Git: Preview Hunk Inline")
        map("n", "<leader>vh", ":Gitsigns select_hunk<cr>", "Git: Select Hunk")
        map("n", "<leader>sh", ":Gitsigns stage_hunk<cr>", "Git: Stage Hunk")
        map("n", "<leader>rh", ":Gitsigns reset_hunk<cr>", "Git: Reset Hunk")

        -- Additional useful keymaps
        map("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<cr>", "Git: Toggle Line Blame")
        map("n", "<leader>gd", ":Gitsigns diffthis<cr>", "Git: Diff This")
        map("n", "<leader>gD", ":Gitsigns diffthis ~<cr>", "Git: Diff This ~")
      end,
    },
  },

  -- nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",           -- Buffer completions
      "hrsh7th/cmp-path",             -- Path completions
      "hrsh7th/cmp-nvim-lsp",         -- LSP completions
      "hrsh7th/cmp-nvim-lua",         -- Lua completions
      "saadparwaiz1/cmp_luasnip",     -- Snippet completions
      "L3MON4D3/LuaSnip",             -- Snippet engine
      "rafamadriz/friendly-snippets", -- Snippet collection
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Load snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
            border = "rounded",
            max_width = 15,
            max_height = 10,
          },
          documentation = {
            border = "rounded",
            max_width = 50,
            max_height = 20,
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
          },
        },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
              nvim_lua = "[Lua]",
              crates = "[Crates]",
            })[entry.source.name]
            return vim_item
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
          }),

          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "rust",
        "python",
        "go",
        "javascript",
        "typescript",
        "lua",
        "vim",
        "vimdoc",
        "html",
        "css",
      },
    },
  },

  -- Lspsaga
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      ui = {
        border = "rounded",
        title = true,
      },
      hover = {
        max_width = 0.6,
        max_height = 0.6,
        open_link = 'gx',
      },
      diagnostic = {
        keys = {
          quit = { "q", "<ESC>" },
          exec_action = "o",
          toggle_action = "a",
        },
      },
      symbol_in_winbar = {
        enable = true,
        separator = " › ",
        hide_keyword = true,
      },
      code_action = {
        num_shortcut = true,
        show_server_name = true,
        keys = {
          quit = { "q", "<ESC>" },
          exec = "<CR>",
        },
      },
    },
  },

  -- Rustaceanvim
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false,   -- This plugin is already lazy
  },

  -- Crates
  {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('crates').setup {
        completion = {
          cmp = {
            enabled = true
          }
        }
      }

      -- Set up crates completion source for nvim-cmp specifically for Cargo.toml files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "toml",
        callback = function()
          local cmp = require("cmp")
          cmp.setup.buffer({
            sources = cmp.config.sources({
              { name = "crates" },
              { name = "nvim_lsp" },
              { name = "buffer" },
            })
          })
        end
      })
    end,
  },

  -- ToggleTerm
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
  },

  -- treesj
  {
    'Wansmer/treesj',
    keys = { '<space>m', '<space>j', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
    config = function()
      require('treesj').setup({ --[[ your config ]] })
    end,
  },

  -- live preview
  {
    'brianhuster/live-preview.nvim',
    event = { "FileType html" },
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('livepreview.config').set({
        port = 5500,
        browser = 'default',
        dynamic_root = false,
        sync_scroll = true,
        picker = "telescope",
      })
    end,
  }

}
