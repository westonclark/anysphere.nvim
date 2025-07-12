local M = {}

---@class AnysphereColorscheme.InternalConfig
local DEFAULT_SETTINGS = {

  ---@type boolean
  transparent = false,
  ---@type boolean
  bold = true,
  ---@type boolean
  italic = true,
  ---@class AnysphereColorscheme.InternalConfig.style
  style = {
    ---@type string
    boolean = "bold",
    ---@type string
    number = "none",
    ---@type string
    float = "none",
    ---@type string
    error = "bold",
    ---@type string
    comments = "italic",
    ---@type string
    conditionals = "none",
    ---@type string
    functions = "none",
    ---@type string
    headings = "bold",
    ---@type string
    operators = "none",
    ---@type string
    strings = "italic",
    ---@type string
    variables = "none",

    ---@type string
    keywords = "none",
    ---@type string
    keyword_return = "italic",
    ---@type string
    keywords_loop = "none",
    ---@type string
    keywords_label = "none",
    ---@type string
    keywords_exception = "none",

    builtin_constants = "bold",
    ---@type string
    builtin_functions = "none",
    ---@type string
    builtin_types = "bold",
    ---@type string
    builtin_variables = "none",
  },

  ---@param highlights table<string, vim.api.keyset.highlight>
  ---@param colors AnysphereColorscheme.InternalConfig.colors
  on_highlights = function(hl, c)
    -- Core UI
    hl.Normal = { fg = c.fg, bg = c.bg }
    hl.NormalNC = { fg = c.fg, bg = c.bg }
    hl.LineNr = { fg = "#505050", bg = c.bg }
    hl.CursorLineNr = { fg = "#FFFFFF", bg = c.bg }
    hl.SignColumn = { bg = c.bg }
    hl.VertSplit = { fg = "#292929", bg = c.bg }
    hl.StatusLine = { fg = c.fg, bg = "#141414" }
    hl.StatusLineNC = { fg = "#505050", bg = "#141414" }
    hl.WinSeparator = { fg = "#292929", bg = c.bg }
    hl.CursorLine = { bg = "#292929" }
    hl.CursorColumn = { bg = "#292929" }
    hl.Visual = { bg = "#40404099" }
    hl.Search = { bg = "#88C0D066", fg = c.fg }
    hl.IncSearch = { bg = "#88C0D044", fg = c.fg }
    hl.MatchParen = { fg = "#FFFFFF", bg = "#292929", underline = true }
    hl.Pmenu = { fg = c.fg, bg = "#141414" }
    hl.PmenuSel = { fg = c.fg, bg = "#404040" }
    hl.PmenuSbar = { bg = "#292929" }
    hl.PmenuThumb = { bg = "#505050" }
    hl.Folded = { fg = "#CCCCCC99", bg = "#1a1a1a" }
    hl.FoldColumn = { fg = "#505050", bg = c.bg }
    hl.ColorColumn = { bg = "#292929" }
    hl.TabLine = { fg = "#505050", bg = "#141414" }
    hl.TabLineSel = { fg = "#FFFFFF", bg = "#1a1a1a" }
    hl.TabLineFill = { bg = "#141414" }
    hl.WinBar = { fg = c.fg, bg = c.bg }
    hl.WinBarNC = { fg = "#505050", bg = c.bg }
    hl.Cursor = { fg = c.bg, bg = "#FFFFFF" }
    hl.CursorIM = { fg = c.bg, bg = "#FFFFFF" }
    hl.TermCursor = { fg = c.bg, bg = "#FFFFFF" }
    hl.TermCursorNC = { fg = c.bg, bg = "#505050" }
    hl.NonText = { fg = "#505050" }
    hl.SpecialKey = { fg = "#505050" }
    hl.Conceal = { fg = "#505050", bg = c.bg }
    hl.Whitespace = { fg = "#404040B3" }
    hl.EndOfBuffer = { fg = "#292929" }
    hl.DiagnosticUnnecessary = { fg = "#505050" }
    -- Comments
    hl.Comment = { fg = "#b0b0b0", italic = true }
    -- Strings
    hl.String = { fg = c.string }
    -- Functions
    hl.Function = { fg = c.func }
    -- Types/Classes
    hl.Type = { fg = c.type }
    -- Properties
    hl.Property = { fg = c.property }
    -- Numbers/Constants
    hl.Number = { fg = "#ebc88d" }
    hl.Constant = { fg = "#efb080" }
    -- Operators
    hl.Operator = { fg = "#d6d6dd" }
    -- Bold/Italic
    hl.Bold = { fg = "#f8c762", bold = true }
    hl.Italic = { fg = "#83d6c5", italic = true }
    -- Diagnostics
    hl.DiagnosticError = { fg = "#BF616A" }
    hl.DiagnosticWarn = { fg = "#EBCB8B" }
    hl.DiagnosticInfo = { fg = c.fg }
    hl.DiagnosticHint = { fg = "#838383" }
    hl.DiagnosticUnderlineError = { undercurl = true, sp = "#BF616A" }
    hl.DiagnosticUnderlineWarn = { undercurl = true, sp = "#EBCB8B" }
    hl.DiagnosticUnderlineInfo = { undercurl = true, sp = c.fg }
    hl.DiagnosticUnderlineHint = { undercurl = true, sp = "#838383" }
    -- Diff
    hl.DiffAdd = { bg = "#A3BE8C22" }
    hl.DiffChange = { bg = "#EBCB8B99" }
    hl.DiffDelete = { bg = "#BF616A22" }
    hl.DiffText = { bg = "#EBCB8B44" }
    -- Gutter
    hl.GitSignsAdd = { fg = "#A3BE8C" }
    hl.GitSignsChange = { fg = "#EBCB8B" }
    hl.GitSignsDelete = { fg = "#BF616A" }
    -- Inlay Hints
    hl.LspInlayHint = { fg = "#505050", bg = "#00000000" }
    -- Links
    hl.Underlined = { fg = "#81A1C1", underline = true }
    hl['@markup.link'] = { fg = "#81A1C1", underline = true }
    -- Misc
    hl.Title = { fg = c.fg, bold = true }
    hl.Todo = { fg = "#f8c762", bold = true }
    hl.Special = { fg = c.builtin }
    hl.Error = { fg = "#BF616A", bold = true }
    hl.WarningMsg = { fg = "#EBCB8B", bold = true }
    hl.MoreMsg = { fg = c.fg }
    hl.Question = { fg = c.fg }
    hl.Directory = { fg = "#81A1C1" }
    hl.SpellBad = { undercurl = true, sp = "#BF616A" }
    hl.SpellCap = { undercurl = true, sp = "#EBCB8B" }
    hl.SpellRare = { undercurl = true, sp = "#81A1C1" }
    hl.SpellLocal = { undercurl = true, sp = "#A3BE8C" }
    -- Indent Guides
    hl.IndentBlanklineChar = { fg = "#404040B3" }
    hl.IndentBlanklineContextChar = { fg = "#505050" }
    -- Bracket Match
    hl.MatchParen = { fg = "#FFFFFF", bg = "#292929", underline = true }
    -- Completion
    hl.CmpItemAbbr = { fg = c.fg }
    hl.CmpItemAbbrMatch = { fg = "#FFFFFF", bold = true }
    hl.CmpItemAbbrMatchFuzzy = { fg = "#FFFFFF", bold = true }
    hl.CmpItemKind = { fg = c.builtin }
    hl.CmpItemMenu = { fg = "#505050" }
    -- Treesitter
    hl['@markup.bold'] = { fg = "#f8c762", bold = true }
    hl['@markup.italic'] = { fg = "#83d6c5", italic = true }
    hl['@markup.link'] = { fg = "#81A1C1", underline = true }
    hl['@markup.heading'] = { fg = c.fg, bold = true }
    hl['@markup.quote'] = { fg = "#b0b0b0", italic = true }
    hl['@markup.raw'] = { fg = c.string }
    hl['@markup.strikethrough'] = { fg = c.comment, strikethrough = true }
    hl['@markup.underline'] = { fg = c.fg, underline = true }
    hl['@markup.list'] = { fg = c.func }
    hl['@markup.list.checked'] = { fg = c.func }
    hl['@markup.list.unchecked'] = { fg = c.func }
    hl['@markup.math'] = { fg = c.string }
    hl['@markup.heading.1'] = { fg = c.fg, bold = true }
    hl['@markup.heading.2'] = { fg = c.fg, bold = true }
    hl['@markup.heading.3'] = { fg = c.fg, bold = true }
    hl['@markup.heading.4'] = { fg = c.fg, bold = true }
    hl['@markup.heading.5'] = { fg = c.fg, bold = true }
    hl['@markup.heading.6'] = { fg = c.fg, bold = true }
    -- Markdown
    hl.markdownHeadingDelimiter = { fg = c.fg, bold = true }
    hl.markdownCode = { fg = c.string }
    hl.markdownCodeBlock = { fg = c.string }
    hl.markdownCodeDelimiter = { fg = c.string }
    hl.markdownUrl = { fg = "#81A1C1", underline = true }
    hl.markdownLinkText = { fg = "#81A1C1", underline = true }
    hl.markdownH1 = { fg = c.fg, bold = true }
    hl.markdownH2 = { fg = c.fg, bold = true }
    hl.markdownH3 = { fg = c.fg, bold = true }
    hl.markdownH4 = { fg = c.fg, bold = true }
    hl.markdownH5 = { fg = c.fg, bold = true }
    hl.markdownH6 = { fg = c.fg, bold = true }
  end,

  ---@class AnysphereColorscheme.InternalConfig.plugins
  plugins = {
    ---@class AnysphereColorscheme.InternalConfig.plugins.cmp
    cmp = {
      ---@type string
      match = "bold",
      ---@type string
      match_fuzzy = "bold",
    },
    ---@class AnysphereColorscheme.InternalConfig.plugins.dashboard
    dashboard = {
      ---@type string
      footer = "italic",
    },
    ---@class AnysphereColorscheme.InternalConfig.plugins.lsp
    lsp = {
      ---@type string
      diagnostic_error = "bold",
      ---@type string
      diagnostic_hint = "none",
      ---@type string
      diagnostic_info = "italic",
      ---@type string
      diagnostic_ok = "none",
      ---@type string
      diagnostic_warn = "bold",
    },
    ---@class AnysphereColorscheme.InternalConfig.plugins.neotest
    neotest = {
      ---@type string
      focused = "bold",
      ---@type string
      adapter_name = "bold",
    },
    ---@class AnysphereColorscheme.InternalConfig.plugins.telescope
    telescope = {
      ---@type string
      match = "bold",
    },
  },
  ---@class AnysphereColorscheme.InternalConfig.colors
  colors = {
    ---@type string
    bg = "#181818",
    ---@type string
    fg = "#d6d6dd",
    ---@type string
    floatBorder = "#383838",
    ---@type string
    line = "#212121",
    ---@type string
    comment = "#474747",
    ---@type string
    builtin = "#83d6c5",
    ---@type string
    func = "#ebc88d",
    ---@type string
    string = "#e394dc",
    ---@type string
    number = "#d6d6dd",
    ---@type string
    property = "#d6d6dd",
    ---@type string
    constant = "#83d6c5",
    ---@type string
    parameter = "#d6d6dd",
    bracket = "#87c3ff",
    ---@type string
    visual = "#2a282a",
    ---@type string
    error = "#f14c4c",
    ---@type string
    warning = "#ea7620",
    ---@type string
    hint = "#838383",
    ---@type string
    operator = "#d6d6dd",
    ---@type string
    keyword = "#83d6c5",
    ---@type string
    type = "#87c3ff",
    ---@type string
    search = "#163764",
    ---@type string
    plus = "#15ac91",
    ---@type string
    delta = "#e5b95c",
  },
}

M._DEFAULT_SETTINGS = DEFAULT_SETTINGS
M.current = M._DEFAULT_SETTINGS

local opts = type(vim.g.anysphere_colorscheme) == "function" and vim.g.anysphere_colorscheme() or vim.g.anysphere_colorscheme or {}

---@param user_opts AnysphereColorscheme.Config
M.set = function(user_opts) M.current = vim.tbl_deep_extend("force", vim.deepcopy(M.current), user_opts or opts) end

return M
