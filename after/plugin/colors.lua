function WorldIsNotGreyAnymore(color)
  -- color = color or require('binary').setup(
  --   {
  --     style = "dark",
  --     colors = {
  --       fg = "#000000",
  --       bg = "#ffffff",
  --     },
  --     use_default_reversed_group = true,
  --     -- reversed_group = {},
  --   }
  -- )


  vim.cmd.colorscheme(color or "zenwritten")
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "LineNr", { bg = "none", fg = "#7a7a7a" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none", fg = "#ffffff" })
  -- vim.api.nvim_set_hl(0, "Visual", { bg = "red", fg = "black" })

  -- vim.api.nvim_set_hl(0, "Number", { bg = "none", fg = "red" })
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e" })
  -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1e1e2e", fg = "#ffffff" })
  -- vim.api.nvim_set_hl(0, "Visual", { bg = "#CED773", fg = "black" })
end

WorldIsNotGreyAnymore()
