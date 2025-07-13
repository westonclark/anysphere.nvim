local curr_internal_conf = require("anysphere.config.internal").current
local groups = require("anysphere.groups")
local M = {}

---@param highlights table <string, table>
local function set_vim_highlights(highlights)
  for name, setting in pairs(highlights) do
    if setting.gui == "bold" and not curr_internal_conf.bold then
      setting.gui = "none"
    elseif setting.gui == "italic" and not curr_internal_conf.italic then
      setting.gui = "none"
    end
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

M.set_highlights = function()
  local highlights = {}

  -- Define a loading order to ensure correct override behavior.
  -- More general groups are loaded first, more specific ones later.
  local load_order = {
    "common",
    "syntax",
    "diff",
    "treesitter", -- Treesitter extends/overrides syntax
    "lsp_native", -- LSP semantic tokens override treesitter
    "lsp_plugin",
    "gitsigns",
    "neotest",
    "mini",
    "neotree",
    "dashboard",
    "telescope",
    "cmp",
    "blink",
    "snacks_picker",
    "snacks_input",
    "snacks_indent",
    "rainbow_delimiters",
    "vim_better_whitespace",
  }

  for _, group_name in ipairs(load_order) do
    if groups[group_name] then
      for hl, settings in pairs(groups[group_name]) do
        highlights[hl] = settings
      end
    end
  end

  -- Allow user to add or override any highlight groups
  if type(curr_internal_conf.on_highlights) == "function" then
    curr_internal_conf.on_highlights(highlights, curr_internal_conf.colors)
  end
  set_vim_highlights(highlights)
end

return M
