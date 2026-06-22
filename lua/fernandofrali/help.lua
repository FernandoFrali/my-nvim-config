local M = {}

M.show_keybinds = function()
  local lines = {
    "",
    "   ┌─────────────────────────────────────────────────────────────────┐",
    "   │                    GUIA DE KEYBINDS — NVIM                      │",
    "   └─────────────────────────────────────────────────────────────────┘",
    "",
    "   ── LSP & Símbolos ─────────────────────────────────────────────────",
    "   grn             renomeia o símbolo sob o cursor",
    "   grr             lista todas as referências do símbolo",
    "   gri             lista todas as implementações",
    "   grt             pula para a definição do tipo",
    "   gra             actions do LSP / formatar",
    "   gO              lista todos os símbolos do buffer",
    "   ctrl-]          vai para a definição",
    "   gq              formata o texto selecionado ou o objeto de texto",
    "   K               visualiza o tipo / hover docs",
    "   ctrl-x + ctrl-o no modo insert, ativa o code completion",
    "   Ctrl+s          mostra a assinatura da função (insert mode)",
    "",
    "   ── Diagnósticos ────────────────────────────────────────────────────",
    "   [d            pula para o diagnóstico anterior",
    "   ]d            pula para o diagnóstico seguinte",
    "   Ctrl+W d      mostra mensagem de erro/aviso da linha",
    "",
    "   ── Busca & Substituição ─────────────────────────────────────────────",
    "   Espaço pf    busca arquivo (file finder)",
    "   Espaço ps    busca no conteúdo (live grep)",
    "   Espaço s     substitui todos os nomes no arquivo",
    "   %s/old/new/  substituição manual com regex",
    "   busca\\c      busca case-insensitive  (ex: casa\\c)",
    "",
    "   ── Seleção & Movimento ──────────────────────────────────────────────",
    "   viw / diw / ciw   seleciona / deleta / muda a palavra",
    "   vi{ / va{         seleciona dentro / incluindo as chaves",
    "   f(letra) ; ,      busca letra na linha; próxima / anterior",
    "   %                 vai ao fim/início do bracket/brace/paren",
    "   $ / 0 / _         fim / início / 1º char não-vazio da linha",
    "   gv                reativa a seleção anterior",
    "   gi                insere após o último ponto de inserção",
    "",
    "   ── Copiar & Colar ───────────────────────────────────────────────────",
    "   Espaço p     cola sem perder o buffer copiado",
    "   ya{ / yi{    copia tudo ao redor / dentro das chaves",
    "   yy           copia a linha  (use: 3yy para 3 linhas)",
    "",
    "   ── Janelas & Abas ───────────────────────────────────────────────────",
    "   Ctrl+W V     cria janela vertical",
    "   Ctrl+W S     cria janela horizontal",
    "   Ctrl+HJKL    move a aba para direita/esquerda/cima/baixo",
    "   gt / 2gt     vai para a próxima aba / aba específica",
    "   :tabe .      cria nova aba",
    "",
    "   ── NVIM-Tree ────────────────────────────────────────────────────────",
    "   Ctrl+V        abre split vertical",
    "   Ctrl+H        abre split horizontal",
    "   Ctrl+T        abre em nova aba",
    "   Ctrl+R        renomeia arquivo",
    "   Tab           preview do arquivo",
    "   Y / gy        path relativo / absoluto",
    "   s             abre no Finder",
    "   bmv / bt / bd move / lixeira / apaga bookmarks",
    "",
    "   ── Code Folding ─────────────────────────────────────────────────────",
    "   zf            cria folding da seleção",
    "   zo / zc / za  abre / fecha / alterna folding",
    "",
    "   ── Git (fugitive) ───────────────────────────────────────────────────",
    "   Espaço gs    abre painel do git",
    "   s / u        stage / unstage",
    "   -            stage / unstage",
    "   X            reverte alterações",
    "   =            mostra diff do commit",
    "",
    "   ── Debugar (nvim-dap) ───────────────────────────────────────────────",
    "   F2            entra na função do cursor (step into)",
    "   F3            pula a função do cursor (step over)",
    "   F4            sai da função atual (step out)",
    "   F5            adiciona variável à watch list (acompanha em tempo real)",
    "   <leader>?     avalia / inspeciona o valor de uma variável",
    "",
    "   ── Dicas Importantes ────────────────────────────────────────────────",
    "   Ctrl+Z / fg   suspende o nvim / traz de volta",
    "   Ctrl+A / X    incrementa / decrementa número",
    "   .             repete o último comando",
    "   Use COUNTS em quase tudo!  ex: 3yy  c3w  2gt  3;",
    "",
    "   ── Trocar Nomes ─────────────────────────────────────────────────────",
    "   1. viw → * → N → cgn   substitui ocorrência por ocorrência",
    "   2. . (ponto)            continua substituindo",
    "",
    "   q  ou  Esc  fecha esta janela",
    "",
  }

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  local ns = vim.api.nvim_create_namespace("keybinds_guide")

  local function hl(line, group, col_start, col_end)
    vim.api.nvim_buf_add_highlight(buf, ns, group, line, col_start, col_end)
  end

  hl(1, "FloatBorder", 0, -1)
  hl(2, "Title", 0, -1)
  hl(3, "FloatBorder", 0, -1)

  local section_lines = { 5, 18, 23, 30, 39, 44, 51, 61, 65, 72, 79, 85 }
  for _, ln in ipairs(section_lines) do
    hl(ln, "Keyword", 0, -1)
  end

  local key_lines = {
    6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
    19, 20, 21,
    24, 25, 26, 27, 28,
    31, 32, 33, 34, 35, 36, 37,
    40, 41, 42,
    45, 46, 47, 48, 49,
    52, 53, 54, 55, 56, 57, 58, 59,
    62, 63,
    66, 67, 68, 69, 70,
    73, 74, 75, 76, 77,
    80, 81, 82, 83,
    86, 87,
    89,
  }
  for _, ln in ipairs(key_lines) do
    hl(ln, "DiagnosticInfo", 3, 17)
  end

  hl(#lines - 2, "Comment", 0, -1)

  vim.bo[buf].modifiable = false
  vim.bo[buf].readonly = true

  local max_width = 0
  for _, line in ipairs(lines) do
    if #line > max_width then max_width = #line end
  end

  local width            = math.min(max_width + 2, math.floor(vim.o.columns * 0.85))
  local height           = math.min(#lines, math.floor(vim.o.lines * 0.85))

  local win              = vim.api.nvim_open_win(buf, true, {
    relative  = "editor",
    width     = width,
    height    = height,
    col       = math.floor((vim.o.columns - width) / 2),
    row       = math.floor((vim.o.lines - height) / 2),
    style     = "minimal",
    border    = "rounded",
    title     = " Keybinds ",
    title_pos = "center",
  })

  vim.wo[win].cursorline = true
  vim.wo[win].scrolloff  = 3

  local function close()
    vim.api.nvim_win_close(win, true)
  end

  vim.keymap.set("n", "q", close, { buffer = buf, nowait = true })
  vim.keymap.set("n", "<Esc>", close, { buffer = buf, nowait = true })
end

return M
