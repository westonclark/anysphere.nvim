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
    ["@lsp.type.builtinType"]                = { fg = "#83d6c5" },                   -- HARDCODED: green color for built-in types
    ["@lsp.type.class"]                      = syntax["Structure"],                  -- classes
    ["@lsp.type.comment"]                    = syntax["Comment"],                    -- comments
    ["@lsp.type.enum"]                       = syntax["Structure"],                  -- enums
    ["@lsp.type.enumMember"]                 = treesitter["@variable.member"],       -- enum members
    ["@lsp.type.function"]                   = treesitter["@function.call"],         -- functions
    ["@lsp.type.generic"]                    = treesitter["@type"],                  -- generic types
    ["@lsp.type.interface"]                  = syntax["Structure"],                  -- interfaces
    ["@lsp.type.macro"]                      = syntax["Macro"],                      -- macros
    ["@lsp.type.method"]                     = treesitter["@function.method"],       -- methods
    ["@lsp.type.namespace"]                  = { fg = c.type },                      -- FIXED: namespaces should be blue
    ["@lsp.type.parameter"]                  = treesitter["@variable.parameter"],    -- function parameters
    ["@lsp.type.property"]                   = treesitter["@variable.member"],       -- properties (changed to use white)
    ["@lsp.type.selfParameter"]              = syntax["Special"],                    -- self parameters
    ["@lsp.type.type"]                       = { fg = "#83d6c5" },                   -- ADDED: general types should also be green
    ["@lsp.type.typeParameter"]              = syntax["Typedef"],                    -- type parameters
    ["@lsp.type.variable"]                   = treesitter["@variable"],              -- FIXED: variables should be white
    ["@lsp.typemod.function"]                = treesitter["@function.call"],         -- function calls
    ["@lsp.typemod.function.builtin"]        = treesitter["@function.builtin"],      -- built-in functions
    ["@lsp.typemod.function.defaultLibrary"] = treesitter["@function.builtin"],      -- default library functions
    ["@lsp.typemod.function.definition"]     = treesitter["@function"],              -- function definitions
    ["@lsp.typemod.type.defaultLibrary"]     = { fg = "#83d6c5" },                   -- ADDED: default library types should be green
    ["@lsp.typemod.variable.defaultLibrary"] = treesitter["@variable.builtin"],      -- default library variables (now white)
    ["@lsp.typemod.variable.definition"]     = treesitter["@variable"],              -- FIXED: variable definitions should be white

    -- JavaScript/TypeScript import-related LSP highlights - should be blue
    ["@lsp.mod.readonly"]                    = { fg = c.type },                      -- ADDED: readonly (often used for imports) should be blue
    ["@lsp.typemod.variable.readonly"]       = { fg = c.type },                      -- ADDED: readonly variables (imports) should be blue
    ["@lsp.typemod.variable.declaration"]    = { fg = c.type },                      -- ADDED: variable declarations (imports) should be blue
  }

  return hl
end
return M
