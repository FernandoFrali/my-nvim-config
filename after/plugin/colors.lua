function WorldIsNotGreyAnymore(color)
    color = color or "oxocarbon"
    -- require("rose-pine").setup({
    --     disable_italics = true,
    --     disable_background = true,
    -- })
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
end

WorldIsNotGreyAnymore()
