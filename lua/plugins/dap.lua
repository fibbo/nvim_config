return {
  "mfussenegger/nvim-dap",
  opts = function()
    local dap = require("dap")
    dap.adapters.lldb = {
      type = "executable",
      port = 0,
      command = "/usr/local/bin/lldb-vscode",
      name = "lldb",
    }

    dap.adapters.python = {
      type = "executable",
      command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
      args = { "-m", "debugpy.adapter" },
    }

    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          return "python"
        end,
      },
      {
        type = "python",
        request = "launch",
        name = "Test with pytest",
        program = "-m pytest test/",
        pythonPath = function()
          return "python"
        end,
      },
      -- Add config with arguments
      {
        type = "python",
        request = "launch",
        name = "Launch file with arguments",
        program = "${file}",
        args = { "41843-41919" },
        pythonPath = function()
          return "python"
        end,
      },
    }

    dap.configurations.cpp = {
      {
        name = "Launch lldb",
        type = "lldb", -- matches the adapter
        request = "launch", -- could also attach to a currently running process
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        runInTerminal = false,
      },
      {
        name = "Attach to Process",
        type = "lldb",
        request = "attach",
        postRunCommands = { "process handle SIGUSR1 -n true -p true -s false" },
        pid = function()
          local ret = require("dap.utils").pick_process()
          if ret == nil then
            print("pick_process returned nil.")
          end
          return ret
        end,
      },
      {
        name = "tiny without maxidle",
        type = "lldb", -- matches the adapter
        request = "launch", -- could also attach to a currently running process
        program = "${workspaceFolder}/build/bin/labone-tiny",
        stopOnEntry = false,
        args = { "--max-idle", "-1" },
        runInTerminal = false,
      },
    }
    --vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg=0, bg='#31353f' })
    --vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg=0, fg='#61afef', bg='#31353f' })
    --vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg=0, fg='#98c379', bg='#31353f' })
    vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
    vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
    vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })
  end,
}
