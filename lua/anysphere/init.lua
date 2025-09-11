local M = {}
local palette = require("anysphere.palette")

-- Configuration storage
local config = {
  transparent = false,
  colors = {}
}

---@param opts? table Optional configuration options
function M.setup(opts)
  opts = opts or {}

  -- Store configuration
  config = vim.tbl_extend("force", config, opts)

  -- Apply any user color overrides
  if opts.colors then
    palette = vim.tbl_extend("force", palette, opts.colors)
  end

  -- Debug print
  if vim.g.anysphere_debug then
    print("Setup called with transparency:", config.transparent)
  end
end

-- Function to collect all highlights
local function collect_highlights()
  local highlights = {}

  -- Collect editor highlights
  local editor_highlights = require("anysphere.highlights.editor").get_highlights(palette, config)
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

  return highlights
end

-- Function to apply highlights
local function apply_highlights(highlights)
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
end

-- Function to apply transparency overrides
local function apply_transparency()
  if config.transparent then
    -- Clear background colors for key UI elements
    local transparent_groups = {
      "Normal",
      "NonText",
      "LineNr",
      "SignColumn",
      "EndOfBuffer",
      "NormalFloat",
      "FloatBorder",
      "WinBar",
      "WinBarNC"
    }

    for _, group in ipairs(transparent_groups) do
      vim.api.nvim_command(string.format("highlight %s guibg=none", group))
    end
  end
end

-- Main load function
function M.load()
  if vim.g.anysphere_debug then
    print("Loading colorscheme with transparency:", config.transparent)
  end

  -- Collect and apply all highlights
  local highlights = collect_highlights()
  apply_highlights(highlights)

  -- Apply transparency if enabled
  apply_transparency()
end

-- Export palette for users who want to access colors
function M.get_palette()
  return palette
end

-- Create the colorscheme command
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "anysphere",
  callback = M.load
})

return M
