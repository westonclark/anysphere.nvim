local M = {}

function M.setup(palette)
  local highlights = {
    -- Basic UI
    Normal = { fg = palette.fg, bg = palette.bg },
    NormalFloat = { fg = palette.fg, bg = palette.bg },
    FloatBorder = { fg = palette.float_border, bg = palette.bg },

    -- Cursor and lines
    Cursor = { fg = palette.bg, bg = palette.fg },
    CursorLine = { bg = palette.line },
    CursorColumn = { bg = palette.line },
    LineNr = { fg = palette.comment },
    CursorLineNr = { fg = palette.fg, bold = true },

    -- Visual selection
    Visual = { bg = palette.visual },
    VisualNOS = { bg = palette.visual },

    -- Search
    Search = { bg = palette.search },
    IncSearch = { bg = palette.search },
    CurSearch = { bg = palette.search },

    -- Status and command line
    StatusLine = { fg = palette.fg, bg = palette.line },
    StatusLineNC = { fg = palette.comment, bg = palette.line },
    WinBar = { fg = palette.fg, bg = palette.bg },
    WinBarNC = { fg = palette.comment, bg = palette.bg },

    -- Tabs
    TabLine = { fg = palette.comment, bg = palette.line },
    TabLineFill = { bg = palette.line },
    TabLineSel = { fg = palette.fg, bg = palette.bg },

    -- Popup menu
    Pmenu = { fg = palette.fg, bg = palette.line },
    PmenuSel = { fg = palette.bg, bg = palette.func },
    PmenuSbar = { bg = palette.line },
    PmenuThumb = { bg = palette.comment },

    -- Splits
    VertSplit = { fg = palette.float_border },
    WinSeparator = { fg = palette.float_border },

    -- Folds
    Folded = { fg = palette.comment, bg = palette.line },
    FoldColumn = { fg = palette.comment, bg = palette.bg },

    -- Signs
    SignColumn = { fg = palette.comment, bg = palette.bg },

    -- Messages
    ErrorMsg = { fg = palette.error },
    WarningMsg = { fg = palette.warning },
    MoreMsg = { fg = palette.hint },
    Question = { fg = palette.hint },

    -- Spelling
    SpellBad = { sp = palette.error, undercurl = true },
    SpellCap = { sp = palette.warning, undercurl = true },
    SpellLocal = { sp = palette.hint, undercurl = true },
    SpellRare = { sp = palette.hint, undercurl = true },

    -- Diff
    DiffAdd = { bg = palette.git_add, fg = palette.bg },
    DiffChange = { bg = palette.git_change, fg = palette.bg },
    DiffDelete = { bg = palette.git_delete, fg = palette.bg },
    DiffText = { bg = palette.git_change, fg = palette.bg, bold = true },

    -- Directory
    Directory = { fg = palette.type },

    -- Misc
    Title = { fg = palette.func, bold = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Underlined = { underline = true },
    Ignore = { fg = palette.comment },
    Todo = { fg = palette.warning, bold = true },
    MatchParen = { fg = palette.func, bold = true },
    NonText = { fg = palette.comment },
    SpecialKey = { fg = palette.comment },
    EndOfBuffer = { fg = palette.comment },
    Conceal = { fg = palette.comment },
  }

  for name, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, name, opts)
  end
end

return M
