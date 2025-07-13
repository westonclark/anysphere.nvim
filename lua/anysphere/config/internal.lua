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
    -- Core UI - Updated to match JSON values and respect transparency
    hl.Normal = { fg = c.fg, bg = M.current.transparent and "none" or c.bg }
    hl.NormalNC = { fg = c.fg, bg = M.current.transparent and "none" or c.bg }
    hl.LineNr = { fg = "#505050", bg = M.current.transparent and "none" or c.bg }  -- Matches editorLineNumber.foreground
    hl.CursorLineNr = { fg = "#FFFFFF", bg = M.current.transparent and "none" or c.bg }  -- Matches editorLineNumber.activeForeground
    hl.SignColumn = { bg = M.current.transparent and "none" or c.bg }
    hl.VertSplit = { fg = "#FFFFFF0D", bg = M.current.transparent and "none" or c.bg }  -- Updated to match editorGroup.border
    hl.StatusLine = { fg = "#cccccc82", bg = "#141414" }  -- Updated to match statusBar colors
    hl.StatusLineNC = { fg = "#cccccc60", bg = "#141414" }  -- Updated to match inactive statusBar
    hl.WinSeparator = { fg = "#FFFFFF0D", bg = M.current.transparent and "none" or c.bg }  -- Updated to match panel.border
    hl.CursorLine = { bg = M.current.transparent and "none" or c.line }  -- Now uses updated line color
    hl.CursorColumn = { bg = M.current.transparent and "none" or c.line }  -- Now uses updated line color
    hl.Visual = { bg = "#303030" }  -- FIXED: more visible gray for selection
    hl.Search = { bg = c.search, fg = c.fg }  -- Now uses updated search color
    hl.IncSearch = { bg = "#88C0D044", fg = c.fg }  -- Updated to match editor.findMatchHighlightBackground
    hl.MatchParen = { fg = "#FFFFFF", bg = M.current.transparent and "none" or c.line, underline = true }  -- Updated
    hl.Pmenu = { fg = c.fg, bg = M.current.transparent and "none" or "#141414" }  -- Updated to match editorSuggestWidget.background
    hl.PmenuSel = { fg = c.fg, bg = "#404040" }  -- Updated to match editorSuggestWidget.selectedBackground
    hl.PmenuSbar = { bg = "#2A2A2A" }  -- Updated
    hl.PmenuThumb = { bg = "#505050" }  -- Updated
    hl.Folded = { fg = "#CCCCCC99", bg = M.current.transparent and "none" or c.bg }  -- Updated
    hl.FoldColumn = { fg = "#505050", bg = M.current.transparent and "none" or c.bg }
    hl.ColorColumn = { bg = M.current.transparent and "none" or c.line }  -- Now uses updated line color
    hl.TabLine = { fg = "#505050", bg = "#141414" }  -- Updated to match tab colors
    hl.TabLineSel = { fg = "#FFFFFF", bg = M.current.transparent and "none" or c.bg }  -- Updated to match tab.activeForeground
    hl.TabLineFill = { bg = "#141414" }  -- Updated
    hl.WinBar = { fg = c.fg, bg = M.current.transparent and "none" or c.bg }
    hl.WinBarNC = { fg = "#505050", bg = M.current.transparent and "none" or c.bg }
    hl.Cursor = { fg = c.bg, bg = "#FFFFFF" }  -- Updated to match editorCursor.foreground
    hl.CursorIM = { fg = c.bg, bg = "#FFFFFF" }
    hl.TermCursor = { fg = c.bg, bg = "#FFFFFF" }
    hl.TermCursorNC = { fg = c.bg, bg = "#505050" }
    hl.NonText = { fg = "#505050" }
    hl.SpecialKey = { fg = "#505050" }
    hl.Conceal = { fg = "#505050", bg = M.current.transparent and "none" or c.bg }
    hl.Whitespace = { fg = "#505050B3" }  -- Updated to match editorWhitespace.foreground
    hl.EndOfBuffer = { fg = c.line }  -- Updated
    hl.DiagnosticUnnecessary = { fg = "#505050" }

    -- Comments - Updated to match JSON
    hl.Comment = { fg = c.comment, italic = true }

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

    -- Additional LSP type highlights for Go built-in types
    hl['@lsp.type.builtinType'] = { fg = "#83d6c5" }  -- Built-in types like int, bool
    hl['@lsp.type.type'] = { fg = "#83d6c5" }         -- General types
    hl['@lsp.typemod.type.defaultLibrary'] = { fg = "#83d6c5" }  -- Default library types

    -- JavaScript/TypeScript import highlights - all should be blue
    hl['@keyword.import.javascript'] = { fg = c.type }            -- import keyword in JS
    hl['@keyword.import.typescript'] = { fg = c.type }            -- import keyword in TS
    hl['@keyword.from.javascript'] = { fg = c.type }              -- from keyword in JS
    hl['@keyword.from.typescript'] = { fg = c.type }              -- from keyword in TS
    hl['@variable.other.readwrite.js'] = { fg = c.type }          -- imported variables in JS
    hl['@variable.other.readwrite.ts'] = { fg = c.type }          -- imported variables in TS
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
    bg = "#1a1a1a",  -- Changed from "#181818" to match editor.background
    ---@type string
    fg = "#D8DEE9",  -- Changed from "#d6d6dd" to match editor.foreground
    ---@type string
    floatBorder = "#2A2A2A",  -- Updated to match dropdown.border
    ---@type string
    line = "#292929",  -- Changed from "#212121" to match editor.lineHighlightBackground
    ---@type string
    comment = "#6C6C6C",  -- Fixed: solid gray instead of alpha channel that doesn't work in Neovim
    ---@type string
    builtin = "#83d6c5",  -- FIXED: Changed to match keyword color (same green as "for", "if")
    ---@type string
    func = "#efb080",  -- Updated to match function colors
    ---@type string
    string = "#e394dc",  -- This matches ✓ (PINK for strings)
    ---@type string
    number = "#ebc88d",  -- Updated to match number colors
    ---@type string
    property = "#D8DEE9",  -- Changed from purple to match regular variables (white/gray)
    ---@type string
    constant = "#82d2ce",  -- Updated to match constant colors
    ---@type string
    parameter = "#D8DEE9",  -- FIXED: Changed from yellow to white to match Cursor
    bracket = "#e394dc",  -- FIXED: Changed from blue to pink to match string quotes
    ---@type string
    visual = "#40404099",  -- Updated to match editor.selectionBackground
    ---@type string
    error = "#BF616A",  -- Updated to match error colors
    ---@type string
    warning = "#EBCB8B",  -- Updated to match warning colors
    ---@type string
    hint = "#88C0D0",  -- Updated to match hint colors
    ---@type string
    operator = "#efb080",  -- FIXED: Changed from light gray to orange for := operator
    ---@type string
    keyword = "#83d6c5",  -- This matches ✓ (GREEN for keywords like "for", "if")
    ---@type string
    type = "#87c3ff",  -- This matches ✓
    ---@type string
    search = "#88C0D066",  -- Updated to match editor.findMatchBackground
    ---@type string
    plus = "#A3BE8C",  -- Updated to match git added colors
    ---@type string
    delta = "#EBCB8B",  -- Updated to match git modified colors
  },
}

M._DEFAULT_SETTINGS = DEFAULT_SETTINGS
M.current = M._DEFAULT_SETTINGS

local opts = type(vim.g.anysphere_colorscheme) == "function" and vim.g.anysphere_colorscheme() or vim.g.anysphere_colorscheme or {}

---@param user_opts AnysphereColorscheme.Config
M.set = function(user_opts) M.current = vim.tbl_deep_extend("force", vim.deepcopy(M.current), user_opts or opts) end

return M
