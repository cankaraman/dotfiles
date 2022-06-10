if not vim.g.vscode then
    local dap, dapui = require("dap"), require("dapui")
    dapui.setup()
    dap.listeners.before.event_stopped["dapui_config"] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end

    -- TODO further configure this
    -- TODO nerdfonts
    vim.api.nvim_set_keymap('n', '<leader>tb', "<cmd>lua require('dap').toggle_breakpoint()<cr>", { noremap = true })
    vim.api.nvim_set_keymap('n', '<leader>co', "<cmd>lua require('dap').continue()<cr>", { noremap = true })
end
