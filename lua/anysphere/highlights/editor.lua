local M = {}

function M.get_highlights(palette, opts)
  opts = opts or {}

  -- Determine background colors based on transparency setting (matching old implementation)
  local bg = opts.transparent and "none" or palette.bg
  local line_bg = opts.transparent and "none" or palette.line
  local float_bg = opts.transparent and "none" or palette.bg

  local highlights = {
    -- Basic UI
    Normal = { fg = palette.fg, bg = bg },
    NormalFloat = { fg = palette.fg, bg = float_bg },
    FloatBorder = { fg = palette.float_border, bg = float_bg },

    -- Cursor and lines
    Cursor = { gui = "reverse" },
    CursorLine = { bg = line_bg },
    CursorColumn = { bg = line_bg },
    LineNr = { fg = palette.comment, bg = bg },
    CursorLineNr = { fg = palette.fg, bg = line_bg },

    -- Visual selection
    Visual = { bg = palette.visual },
    VisualNOS = { bg = palette.visual },

    -- Search
    Search = { bg = palette.search },
    IncSearch = { bg = palette.search },
    CurSearch = { bg = palette.search },

    -- Status and command line
    StatusLine = { fg = palette.fg, bg = line_bg },
    StatusLineNC = { fg = palette.comment, bg = line_bg },
    WinBar = { fg = palette.fg, bg = bg },
    WinBarNC = { fg = palette.comment, bg = bg },

    -- Tabs
    TabLine = { fg = palette.comment, bg = line_bg },
    TabLineFill = { bg = line_bg },
    TabLineSel = { fg = palette.fg, bg = bg },

    -- Splits
    VertSplit = { fg = palette.float_border },
    WinSeparator = { fg = palette.float_border },

    -- Folds
    Folded = { fg = palette.comment, bg = line_bg },
    FoldColumn = { fg = palette.comment, bg = bg },

    -- Signs
    SignColumn = { fg = palette.comment, bg = bg },

    -- Messages
    ErrorMsg = { fg = palette.error, gui = "bold" },
    WarningMsg = { fg = palette.warning, gui = "bold" },
    MoreMsg = { fg = palette.func, gui = "bold" },
    Question = { fg = palette.constant },

    -- Spelling
    SpellBad = { gui = "undercurl" },
    SpellCap = { gui = "undercurl" },
    SpellLocal = { gui = "undercurl" },
    SpellRare = { gui = "undercurl" },

    -- Diff
    DiffAdd = { bg = palette.git_add, fg = palette.bg },
    DiffChange = { bg = palette.git_change, fg = palette.bg },
    DiffDelete = { bg = palette.git_delete, fg = palette.bg },
    DiffText = { bg = palette.git_change, fg = palette.bg, gui = "bold" },

    -- Directory
    Directory = { fg = palette.type },

     -- Popup menu
    Pmenu = { fg = palette.fg, bg = float_bg },
    PmenuSel = { fg = palette.constant, bg = line_bg },
    PmenuSbar = { bg = line_bg },
    PmenuThumb = { bg = palette.visual },

    -- Make sure floating windows respect transparency
    NormalFloat = { fg = palette.fg, bg = float_bg },
    FloatBorder = { fg = palette.float_border, bg = float_bg },

    -- Misc
    Title = { fg = palette.func, gui = "bold" },
    Bold = { gui = "bold" },
    Italic = { gui = "italic" },
    Underlined = { gui = "underline" },
    Ignore = { fg = palette.comment },
    Todo = { fg = palette.warning, gui = "bold" },
    MatchParen = { fg = palette.fg, bg = palette.visual },
    NonText = { fg = palette.comment },
    SpecialKey = { fg = palette.comment },
    EndOfBuffer = { fg = palette.comment },
    Conceal = { fg = palette.comment },
  }

  return highlights
end

return M
