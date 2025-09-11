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

-- Helper function to merge highlight groups
local function merge_highlights(target, source)
  for name, setting in pairs(source) do
    target[name] = setting
  end
end

-- Function to collect all highlights
local function collect_highlights()
  local highlights = {}

  -- Define highlight modules to load
  local highlight_modules = {
    { path = "anysphere.highlights.editor", config_aware = true },
    { path = "anysphere.highlights.syntax", config_aware = false },
    { path = "anysphere.highlights.treesitter", config_aware = false },
    { path = "anysphere.highlights.plugins.lsp", config_aware = false },
  }

  -- Conditional plugin modules
  local plugin_modules = {
    { plugin = "gitsigns", path = "anysphere.highlights.plugins.gitsigns" },
    { plugin = "telescope", path = "anysphere.highlights.plugins.telescope" },
  }

  -- Load core highlight modules
  for _, module in ipairs(highlight_modules) do
    local highlight_fn = require(module.path).get_highlights
    local module_highlights = module.config_aware and highlight_fn(palette, config) or highlight_fn(palette)
    merge_highlights(highlights, module_highlights)
  end

  -- Load plugin modules conditionally
  for _, plugin_module in ipairs(plugin_modules) do
    if package.loaded[plugin_module.plugin] then
      local plugin_highlights = require(plugin_module.path).get_highlights(palette)
      merge_highlights(highlights, plugin_highlights)
    end
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
      -- Core UI
      "Normal",
      "NonText",
      "LineNr",
      "CursorLineNr",
      "SignColumn",
      "EndOfBuffer",
      "SpecialKey",

      -- Floating windows
      "NormalFloat",
      "FloatBorder",

      -- Window bars and status
      "WinBar",
      "WinBarNC",
      "StatusLine",
      "StatusLineNC",

      -- Tabs
      "TabLine",
      "TabLineFill",

      -- Folds
      "FoldColumn",

      -- Popups
      "Pmenu",
      "PmenuSbar",

      -- Plugin-specific (if loaded)
      "TelescopeNormal",
      "TelescopeBorder",
      "TelescopePreviewNormal",
      "TelescopePreviewBorder",
      "TelescopeResultsNormal",
      "TelescopeResultsBorder",
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
