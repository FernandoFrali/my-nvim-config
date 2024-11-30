local dap = require('dap')

dap.adapters['pwa-node'] = {
    type = "server",
    host = "127.0.0.1",
    port = 8123,
    executable = {
        command = "js-debug-adapter",
    }
}

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = "/Users/fernandofrali/.local/share/nvim/mason/bin/codelldb",
        args = {"--port", "${port}"}
    },
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require('dap-vscode-js').setup({
    adapters = { 'pwa-node', 'node-terminal', 'chrome', 'pwa-chrome', 'pwa-msedge', 'pwa-extensionHost', 'node'},
    debugger_path = "/Users/fernandofrali/.local/share/nvim/site/vscode-js-debug"
})

for _, language in ipairs { "typescript", "javascript", "typescriptreact" } do
    dap.configurations[language] = {
        {
            type = "pwa-node",
            request = "launch",
            entryPoint = "main",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach to Process",
            processId = require'dap.utils'.pick_process,
            cwd = "${workspaceFolder}",
        },
        {
            type = "bun",
            request = "launch",
            name = "Debug Bun",
            program = "${workspaceFolder}/src/v3/app.ts",
            cwd = "${workspaceFolder}",
            watch = true,
            runtimeExecutable = "bun",
        },
    }
end
