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
  on_highlights = function(highlights, colors) end,

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
    parameter = "#aa9bf5",
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
