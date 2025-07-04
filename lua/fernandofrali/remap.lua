vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Debugger
vim.keymap.set("n", "<leader>db", function()
    require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<F10>", function()
    require("dap").continue()
end)
vim.keymap.set("n", "<F2>", function()
    require("dap").step_into()
end)
vim.keymap.set("n", "<F3>", function()
    require("dap").step_over()
end)
vim.keymap.set("n", "<F4>", function()
    require("dap").step_out()
end)
vim.keymap.set("n", "<leader>q", function()
    require("dap").terminate()
end)
vim.keymap.set("n", "<leader>dgt", function()
    require("dap-go").debug_test()
end)
vim.keymap.set("n", "<leader>dgl", function()
    require("dap-go").debug_last()
end)
vim.keymap.set("n", "<F5>", function()
    require('dapui').elements.watches.add(vim.fn.expand('<cword>'))
end)
vim.keymap.set("n", "<leader>?", function()
    require("dapui").eval(nil, { enter = true })
end)

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/fernandofrali/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set({"n", "v"}, "y", "myy`y", { noremap = true, silent = true })

local function send_to_tmux(cmd)
  os.execute("tmux split-window -h '" .. cmd .. "'")
end

vim.keymap.set("n", "<leader>dnb", function()
  send_to_tmux("dotnet build; read")
end, { desc = "Dotnet Build (tmux)" })

vim.keymap.set("n", "<leader>dnr", function()
  send_to_tmux("dotnet run; read")
end, { desc = "Dotnet Run (tmux)" })
