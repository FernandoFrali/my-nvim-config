function WorldIsNotGreyAnymore(color)
    color = color or "nord"
    vim.g.nord_contrast = true
    vim.g.nord_borders = false
    vim.g.nord_disable_background = true
    vim.g.nord_italic = false
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = true
    vim.cmd.colorscheme(color)

    --    vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
end

WorldIsNotGreyAnymore()
