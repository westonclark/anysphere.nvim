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
    ["@lsp.type.class"]                      = { fg = c.func },                          -- classes should be orange
    ["@lsp.type.comment"]                    = syntax["Comment"],                    -- comments
    ["@lsp.type.enum"]                       = { fg = c.func },                          -- enums should be orange
    ["@lsp.type.enumMember"]                 = treesitter["@variable.member"],       -- enum members
    ["@lsp.type.function"]                   = { fg = c.func },                      -- functions
    ["@lsp.type.generic"]                    = treesitter["@type"],                  -- generic types
    ["@lsp.type.interface"]                  = { fg = c.func },                          -- interfaces should be orange
    ["@lsp.type.macro"]                      = syntax["Macro"],                      -- macros
    ["@lsp.type.method"]                     = { fg = c.func },                          -- methods should be orange
    ["@lsp.type.namespace"]                  = { fg = c.type },                      -- namespaces should be blue
    ["@lsp.type.parameter"]                  = { fg = c.fg },                              -- parameters should be white
    ["@lsp.typemod.parameter.declaration"]   = { fg = c.fg },                              -- parameters in function definitions should be white
    ["@lsp.typemod.parameter.definition"]   = { fg = c.fg },                              -- parameters in function definitions should be white
    ["@lsp.type.property"]                   = { fg = c.declaration },                   -- object properties should be purple
    ["@lsp.type.property.function"]          = { fg = c.func },                          -- object method properties should be orange
    ["@lsp.type.selfParameter"]              = { fg = c.self },                      -- self parameters
    ["@lsp.type.type"]                       = { fg = c.func },                          -- types should be orange
    ["@lsp.type.typeParameter"]              = { fg = c.func },                          -- type parameters should be orange
    ["@lsp.type.variable"]                   = { fg = c.usage },                         -- regular variables (let)

    -- Import-related semantic tokens - these should be blue
    ["@lsp.typemod.variable.defaultLibrary"] = { fg = c.usage },                         -- default library variables
    ["@lsp.typemod.function.defaultLibrary"] = { fg = c.type },                      -- default library functions (imports)
    ["@lsp.typemod.variable.declaration"]    = { fg = c.declaration },                   -- const declarations should be purple
    ["@lsp.typemod.function.declaration"]    = { fg = c.func },                          -- function declarations
    ["@lsp.mod.declaration"]                 = { fg = c.declaration },                   -- any declaration should be purple
    ["@lsp.mod.readonly"]                    = { fg = c.declaration },                   -- const declarations should be purple

    ["@lsp.typemod.function"]                = { fg = c.func },                          -- function calls
    ["@lsp.typemod.function.builtin"]        = treesitter["@function.builtin"],      -- built-in functions
    ["@lsp.typemod.function.definition"]     = treesitter["@function"],              -- function definitions
    ["@lsp.typemod.type.defaultLibrary"]     = { fg = c.keyword },                   -- default library types should be green
    ["@lsp.typemod.variable.readonly"]       = { fg = c.declaration },                   -- const declarations should be purple
    ["@lsp.typemod.variable.readwrite"]      = { fg = c.usage },                     -- variable usages (read/write) should be light blue
  }

  return hl
end
return M
