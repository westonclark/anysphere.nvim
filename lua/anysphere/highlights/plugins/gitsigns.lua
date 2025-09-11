local M = {}

function M.get_highlights(palette)
  local highlights = {
    -- Git signs in the sign column
    GitSignsAdd = { fg = palette.git_add },
    GitSignsChange = { fg = palette.git_change },
    GitSignsDelete = { fg = palette.git_delete },
    GitSignsChangedelete = { fg = palette.git_change },
    GitSignsTopdelete = { fg = palette.git_delete },
    GitSignsUntracked = { fg = palette.hint },

    -- Inline git blame
    GitSignsCurrentLineBlame = { fg = palette.comment, italic = true },

    -- Word diff
    GitSignsAddInline = { bg = palette.git_add, fg = palette.bg },
    GitSignsChangeInline = { bg = palette.git_change, fg = palette.bg },
    GitSignsDeleteInline = { bg = palette.git_delete, fg = palette.bg },

    -- Line highlights
    GitSignsAddLn = { bg = palette.git_add, fg = palette.bg },
    GitSignsChangeLn = { bg = palette.git_change, fg = palette.bg },
    GitSignsDeleteLn = { bg = palette.git_delete, fg = palette.bg },

    -- Number column highlights
    GitSignsAddNr = { fg = palette.git_add },
    GitSignsChangeNr = { fg = palette.git_change },
    GitSignsDeleteNr = { fg = palette.git_delete },
  }

  return highlights
end

return M
