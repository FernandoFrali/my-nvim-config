local dap = require('dap')

dap.adapters.go = {
  type = "server",
  port = "40000",
  executable = {
    command = "dlv",
    args = { "dap", "-l", "127.0.0.1:40000" },
  }
}

dap.configurations.go = {
  {
    type = "go",
    name = "Debug Server",
    request = "attach",
    mode = "remote",
    port = 40000,
    host = "127.0.0.1",
    program = "${workspaceFolder}/tmp/main",
  },
}

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
    args = { "--port", "${port}" }
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

dap.adapters["pwa-node"] = {
  type = "server",
  host = "127.0.0.1",
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug-adapter",

    args = { "${port}" },
  },
}

for _, language in ipairs { "typescript", "javascript", "javascriptreact", "typescriptreact" } do
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
      name = "Attach to process ID",
      processId = require('dap.utils').pick_process,
      cwd = "${workspaceFolder}",
      sourceMaps = true,
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to Node (9229)",
      port = 9229,
      host = "127.0.0.1",
      cwd = "${workspaceFolder}",
      sourceMaps = true,
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
    },
  }
end
