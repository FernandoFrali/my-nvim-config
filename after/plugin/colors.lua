
function WorldIsNotGreyAnymore(color)
	color = color or "sonokai"
    vim.g.sonokai_transparent_background = "1"
    vim.g.sonokai_enable_italic = "1"
    vim.g.sonokai_style = "andromeda"
	vim.cmd.colorscheme(color)

 --    vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
end

WorldIsNotGreyAnymore()
