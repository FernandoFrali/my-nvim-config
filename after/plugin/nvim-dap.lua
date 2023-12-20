require('dap').adapters['pwa-node'] = {
    type = "server",
    host = "127.0.0.1",
    port = 8123,
    executable = {
        command = "js-debug-adapter",
    }
}

require('dap-vscode-js').setup({
    adapters = { 'pwa-node', 'node-terminal', 'chrome', 'pwa-chrome', 'pwa-msedge', 'pwa-extensionHost', 'node'},
})

for _, language in ipairs { "typescript", "javascript", "typescriptreact" } do
    require("dap").configurations[language] = {
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
        }
    }
end
