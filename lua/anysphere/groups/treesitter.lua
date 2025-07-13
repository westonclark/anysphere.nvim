local syntax_group = require("anysphere.groups.syntax")
local diff_group = require("anysphere.groups.diff")
local M = {}

---comment
---@param conf AnysphereColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors
  local syntax = syntax_group.get_colors(conf)
  local diff = diff_group.get_colors(conf)

    --stylua: ignore
  local hl = {
    ["@attribute"]             = { fg = c.builtin },                                     -- attributes, like <decorators> in python
    ["@boolean"]               = syntax["Boolean"],                                      -- booleans
    ["@character"]             = syntax["String"],                                       -- character literals
    ["@character.special"]     = syntax["SpecialChar"],                                  -- special characters
    ["@constant"]              = syntax["Constant"],                                     -- constants
    ["@constant.builtin"]      = { fg = c.number, gui = conf.style.builtin_constants },  -- constants defined by the language, like 'nil' in Lua
    ["@constant.macro"]        = syntax["Macro"],                                        -- constants defined by macros, like 'NULL' in C
    ["@constructor"]           = { fg = c.type, gui = conf.style.functions },            -- constructor calls and definitions
    ["@constructor.lua"]       = { fg = c.type, gui = conf.style.functions },            -- constructor calls and definitions, `= { }` in Lua
    ["@text.diff.add"]         = diff["DiffAdd"],
    ["@text.diff.delete"]      = diff["DiffDelete"],
    ["@diff.plus"]             = diff["DiffAdd"],
    ["@diff.delta"]            = diff["DiffChange"],
    ["@diff.minus"]            = diff["DiffDelete"],
    ["@function"]              = syntax["Function"],                                     -- functions
    ["@function.builtin"]      = { fg = c.func, gui = conf.style.builtin_functions },    -- built-in functions
    ["@function.call"]         = { fg = c.func },                                        -- function calls
    ["@function.macro"]        = syntax["Macro"],                                        -- macro-defined functions
    ["@function.method"]       = { fg = c.func },                                        -- methods
    ["@function.method.call"]  = { fg = c.func },                                        -- method calls
    ["@keyword"]               = { fg = c.keyword, gui = conf.style.keywords },          -- general keywords
    ["@keyword.conditional"]   = { fg = c.keyword, gui = conf.style.conditionals },      -- conditional keywords
    ["@keyword.exception"]     = syntax["Exception"],                                    -- exception-related keywords
    ["@keyword.import"]        = { fg = c.keyword, gui = conf.style.keywords },                 -- import keyword - should be green like other keywords
    ["@keyword.function"]       = { fg = c.keyword, gui = conf.style.keywords },                 -- function keyword
    ["@keyword.operator"]       = { fg = c.keyword, gui = conf.style.keywords },                 -- operator keyword
    ["@keyword.return"]        = { fg = c.keyword, gui = conf.style.keyword_return },    -- return keywords
    ["@label"]                 = syntax["Label"],                                        -- labels
    ["@markup"]                = { fg = c.fg },                                          -- text in markup languages
    ["@markup.heading"]        = { fg = c.keyword, gui = conf.style.headings },          -- markdown titles
    ["@markup.italic"]         = { fg = c.fg, gui = "italic" },                          -- italic text
    ["@markup.link"]           = { fg = c.string },                                      -- text references, footnotes, citations, etc.
    ["@markup.link.uri"]       = { fg = c.string, gui = "underline" },                   -- URLs, links, emails
    ["@markup.list"]           = { fg = c.func },                                        -- lists
    ["@markup.list.checked"]   = { fg = c.func },                                        -- checked todo list items
    ["@markup.list.unchecked"] = { fg = c.func },                                        -- unchecked todo list items
    ["@markup.math"]           = { fg = c.string },                                      -- math environments, like `$$` in LaTeX
    ["@markup.quote.markdown"] = { fg = c.comment },                                     -- quotes with '>'
    ["@markup.raw"]            = { fg = c.constant },                                    -- inline code in markdown
    ["@markup.strikethrough"]  = { fg = c.comment, gui = "strikethrough" },              -- strikethrough text
    ["@markup.strong"]         = { fg = c.fg, gui = "bold" },                            -- bold text
    ["@markup.underline"]      = { fg = c.fg, gui = "underline" },                       -- underlined text
    ["@module"]                = { fg = c.type },                                        -- FIXED: modules should be blue
    ["@number"]                = syntax["Number"],                                       -- all numbers
    ["@number.float"]          = syntax["Float"],                                        -- floats
    ["@operator"]              = syntax["Operator"],                                     -- operators like `+`
    ["@property"]              = { fg = c.property },                                    -- properties (similar to TSField)
    ["@punctuation.bracket"]   = { fg = c.bracket },                                     -- brackets and parentheses
    ["@punctuation.delimiter"] = { fg = c.bracket },                                     -- delimiters, like `; . , `
    ["@punctuation.special"]   = syntax["SpecialChar"],                                  -- special punctuation (e.g., `{}` in string interpolation)
    ["@string"]                = syntax["String"],                                       -- strings
    ["@string.documentation"]  = syntax["Comment"],                                      -- doc strings
    ["@string.escape"]         = syntax["SpecialChar"],                                  -- escape characters within strings
    ["@string.regexp"]         = syntax["SpecialChar"],                                  -- regular expressions
    ["@string.special.symbol"] = syntax["Identifier"],                                   -- special symbols in strings
    ["@string.special.url"]    = { fg = c.func },                                        -- URLs, links, emails
    ["@tag"]                   = { fg = c.string },                                      -- html/jsx tags
    ["@tag.delimiter"]         = { fg = c.string },                                      -- tag delimiters < >
    ["@text"]                  = { fg = c.fg },                                          -- text
    ["@text.literal"]          = { fg = c.string },                                      -- literal text
    ["@type"]                  = syntax["Type"],                                         -- types
    ["@type.builtin"]          = { fg = c.keyword, gui = conf.style.builtin_types },     -- FIXED: built-in types should be green like keywords
    ["@type.declaration"]      = { fg = c.constant },                                    -- type declarations
    ["@type.definition"]       = syntax["Typedef"],                                      -- typedefs
    ["@variable"]              = { fg = c.fg, gui = conf.style.variables },              -- any variable without another highlight - FIXED: should be white
    ["@variable.builtin"]      = { fg = c.fg },                                          -- FIXED: built-in variables should be white, not green
    ["@variable.member"]       = { fg = c.fg },                                          -- FIXED: object members should be white
    ["@variable.parameter"]    = { fg = c.fg },                                          -- FIXED: function parameters should be white

    -- JavaScript/TypeScript specific import highlights
    ["@variable.javascript"]   = { fg = c.fg },                                          -- JS variables (white by default)
    ["@variable.typescript"]   = { fg = c.fg },                                          -- TS variables (white by default)
    ["@function.javascript"]   = { fg = c.func },                                        -- JS functions (orange by default)
    ["@function.typescript"]   = { fg = c.func },                                        -- TS functions (orange by default)
    -- Import context overrides - these should be blue
    ["@variable.import"] = { fg = c.type },                                  -- Imported variables
    ["@function.import"] = { fg = c.type },                                  -- Imported functions
    ["@module.import"]   = { fg = c.type },                                  -- Imported modules
  }

  return hl
end
return M
