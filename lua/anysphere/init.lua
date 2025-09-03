local M = {}
local palette = require("anysphere.palette")

---@param opts? table Optional configuration options
function M.setup(opts)
  opts = opts or {}

  -- Apply any user color overrides
  if opts.colors then
    palette = vim.tbl_extend("force", palette, opts.colors)
  end

  -- Load core highlights in correct order
  -- Editor UI first (base layer)
  require("anysphere.highlights.editor").setup(palette)
  -- Syntax highlighting (fallback for older vim syntax)
  require("anysphere.highlights.syntax").setup(palette)
  -- Treesitter (modern syntax highlighting - should override syntax)
  require("anysphere.highlights.treesitter").setup(palette)

  -- Load plugin highlights conditionally
  if package.loaded["gitsigns"] then
    require("anysphere.highlights.plugins.gitsigns").setup(palette)
  end

  if package.loaded["telescope"] then
    require("anysphere.highlights.plugins.telescope").setup(palette)
  end

  -- Always load LSP highlights since they're built-in
  require("anysphere.highlights.plugins.lsp").setup(palette)
end

-- Export palette for users who want to access colors
function M.get_palette()
  return palette
end

return M
