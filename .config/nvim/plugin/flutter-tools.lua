if not vim.g.vscode then
    -- print('test')
    require("flutter-tools").setup {
        debugger = { -- integrate with nvim dap + install dart code debugger
            run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
            enabled = true,
            register_configurations = function(paths)
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
                require("dap.ext.vscode").load_launchjs()
            end,
        },
        fvm = true,
        lsp = {
            -- color = { -- show the derived colours for dart variables
            --   enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
            --   background = false, -- highlight the background
            --   foreground = false, -- highlight the foreground
            --   virtual_text = true, -- show the highlight using virtual text
            --   virtual_text_str = "■", -- the virtual text character to highlight
            --
            -- },
            init_options = {
                closingLabels = true,
            },
            callbacks = {
                -- get_callback can be called with or without arguments
                ['dart/textDocument/publishClosingLabels'] = require('lsp_extensions.dart.closing_labels').get_callback({ highlight = "Special", prefix = " >> " }),
            },

            on_attach = function(client, bufnr)
                -- print("dart attached")
                -- Enable completion triggered by <c-x><c-o>
                -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                -- Mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', Opts_for_dart_maps)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', Opts_for_dart_maps)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', Opts_for_dart_maps)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', Opts_for_dart_maps)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', Opts_for_dart_maps)
                -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', Opts_for_dart_maps)
                -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', Opts_for_dart_maps)
                -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', Opts_for_dart_maps)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ld', '<cmd>lua vim.lsp.buf.type_definition()<CR>', Opts_for_dart_maps)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', Opts_for_dart_maps)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', Opts_for_dart_maps)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', Opts_for_dart_maps)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fa', '<cmd>lua vim.lsp.buf.formatting()<CR>', Opts_for_dart_maps)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', '<cmd>lua vim.diagnostic.setqflist()<cr>', { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ll', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lt', '<cmd>TroubleToggle<cr>', { noremap = true, silent = true })
            end

            -- capabilities = my_custom_capabilities -- e.g. lsp_status capabilities
            --- OR you can specify a function to deactivate or change or control how the config is created
            -- capabilities = function(config)
            --   config.specificThingIDontWant = false
            --   return config
            -- end,
            -- -- see the link below for details on each option:
            -- -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
            -- settings = {
            --   showTodos = true,
            --   completeFunctionCalls = true,
            --   analysisExcludedFolders = {"<path-to-flutter-sdk-packages>"},
            --   renameFilesWithClasses = "prompt", -- "always"
            --   enableSnippets = true,
            -- }

        }
    }
    Opts_for_dart_maps = { noremap = true, silent = true }
end
