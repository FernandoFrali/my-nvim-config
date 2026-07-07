function WorldIsNotGreyAnymore()
  require("monoglow").setup({
    on_colors = function(colors)
      colors.glow = "#5ca8ff"
    end,
    on_highlights = function(hl, c)
      hl.Boolean = { fg = "#7a7a7a", bold = true }
    end,
  })
  vim.cmd("colorscheme monoglow")
  vim.api.nvim_set_hl(0, "typescriptAssign", { fg = "#5ca8ff", bold = true })
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
end

WorldIsNotGreyAnymore()
