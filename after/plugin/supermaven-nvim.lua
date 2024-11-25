require("supermaven-nvim").setup {
  keymaps = {
    accept_suggestion = "<C-j>",
    clear_suggestion = "<C-]>",
    accept_word = "<A-j>",
  },
  condition = function()
    return false
  end
}
