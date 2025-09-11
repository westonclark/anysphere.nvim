local M = {}
local palette = require("anysphere.palette")

---@param opts? table Optional configuration options
function M.setup(opts)
  opts = opts or {}
  -- Save opts so the colorscheme loader can reuse them
  M._opts = opts
  vim.g.anysphere_opts = opts

  -- Debug print
  print("Transparency setting:", opts.transparent)

  -- Apply any user color overrides
  if opts.colors then
    palette = vim.tbl_extend("force", palette, opts.colors)
  end

  -- Collect all highlights first (like vague.nvim approach)
  local highlights = {}

  -- Collect editor highlights
  local editor_highlights = require("anysphere.highlights.editor").get_highlights(palette, opts)
  for name, setting in pairs(editor_highlights) do
    highlights[name] = setting
  end

  -- Collect syntax highlights
  local syntax_highlights = require("anysphere.highlights.syntax").get_highlights(palette)
  for name, setting in pairs(syntax_highlights) do
    highlights[name] = setting
  end

  -- Collect treesitter highlights (should override syntax)
  local treesitter_highlights = require("anysphere.highlights.treesitter").get_highlights(palette)
  for name, setting in pairs(treesitter_highlights) do
    highlights[name] = setting
  end

  -- Collect plugin highlights conditionally
  if package.loaded["gitsigns"] then
    local gitsigns_highlights = require("anysphere.highlights.plugins.gitsigns").get_highlights(palette)
    for name, setting in pairs(gitsigns_highlights) do
      highlights[name] = setting
    end
  end

  if package.loaded["telescope"] then
    local telescope_highlights = require("anysphere.highlights.plugins.telescope").get_highlights(palette)
    for name, setting in pairs(telescope_highlights) do
      highlights[name] = setting
    end
  end

  -- Always load LSP highlights since they're built-in
  local lsp_highlights = require("anysphere.highlights.plugins.lsp").get_highlights(palette)
  for name, setting in pairs(lsp_highlights) do
    highlights[name] = setting
  end

  -- Apply all highlights at once
  for name, setting in pairs(highlights) do
    vim.api.nvim_command(
      string.format(
        "highlight %s guifg=%s guibg=%s guisp=%s gui=%s",
        name,
        setting.fg or "none",
        setting.bg or "none",
        setting.sp or "none",
        setting.gui or "none"
      )
    )
  end

  -- If transparency is enabled, clear background colors
  if opts.transparent then
    vim.api.nvim_command("highlight Normal guibg=none")
    vim.api.nvim_command("highlight NonText guibg=none")
    vim.api.nvim_command("highlight LineNr guibg=none")
    vim.api.nvim_command("highlight SignColumn guibg=none")
    vim.api.nvim_command("highlight EndOfBuffer guibg=none")
  end
end

-- Export palette for users who want to access colors
function M.get_palette()
  return palette
end

return M
