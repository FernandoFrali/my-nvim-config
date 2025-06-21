function WorldIsNotGreyAnymore(color)
    vim.opt.background = "dark"
    color = color or require("noirbuddy").setup()
    -- require("rose-pine").setup({
    --     disable_italics = true,
    --     disable_background = true,
    -- })
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1e1e2e", fg = "#7aa2f7" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none", fg = "#7a7a7a" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none", fg = "#b2b2b2" })
end

WorldIsNotGreyAnymore()
