local my_theme = {
  normal = {
    a = { fg = '#ffffff', bg = '#1C1C1C', gui = 'bold' },
    b = { fg = '#ffffff', bg = '#1C1C1C' },
    c = { fg = '#ffffff', bg = '#1C1C1C' },
  },
  insert = {
    a = { fg = '#ffffff', bg = '#1C1C1C', gui = 'bold' },
    b = { fg = '#ffffff', bg = '#1C1C1C' },
    c = { fg = '#ffffff', bg = '#1C1C1C' },
  },
  visual = {
    a = { fg = '#ffffff', bg = '#1C1C1C', gui = 'bold' },
    b = { fg = '#ffffff', bg = '#1C1C1C' },
    c = { fg = '#ffffff', bg = '#1C1C1C' },
  },
  replace = {
    a = { fg = '#ffffff', bg = '#1C1C1C', gui = 'bold' },
    b = { fg = '#ffffff', bg = '#1C1C1C' },
    c = { fg = '#ffffff', bg = '#1C1C1C' },
  },
  command = {
    a = { fg = '#ffffff', bg = '#1C1C1C', gui = 'bold' },
    b = { fg = '#ffffff', bg = '#1C1C1C' },
    c = { fg = '#ffffff', bg = '#1C1C1C' },
  },
  inactive = {
    a = { fg = '#ffffff', bg = '#1C1C1C' },
    b = { fg = '#ffffff', bg = '#1C1C1C' },
    c = { fg = '#ffffff', bg = '#1C1C1C' },
  },
}

local function short_mode()
  local mode = vim.fn.mode()
  local map = {
    n = 'N',
    i = 'I',
    v = 'V',
    V = 'V',
    ['\22'] = 'V',
    c = 'C',
    R = 'R',
    t = 'T',
  }
  return map[mode] or mode
end

require('lualine').setup {
  options = {
    theme = my_theme,
    component_separators = '',
    section_separators = '',
    globalstatus = true,
  },
  sections = {
    lualine_a = { short_mode },
    lualine_b = { 'branch' },
    lualine_c = { { 'filename', icons_enabled = true, path = 1 } },
    lualine_x = { 'encoding' },
    lualine_y = { 'filetype' },
    lualine_z = { 'location' },
  },
}
