local glow = "#1e90ff" 
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

-- More detailed version. Uncomment to use
-- local function config_lualine(colors)
--   local modecolor = {
--     n = colors.red,
--     i = colors.glow,
--     v = colors.white,
--     [""] = colors.white,
--     V = colors.red,
--     c = colors.gray,
--     no = colors.red,
--     s = colors.gray,
--     S = colors.gray,
--     [""] = colors.gray,
--     ic = colors.gray,
--     R = colors.glow,
--     Rv = colors.white,
--     cv = colors.red,
--     ce = colors.red,
--     r = colors.glow,
--     rm = colors.glow,
--     ["r?"] = colors.glow,
--     ["!"] = colors.red,
--     t = colors.red,
--   }
--
--   local theme = {
--     normal = {
--       a = { fg = colors.bg_dark, bg = colors.glow },
--       b = { fg = colors.glow, bg = colors.fg },
--       c = { fg = colors.fg, bg = colors.bg_dark },
--       z = { fg = colors.fg, bg = colors.bg_dark },
--     },
--     insert = { a = { fg = colors.bg_dark, bg = colors.glow } },
--     visual = { a = { fg = colors.bg_dark, bg = colors.white } },
--     replace = { a = { fg = colors.bg_dark, bg = colors.red } },
--   }
--
--   local space = {
--     function()
--       return " "
--     end,
--     color = { bg = colors.bg_dark, fg = colors.glow },
--   }
--
--   local filename = {
--     "filename",
--     color = { bg = colors.glow, fg = colors.bg, gui = "bold" },
--     separator = { left = "", right = "" },
--   }
--
--   local filetype = {
--     "filetype",
--     icons_enabled = false,
--     color = { bg = colors.gray2, fg = colors.glow, gui = "italic,bold" },
--     separator = { left = "", right = "" },
--   }
--
--   local branch = {
--     "branch",
--     icon = "",
--     color = { bg = colors.glow, fg = colors.bg, gui = "bold" },
--     separator = { left = "", right = "" },
--   }
--
--   local location = {
--     "location",
--     color = { bg = colors.gray, fg = colors.bg, gui = "bold" },
--     separator = { left = "", right = "" },
--   }
--
--   local diff = {
--     "diff",
--     color = { bg = colors.gray2, fg = colors.bg, gui = "bold" },
--     separator = { left = "", right = "" },
--     symbols = { added = " ", modified = " ", removed = " " },
--
--     diff_color = {
--       added = { fg = colors.glow },
--       modified = { fg = colors.gray },
--       removed = { fg = colors.red },
--     },
--   }
--
--   local modes = {
--     "mode",
--     color = function()
--       local mode_color = modecolor
--       return { bg = mode_color[vim.fn.mode()], fg = colors.bg_dark, gui = "bold" }
--     end,
--     separator = { left = "", right = "" },
--   }
--
--   local function getLspName()
--     local bufnr = vim.api.nvim_get_current_buf()
--     local buf_ft = vim.bo.filetype
--
--     local client_names = {}
--
--     local buf_clients = vim.lsp.get_clients({ bufnr = bufnr })
--
--     for _, client in ipairs(buf_clients) do
--       table.insert(client_names, client.name)
--     end
--
--     local lint_ok, lint = pcall(require, "lint")
--     if lint_ok and lint.linters_by_ft then
--       local linters = lint.linters_by_ft[buf_ft]
--       if type(linters) == "table" then
--         for _, l in ipairs(linters) do
--           table.insert(client_names, l)
--         end
--       elseif type(linters) == "string" then
--         table.insert(client_names, linters)
--       end
--     end
--
--     local conform_ok, conform = pcall(require, "conform")
--     if conform_ok then
--       local formatters = table.concat(conform.list_formatters_for_buffer(), " ")
--       if conform_ok then
--         for formatter in formatters:gmatch("%w+") do
--           if formatter then
--             table.insert(client_names, formatter)
--           end
--         end
--       end
--     end
--
--     if #client_names == 0 then
--       return "  No tools"
--     end
--
--     local uniq, seen = {}, {}
--     for _, name in ipairs(client_names) do
--       if not seen[name] then
--         table.insert(uniq, name)
--         seen[name] = true
--       end
--     end
--
--     return "  " .. table.concat(uniq, ", ")
--   end
--
--   local macro = {
--     require("noice").api.status.mode.get,
--     cond = require("noice").api.status.mode.has,
--     color = { fg = colors.red, bg = colors.bg_dark, gui = "italic,bold" },
--   }
--
--   local dia = {
--     "diagnostics",
--     sources = { "nvim_diagnostic" },
--     symbols = { error = " ", warn = " ", info = " ", hint = " " },
--     diagnostics_color = {
--       error = { fg = colors.red },
--       warn = { fg = colors.gray },
--       info = { fg = colors.white },
--       hint = { fg = colors.glow },
--     },
--     color = { bg = colors.gray2, fg = colors.glow, gui = "bold" },
--     separator = { left = "" },
--   }
--
--   local lsp = {
--     function()
--       return getLspName()
--     end,
--     separator = { left = "", right = "" },
--     color = { bg = colors.white, fg = colors.bg, gui = "italic,bold" },
--   }
--
--   require("lualine").setup({
--     options = {
--       disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
--       icons_enabled = true,
--       theme = theme,
--       component_separators = { left = "", right = "" },
--       section_separators = { left = "", right = "" },
--       ignore_focus = {},
--       always_divide_middle = true,
--       globalstatus = true,
--     },
--
--     sections = {
--       lualine_a = {
--         modes,
--       },
--       lualine_b = {
--         space,
--       },
--       lualine_c = {
--         filename,
--         filetype,
--         space,
--         branch,
--         diff,
--         space,
--         location,
--       },
--       lualine_x = {
--         space,
--       },
--       lualine_y = { macro, space },
--       lualine_z = {
--         dia,
--         lsp,
--       },
--     },
--     inactive_sections = {
--       lualine_a = {},
--       lualine_b = {},
--       lualine_c = { "filename" },
--       lualine_x = { "location" },
--       lualine_y = {},
--       lualine_z = {},
--     },
--   })
-- end
--
-- local colors = {
--   glow    = "#1bfd9c",
--   bg      = "#080808",
--   bg_dark = "#121212",
--   fg      = "#cccccc",
--   white   = "#ffffff",
--   gray    = "#7a7a7a",
--   gray2   = "#1e1e1e",
--   red     = "#fd1b7c",
-- }
--
-- config_lualine(colors)
-- vim.o.laststatus = vim.g.lualine_laststatus
