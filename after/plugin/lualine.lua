local glow = "#1bfd9c" 
local bg   = "#121212"
local fg   = "#cccccc"
local blk  = "#080808"

local my_theme = {
  normal = {
    a = { fg = fg,    bg = bg,   gui = 'bold' },
    b = { fg = fg,    bg = bg },
    c = { fg = "#7a7a7a", bg = bg },
  },
  insert = {
    a = { fg = blk,  bg = glow,  gui = 'bold' },
    b = { fg = fg,   bg = bg },
    c = { fg = "#7a7a7a", bg = bg },
  },
  visual = {
    a = { fg = blk,  bg = "#ffffff", gui = 'bold' },
    b = { fg = fg,   bg = bg },
    c = { fg = "#7a7a7a", bg = bg },
  },
  replace = {
    a = { fg = blk,  bg = "#fd1b7c", gui = 'bold' },
    b = { fg = fg,   bg = bg },
    c = { fg = "#7a7a7a", bg = bg },
  },
  command = {
    a = { fg = blk,  bg = "#708090", gui = 'bold' },
    b = { fg = fg,   bg = bg },
    c = { fg = "#7a7a7a", bg = bg },
  },
  inactive = {
    a = { fg = "#555555", bg = bg },
    b = { fg = "#555555", bg = bg },
    c = { fg = "#555555", bg = bg },
  },
}

local function short_mode()
  local mode = vim.fn.mode()
  local map = {
    n  = 'NORMAL',
    i  = 'INSERT',
    v  = 'VISUAL',
    V  = 'VISUAL',
    ['\22'] = 'VISUAL',
    c  = 'COMMAND',
    R  = 'REPLACE',
    t  = 'TERMINAL',
  }
  return map[mode] or mode
end

require('lualine').setup {
  options = {
    theme = my_theme,
    component_separators = '',
    section_separators   = '',
    globalstatus         = true,
  },
  sections = {
    lualine_a = { short_mode },
    lualine_b = { 'branch' },
    lualine_c = { { 'filename', icons_enabled = false, path = 1 } },
    lualine_x = { 'encoding' },
    lualine_y = { 'filetype' },
    lualine_z = { 'location' },
  },
}
