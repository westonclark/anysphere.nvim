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
    bg = "#1a1a1a",  -- Matches editor.background
    ---@type string
    fg = "#D8DEE9",  -- Matches editor.foreground
    ---@type string
    floatBorder = "#2A2A2A",  -- Matches dropdown.border
    ---@type string
    line = "#292929",  -- Matches editor.lineHighlightBackground
    ---@type string
    comment = "#6C6C6C",  -- Solid gray instead of alpha channel
    ---@type string
    builtin = "#83d6c5",  -- Green for built-ins
    ---@type string
    func = "#efb080",  -- Orange for functions
    ---@type string
    string = "#e394dc",  -- Pink for strings
    ---@type string
    number = "#ebc88d",  -- Yellow for numbers
    ---@type string
    declaration = "#AA9BF5", -- Dark purple for declarations and const variables
    ---@type string
    usage = "#94C1FA", -- Light blue for variable usage
    ---@type string
    self = "#C1808A", -- Pinkish-red for self/this
    ---@type string
    attribute = "#AA9BF5", -- Dark purple for HTML attributes (same as declarations)
    ---@type string
    tag_delimiter = "#898989", -- Gray for HTML tag delimiters
    ---@type string
    property = "#D8DEE9",  -- White for properties
    ---@type string
    constant = "#82d2ce",  -- Cyan for constants
    ---@type string
    parameter = "#D8DEE9",  -- White for parameters
    bracket = "#e394dc",  -- Pink for brackets
    ---@type string
    visual = "#40404099",  -- Matches editor.selectionBackground
    ---@type string
    error = "#BF616A",  -- Red for errors
    ---@type string
    warning = "#EBCB8B",  -- Yellow for warnings
    ---@type string
    hint = "#88C0D0",  -- Cyan for hints
    ---@type string
    operator = "#efb080",  -- Orange for operators
    ---@type string
    keyword = "#83d6c5",  -- Green for keywords
    ---@type string
    type = "#87c3ff",  -- Blue for types
    ---@type string
    search = "#88C0D066",  -- Matches editor.findMatchBackground
    ---@type string
    plus = "#A3BE8C",  -- Green for git added
    ---@type string
    delta = "#EBCB8B",  -- Yellow for git modified
  },
}

M._DEFAULT_SETTINGS = DEFAULT_SETTINGS
M.current = M._DEFAULT_SETTINGS

local opts = type(vim.g.anysphere_colorscheme) == "function" and vim.g.anysphere_colorscheme() or vim.g.anysphere_colorscheme or {}

---@param user_opts AnysphereColorscheme.Config
M.set = function(user_opts) M.current = vim.tbl_deep_extend("force", vim.deepcopy(M.current), user_opts or opts) end

return M
