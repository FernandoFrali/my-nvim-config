local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lsp-file-operations").setup()
require('mason').setup({})
require('java').setup();

require('mason-lspconfig').setup({
  ensure_installed = { 'ts_ls', 'rust_analyzer', 'pyright', 'bashls', 'vimls', 'jsonls', 'yamlls', 'html', 'cssls', 'dockerls', 'terraformls', 'tailwindcss', 'efm', 'clangd', 'angularls', 'prismals', 'astro', 'gopls', 'biome', 'lua_ls', 'jdtls' },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({
        capabilities = capabilities,
      })
    end,
    lua_ls = function()
      require('lspconfig').lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })
    end,
  }
})

vim.lsp.config('ts_ls', {
  capabilities = capabilities,
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})

vim.lsp.enable('jdtls')

-- vim.lsp.config.omnisharp.setup({
--   cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
--   enable_roslyn_analyzers = true,
--   organize_imports_on_format = true,
--   enable_import_completion = true,
-- })
