--hey
local config = {

  -- Set colorscheme
  colorscheme = "default_theme",

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
    clipboard = "" -- Connection to the system clipboard
      -- relativenumber = true, -- sets vim.opt.relativenumber
    },
    g = {
      -- mapleader = " ", -- sets vim.g.mapleader
      yadm_git_gitgutter_enabled = 0,
    },
  },


  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },
      {'justinmk/vim-sneak'},
      {'tpope/vim-surround'},
      {'nvim-lua/plenary.nvim'},
      {'mbbill/undotree'},
      -- {'bkad/CamelCaseMotion'},
      {'seanbreckenridge/yadm-git.vim'},
      {'tpope/vim-fugitive'},
      {'tpope/vim-repeat'},
      {'unblevable/quick-scope'},
      {'mfussenegger/nvim-dap'},
      {'Neevash/awesome-flutter-snippets'},
      { "nvim-telescope/telescope-file-browser.nvim",
      after = "telescope.nvim",
      config = function()
        print('file browswer')
        require("telescope").load_extension "file_browser"
      end,
    },
      {"folke/zen-mode.nvim",
        config = function()
          require("zen-mode").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
          }
        end
      },
    { "hrsh7th/cmp-cmdline",
      after = "nvim-cmp",
      config = function()
        astronvim.add_user_cmp_source "nvim-cmdline"
        require("cmp").setup.cmdline(':', {
          mapping = require("cmp").mapping.preset.cmdline(),
          sources =require("cmp").config.sources({
            { name = 'path' }
          }, {
            { name = 'cmdline' }
          })
        })
      end,
    },
      { "ethanholz/nvim-lastplace",
      config = function()
        require ("nvim-lastplace").setup()
      end,
    },
      {'rcarriga/nvim-dap-ui',
      after="nvim-dap",
      config =function ()
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup()
        dap.listeners.before.evet_stopped["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
      end
    },

      {
        "akinsho/flutter-tools.nvim",
        requires = "nvim-lua/plenary.nvim",
        after = "nvim-lsp-installer", -- make sure to load after nvim-lsp-installer
        config = function()
          require("flutter-tools").setup {
            lsp = astronvim.lsp.server_settings "dartls", -- get the server settings and built in capabilities/on_attach
            debugger = { -- integrate with nvim dap + install dart code debugger
            run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
            enabled = true,
            register_configurations = function(paths)
              print('dap registered')
              require("dap.ext.vscode").load_launchjs()

              require("dap").configurations.dart = { {
                type = "dart",
                request = "launch",
                name = "nvim flutter launcher",
                flutterMode = "debug",
                -- dartSdkPath = paths["dart_sdk"],
                -- flutterSdkPath = paths["flutter_sdk"],
                program = "${workspaceFolder}/lib/main.dart",
                cwd = "${workspaceFolder}",
                args = { "--no-sound-null-safety" }
              } }

              require("dap").adapters.dart = {
                type = "executable",
                command = "node",
                args = { "/Users/cankaraman/StudioProjects/Dart-Code/out/dist/debug.js", "flutter" }
              }
            end,
          },
          fvm = true,
        }
      end,
    },
    -- { "andweeb/presence.nvim" },
    -- You can also add new plugins here as well:
    -- { "andweeb/presence.nvim" },
    -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
        --     require("lsp_signature").setup()
        --   end,
        -- },
        --
        -- You can disable the lazy loading of session managemer if you like. You can put something like this in your plugins.init table and then do a PackerSync
        --
        -- ["Shatur/neovim-session-manager"] = {
          --   module = "",
          --   cmd = "",
          --   event = "",
          -- },
        },
        ["hrsh7th/cmp-cmdline"] = {
          after = "nvim-cmp",
          config = function()
            astronvim.add_user_cmp_source "cmdline"
          end,
        },
        -- { "nvim-telescope/telescope-file-browser.nvim" },
        -- ["nvim-telescope/telescope-file-browser.nvim"] = {
        --   after = "telescope.nvim",
        --   config = function()
        --     require("telescope").load_extension "file_browser"
        --   end,
        -- },
        -- ["hrsh7th/cmp-cmdline"] = {
          --   after = "nvim-cmp",
          --   config = function()
            --     astronvim.add_user_cmp_source "nvim_lsp"
            --     require("cmp").setup.cmdline(':', {
              --       mapping = require("cmp").mapping.preset.cmdline(),
              --       sources =require("cmp").config.sources({
                --         { name = 'path' }
                --       }, {
                  --         { name = 'cmdline' }
                  --       })
                  --     })
                  --   end,
                  -- },

    ["session_manager"] = function(config)
      config.autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir
      config.autosave_last_session = true
      return config
    end,
    treesitter = {
      ensure_installed = { "lua", "dart", "vim"},
    },
    ["nvim-lsp-installer"] = {
      ensure_installed = { "sumneko_lua", "vimls", "dartls" },
    },
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {vim.fn.stdpath('data') .. "site/pack/packer/start/awesome-flutter-snippets"},
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },
  cmp = {
    source_priority = {
      cmdline = 200

    }
  },
 -- require("cmp").setup.cmdline(':', {
 --    mapping = require("cmp").mapping.preset.cmdline(),
 --    sources =require("cmp").config.sources({
 --      { name = 'path' }
 --    }, {
 --      { name = 'cmdline' }
 --    })
 --  })
  -- ["hrsh7th/cmp-nvim-lsp"] = {
  --   after = "nvim-cmp",
  --   config = function()
  --     astronvim.add_user_cmp_source "nvim_lsp"
  --   end,
  -- },


  -- Extend LSP configuration
   lsp = {
    skip_setup = { "dartls" }, -- skip lsp setup because flutter-tools will do it itself
    ["server-settings"] = {
      dartls = {
        -- init_options = {
        --   closingLabels = true,
        -- },
        -- callbacks = {
        --   -- get_callback can be called with or without arguments
        --   ['dart/textDocument/publishClosingLabels'] = require('lsp_extensions.dart.closing_labels').get_callback({ highlight = "Special", prefix = " >> " }),
        -- },

        -- color = {
        --   enabled = true,
        -- },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
        },
      },
    },
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings
    register_mappings = {
      i = {
        ["<C-r>"] = {
          ["<C-r>"] =  {"<C-r>\"", "paste default"}
        }
      },
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          ["b"] = {
            ["a"] = { "<cmd>%bd|e#<cr>", "Close all buffers except active" },
            ["q"] = { "<cmd>cclose<cr>", "Close quickfix" },
            ["c"] = { "<cmd>bd<cr>", "Close active buffer" },
            name="buffer actions"
        },
          -- which-key registration table for normal mode, leader prefix
          ["gm"] = { ":Gitsigns diffthis master", "Diff with branch" },
          ["fa"] = { "<cmd>Telescope<cr>", "Telescope all" },
          ["ft"] = { "<cmd>Telescope file_browser<cr>", "Telescope file tree" },
          ["fc"] = { "<cmd>Telescope commands<cr>", "Search commands" },
          ["fdf"] = { "<cmd>lua require('telescope.builtin').find_files{ search_dirs={'%:h'} }<cr>", "Search file in buffer's directory" },
          ["fdw"] = { "<cmd>lua require('telescope.builtin').live_grep{ search_dirs={'%:p'} }<cr>", "Search word in the current buffer" },
          ["v"] = { "<cmd>split $MYVIMRC<cr>", "Open init.lua" },
          ["z"] = { "<cmd>ZenMode<cr>", "Toggle ZenMode" },
          -- ["r"] ={"", "Flutter"},
        ["r"] = {
          ["n"] = { "<cmd>FlutterRun --no-sound-null-safety<cr>", "Flutter run --no-sound-null-safety" },
          ["s"] = { "<cmd>FlutterRun<cr>", "Flutter run" },
          ["q"] = { "<cmd>FlutterQuit<cr>", "Flutter quit" },
          ["c"] = { "<cmd>FlutterCopyProfilerUrl<cr>", "Flutter copy devtools url" },
          ["r"] = { "<cmd>FlutterReload<cr>", "Flutter reload" },
          ["R"] = { "<cmd>FlutterRestart<cr>", "Flutter restart" },
          ["e"] = { "<cmd>FlutterEmulators<cr>", "Flutter emulators" },
          name="Flutter"
        }
        },
      },
    },
  },
  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    -- Set key bindings
    --
    local map = vim.keymap.set
    local opts = { noremap = true}
    vim.keymap.set("c", "<C-r><C-r>", "<C-r>\"", opts)
    -- vim.keymap.set("n", "Y", "yg_", opts)
    vim.keymap.set("n", "<C-g>", ":%s//gc<left><left><left>", opts)
    vim.keymap.set("v", "<C-c>", "\"+y", opts)
    vim.keymap.set("v", "p", "\"_dP", opts)
    vim.keymap.set("n", "<leader>a", "gg<S-v>G", { noremap = true, desc = "Select all" })

    vim.keymap.set("i", "<C-l>", "<right>", opts)
    vim.keymap.set("i", "<C-h>", "<left>", opts)
    -- might be problematic
    vim.keymap.set("i", "<C-k>", "<up>", opts)
    vim.keymap.set("i", "<C-j>", "<down>", opts)

    vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { noremap = true, desc = "Next buffer tab" })
    vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { noremap = true, desc = "Previous buffer tab" })
    vim.keymap.set("n", "L", "$", { noremap = true, desc = "End of the line" })
    vim.keymap.set("n", "H", "^", { noremap = true, desc = "Beginning of the line" })
    vim.keymap.set("o", "L", "$", { noremap = true, desc = "End of the line" })
    vim.keymap.set("o", "H", "^", { noremap = true, desc = "Beginning of the line" })
    vim.keymap.set("v", "L", "$", { noremap = true, desc = "End of the line" })
    vim.keymap.set("v", "H", "^", { noremap = true, desc = "Beginning of the line" })

    vim.keymap.set("v", "<c-x>", "<esc>wa", { noremap = true, desc = "append to next word" })


    map("n", "<leader-Up>", function()
      require("smart-splits").resize_up()
    end, { desc = "Resize split up" })
    map("n", "<leader><Down>", function()
      require("smart-splits").resize_down()
    end, { desc = "Resize split down" })
    map("n", "<leader><Left>", function()
      require("smart-splits").resize_left()
    end, { desc = "Resize split left" })
    map("n", "<leader><Right>", function()
      require("smart-splits").resize_right()
    end, { desc = "Resize split right" })
    -- Set autocommands
    vim.api.nvim_create_augroup("yanker", { clear = true })
    vim.api.nvim_create_autocmd("TextYankPost", {
      desc = "Highlight yank",
      group = "yanker",
      pattern = "*",
      command = "silent! lua vim.highlight.on_yank({higroup='IncSearch', timeout=200})",
    })
    vim.api.nvim_command('SessionManager! load_current_dir_session')

    -- old sets
    -- set number
    -- set relativenumber
    -- set nohlsearch
    -- set hidden
    -- set noerrorbells
    -- set nowrap
    -- set ignorecase
    -- set smartcase
    -- set incsearch
    -- set scrolloff=8
    -- set completeopt=menuone,noinsert,noselect
    -- set signcolumn=yes
    -- set colorcolumn=80
    -- set cmdheight=2
    -- set splitright
    -- set pastetoggle=<F2>
    -- set mouse=a


    vim.api.nvim_set_option('cmdheight', 2)
    vim.api.nvim_set_option('scrolloff', 8)
    vim.api.nvim_set_option('splitright', true)
    vim.api.nvim_set_option('colorcolumn', "80")

    -- to run vimscript
    -- vim.cmd [[
    -- ANY VIMSCRIPT HERE
    -- ]]
  end,
}

return config
