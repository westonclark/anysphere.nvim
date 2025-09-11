local M = {}

function M.setup(palette, opts)
  opts = opts or {}

  -- Determine background colors based on transparency setting
  local bg = opts.transparent and "NONE" or palette.bg
  local line_bg = opts.transparent and "NONE" or palette.line
  local float_bg = opts.transparent and "NONE" or palette.bg

  local highlights = {
    -- Basic UI
    Normal = { fg = palette.fg, bg = bg },
    NormalFloat = { fg = palette.fg, bg = float_bg },
    FloatBorder = { fg = palette.float_border, bg = float_bg },

    -- Cursor and lines
    Cursor = { fg = bg == "NONE" and palette.fg or palette.bg, bg = palette.fg },
    CursorLine = { bg = line_bg },
    CursorColumn = { bg = line_bg },
    LineNr = { fg = palette.comment, bg = bg },
    CursorLineNr = { fg = palette.fg, bold = true, bg = line_bg },

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

    -- Popup menu
    Pmenu = { fg = palette.fg, bg = line_bg },
    PmenuSel = { fg = bg == "NONE" and palette.fg or palette.bg, bg = palette.func },
    PmenuSbar = { bg = line_bg },
    PmenuThumb = { bg = palette.comment },

    -- Splits
    VertSplit = { fg = palette.float_border },
    WinSeparator = { fg = palette.float_border },

    -- Folds
    Folded = { fg = palette.comment, bg = line_bg },
    FoldColumn = { fg = palette.comment, bg = bg },

    -- Signs
    SignColumn = { fg = palette.comment, bg = bg },

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
