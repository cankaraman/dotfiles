-- print('test')
require("flutter-tools").setup {
    debugger = { -- integrate with nvim dap + install dart code debugger
        run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
        enabled = true,
        register_configurations = function(paths)
            print('config dap')
            -- for k, v in pairs(paths) do
            --     print(k)
            --     print(v)
            -- end
            print(paths["dart_sdk"])
            -- TODO configure this
            require("dap").configurations.dart = { {
                type = "dart",
                request = "launch",
                name = "Launch flutter",
                flutterMode = "debug",
                -- dartSdkPath = paths["dart_sdk"],
                -- flutterSdkPath = paths["flutter_sdk"],
                program = "${workspaceFolder}/lib/main.dart",
                cwd = "${workspaceFolder}",
            } }
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
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-p>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', Opts_for_dart_maps)
            -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', Opts_for_dart_maps)
            -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', Opts_for_dart_maps)
            -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', Opts_for_dart_maps)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', Opts_for_dart_maps)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', Opts_for_dart_maps)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', Opts_for_dart_maps)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', Opts_for_dart_maps)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', Opts_for_dart_maps)
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
