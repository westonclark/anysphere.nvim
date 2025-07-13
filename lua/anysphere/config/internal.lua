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
    declaration = "#B48EAD", -- Added for declarations (purple)
    ---@type string
    usage = "#94C1FA", -- Added for variable usage (light blue)
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
