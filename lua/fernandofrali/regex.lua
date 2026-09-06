local M = {}

M.show_regex = function()
  local lines = {
    "",
    " ┌─────────────────────────────────────────────────────────────────┐",
    " │ GUIA DE REGEX — NVIM │",
    " └─────────────────────────────────────────────────────────────────┘",
    "",
    " ── Classes de Caracteres ──────────────────────────────────────────",
    " [1-9] números de 1 a 9",
    " [0-9] qualquer número de 0 a 9",
    " [A-Z] letras maiúsculas",
    " [a-z] letras minúsculas",
    " [A-Za-z] letras maiúsculas OU minúsculas",
    " [abc] a, b ou c",
    " [^abc] qualquer caractere EXCETO a, b ou c",
    "",
    " ── Quantidade / Repetição ─────────────────────────────────────────",
    " * zero ou mais vezes",
    " \\+ uma ou mais vezes (Vim regex)",
    " \\? zero ou uma vez (Vim regex)",
    " \\{n} exatamente n vezes",
    " \\{n,m} de n até m vezes",
    "",
    " ── Caracteres Especiais ───────────────────────────────────────────",
    " ^ início da linha",
    " $ fim da linha",
    " . qualquer caractere",
    " \\. ponto literal",
    " \\s espaço em branco",
    " \\S qualquer caractere que NÃO seja espaço",
    " \\d dígito",
    " \\D qualquer caractere que NÃO seja dígito",
    "",
    " ── Exemplos Práticos ──────────────────────────────────────────────",
    " ^1\\. encontra 1. no início da linha",
    " \\s* zero ou mais espaços",
    " #\\+ uma ou mais hashtags",
    " ^#\\+\\s* hashtags no início + espaços opcionais",
    " ^#\\+\\s*1\\. heading + espaços + 1.",
    " [A-Za-z]\\+ uma ou mais letras",
    "",
    " ── Very Magic ──────────────────────────────────────────────────────",
    " \\v ativa o modo Very Magic",
    " \\v#+ uma ou mais hashtags",
    " \\v[A-Za-z]+ uma ou mais letras",
    " \\v(ab|cd)+ uma ou mais ocorrências de ab ou cd",
    "",
    " OBS: \\v deixa a sintaxe mais parecida com regex 'puro',",
    " como PCRE, Python e JavaScript. Com \\v, +, ?, |, () etc.",
    " funcionam como operadores sem precisar do \\.",
    "",
    "   \\v              ativa o modo Very Magic",
    "   \\zs             define onde o match começa",
    "",
    "   Exemplo:",
    "   /\\v^.*?\\zso     encontra o primeiro 'o' da linha",
    "",
    "   Em:  Eu como ovo",
    "   O regex usa ^.*? para chegar ao primeiro 'o',",
    "   mas \\zs faz o resultado ser somente o 'o'.",
    "",
    "   Sem \\zs:",
    "   /\\v^.*?o        o match inclui tudo até o primeiro 'o'",
    "",
    "   Com \\zs:",
    "   /\\v^.*?\\zso     o match é somente o primeiro 'o'",
    "",
    "   DICA: \\zs é muito útil quando você precisa usar",
    "   algo como contexto, mas não quer que esse contexto",
    "   faça parte do resultado encontrado.",
    "",
    "   OBS: \\zs é específico do Vim/Neovim.",
    "   Em PCRE2, uma ideia semelhante pode ser feita com \\K:",
    "   ^.*?\\Ko",
    "",
    " ── Busca ───────────────────────────────────────────────────────────",
    " /regex busca usando regex",
    " /1. encontra 1. em qualquer posição",
    " /^1. encontra 1. somente no início da linha",
    " /1\\c busca ignorando maiúsculas/minúsculas",
    "",
    " ── Substituição (:s) ───────────────────────────────────────────────",
    " :%s/old/new/ substitui a 1ª ocorrência de old em cada linha",
    " :%s/old/new/g substitui TODAS as ocorrências de old",
    " :%s/1\\./X/ troca o primeiro 1. de cada linha",
    " :%s/1\\./X/g troca TODOS os 1. do arquivo",
    "",
    " OBS: :%s NÃO adiciona ^ ao regex.",
    " O comportamento de substituir apenas a primeira ocorrência",
    " vem do próprio comando :s quando o flag /g não é usado.",
    "",
    " DICA: Quer substituir TODAS as ocorrências?",
    " Lembre do /g no final: :%s/regex/substituição/g",
    "",
    " ── Diferença entre Busca e :s ──────────────────────────────────────",
    " /regex procura o padrão no texto",
    " :s/regex/x/ substitui a 1ª ocorrência por linha",
    " :s/regex/x/g substitui todas as ocorrências por linha",
    " :%s/regex/x/g substitui todas no arquivo",
    "",
    " ── Dicas Rápidas ───────────────────────────────────────────────────",
    " ^ pense: 'começa aqui'",
    " $ pense: 'termina aqui'",
    " * pense: 'pode não ter'",
    " + pense: 'tem pelo menos uma'",
    " \\ pense: 'escapa o próximo caractere'",
    " [] escolhe UM caractere dentre as opções",
    "",
    " q ou Esc fecha esta janela",
    "",
  }

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  local ns = vim.api.nvim_create_namespace("regex_guide")

  local function hl(line, group, col_start, col_end)
    vim.api.nvim_buf_add_highlight(buf, ns, group, line, col_start, col_end)
  end

  hl(1, "FloatBorder", 0, -1)
  hl(2, "Title", 0, -1)
  hl(3, "FloatBorder", 0, -1)

  local section_lines = {
    5, 14, 22, 33, 41, 49, 58, 65, 73
  }

  for _, ln in ipairs(section_lines) do
    hl(ln, "Keyword", 0, -1)
  end

  local key_lines = {
    6, 7, 8, 9, 10, 11, 12, 13,
    15, 16, 17, 18, 19,
    23, 24, 25, 26, 27, 28, 29,
    34, 35, 36, 37, 38,
    42, 43, 44,
    50, 51, 52,
    59, 60, 61, 62,
    66, 67, 68, 69,
    74, 75, 76, 77,
  }

  for _, ln in ipairs(key_lines) do
    hl(ln, "DiagnosticInfo", 3, 20)
  end

  hl(48, "WarningMsg", 3, -1)
  hl(49, "WarningMsg", 3, -1)
  hl(50, "WarningMsg", 3, -1)

  hl(#lines - 2, "Comment", 0, -1)

  vim.bo[buf].modifiable = false
  vim.bo[buf].readonly = true

  local max_width = 0
  for _, line in ipairs(lines) do
    if #line > max_width then max_width = #line end
  end

  local width = math.min(max_width + 2, math.floor(vim.o.columns * 0.85))
  local height = math.min(#lines, math.floor(vim.o.lines * 0.85))

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = "minimal",
    border = "rounded",
    title = " Regex ",
    title_pos = "center",
  })

  vim.wo[win].cursorline = true
  vim.wo[win].scrolloff = 3

  local function close()
    vim.api.nvim_win_close(win, true)
  end

  vim.keymap.set("n", "q", close, { buffer = buf, nowait = true })
  vim.keymap.set("n", "<Esc>", close, { buffer = buf, nowait = true })
end

return M
