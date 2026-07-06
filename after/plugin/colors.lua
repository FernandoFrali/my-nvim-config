function WorldIsNotGreyAnymore()
  vim.cmd("colorscheme monoglow")
  vim.api.nvim_set_hl(0, "typescriptAssign", { fg = "#1bfd9c", bold = true })
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
end

WorldIsNotGreyAnymore()
