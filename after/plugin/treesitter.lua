require('nvim-treesitter').setup({
  install_dir = vim.fn.stdpath('data') .. '/site',
})

local parsers_to_install = { "javascript", "typescript", "c_sharp", "c", "cpp", "rust" }

local installed = require('nvim-treesitter.config').get_installed()
local missing = vim.tbl_filter(function(lang)
  return not vim.list_contains(installed, lang)
end, parsers_to_install)

if #missing > 0 then
  vim.schedule(function()
    require('nvim-treesitter').install(missing)
  end)
end

vim.api.nvim_create_autocmd('BufRead', {
  callback = function()
    local lang = vim.bo.filetype
    local parsers = require('nvim-treesitter.parsers')
    if lang and parsers[lang] and not vim.list_contains(
      require('nvim-treesitter.config').get_installed(), lang
    ) then
      require('nvim-treesitter').install({ lang })
    end
  end,
})
