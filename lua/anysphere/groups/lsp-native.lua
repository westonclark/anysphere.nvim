local syntax_group = require("anysphere.groups.syntax")
local ts_group = require("anysphere.groups.treesitter")
local M = {}

---@param conf AnysphereColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors
  local syntax = syntax_group.get_colors(conf)
  local treesitter = ts_group.get_colors(conf)

  -- stylua: ignore
  local hl = {
    ["@lsp.type.builtinConstant"]            = treesitter["@constant.builtin"],      -- built-in constants
    ["@lsp.type.builtinType"]                = { fg = c.keyword },                   -- built-in types
    ["@lsp.type.class"]                      = syntax["Structure"],                  -- classes
    ["@lsp.type.comment"]                    = syntax["Comment"],                    -- comments
    ["@lsp.type.enum"]                       = syntax["Structure"],                  -- enums
    ["@lsp.type.enumMember"]                 = treesitter["@variable.member"],       -- enum members
    ["@lsp.type.function"]                   = { fg = c.func },                      -- functions
    ["@lsp.type.generic"]                    = treesitter["@type"],                  -- generic types
    ["@lsp.type.interface"]                  = syntax["Structure"],                  -- interfaces
    ["@lsp.type.macro"]                      = syntax["Macro"],                      -- macros
    ["@lsp.type.method"]                     = treesitter["@function.method"],       -- methods
    ["@lsp.type.namespace"]                  = { fg = c.type },                      -- namespaces should be blue
    ["@lsp.type.parameter"]                  = treesitter["@variable.parameter"],    -- function parameters
    ["@lsp.type.property"]                   = { fg = c.fg },                        -- properties should be white
    ["@lsp.type.selfParameter"]              = { fg = c.self },                      -- self parameters
    ["@lsp.type.type"]                       = { fg = c.keyword },                   -- general types should be green
    ["@lsp.type.typeParameter"]              = syntax["Typedef"],                    -- type parameters
    ["@lsp.type.variable"]                   = { fg = c.fg },                        -- variables should be white

    -- Import-related semantic tokens - these should be blue
    ["@lsp.typemod.variable.defaultLibrary"] = { fg = c.type },                      -- default library variables (imports)
    ["@lsp.typemod.function.defaultLibrary"] = { fg = c.type },                      -- default library functions (imports)
    ["@lsp.typemod.variable.declaration"]    = { fg = c.type },                      -- variable declarations (imports)
    ["@lsp.typemod.function.declaration"]    = { fg = c.type },                      -- function declarations (imports)
    ["@lsp.mod.declaration"]                 = { fg = c.type },                      -- any declaration (imports)
    ["@lsp.mod.readonly"]                    = { fg = c.type },                      -- readonly items (imports)

    ["@lsp.typemod.function"]                = { fg = c.func },                      -- function calls
    ["@lsp.typemod.function.builtin"]        = treesitter["@function.builtin"],      -- built-in functions
    ["@lsp.typemod.function.definition"]     = treesitter["@function"],              -- function definitions
    ["@lsp.typemod.type.defaultLibrary"]     = { fg = c.keyword },                   -- default library types should be green
    ["@lsp.typemod.variable.readonly"]       = { fg = c.declaration },               -- readonly variables (const) should be purple
    ["@lsp.typemod.variable.readwrite"]      = { fg = c.usage },                     -- variable usages (read/write) should be light blue
  }

  return hl
end
return M
