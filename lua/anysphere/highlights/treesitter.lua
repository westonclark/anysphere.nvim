local M = {}

function M.setup(palette)
  local highlights = {
    -- Literals
    ["@string"] = { fg = palette.string, italic = true },
    ["@string.documentation"] = { fg = palette.string, italic = true },
    ["@string.regex"] = { fg = palette.string },
    ["@string.escape"] = { fg = palette.func },
    ["@string.special"] = { fg = palette.func },
    ["@character"] = { fg = palette.string },
    ["@character.special"] = { fg = palette.func },
    ["@boolean"] = { fg = palette.boolean, bold = true },
    ["@number"] = { fg = palette.number },
    ["@float"] = { fg = palette.number },

    -- Functions
    ["@function"] = { fg = palette.func },
    ["@function.builtin"] = { fg = palette.builtin },
    ["@function.call"] = { fg = palette.func },
    ["@function.macro"] = { fg = palette.builtin },
    ["@method"] = { fg = palette.func },
    ["@method.call"] = { fg = palette.func },
    ["@constructor"] = { fg = palette.class },

    -- Keywords
    ["@keyword"] = { fg = palette.keyword },
    ["@keyword.function"] = { fg = palette.keyword },
    ["@keyword.operator"] = { fg = palette.operator },
    ["@keyword.return"] = { fg = palette.keyword, italic = true },
    ["@keyword.conditional"] = { fg = palette.keyword },
    ["@keyword.repeat"] = { fg = palette.keyword },
    ["@keyword.import"] = { fg = palette.builtin },
    ["@keyword.export"] = { fg = palette.builtin },

    -- Variables
    ["@variable"] = { fg = palette.usage },
    ["@variable.builtin"] = { fg = palette.builtin },
    ["@variable.parameter"] = { fg = palette.parameter },
    ["@variable.member"] = { fg = palette.property },

    -- Constants
    ["@constant"] = { fg = palette.constant },
    ["@constant.builtin"] = { fg = palette.builtin, bold = true },
    ["@constant.macro"] = { fg = palette.builtin },

    -- Types
    ["@type"] = { fg = palette.type, bold = true },
    ["@type.builtin"] = { fg = palette.builtin, bold = true },
    ["@type.definition"] = { fg = palette.declaration, bold = true },

    -- Identifiers
    ["@property"] = { fg = palette.property },
    ["@field"] = { fg = palette.property },
    ["@parameter"] = { fg = palette.parameter },
    ["@namespace"] = { fg = palette.type },
    ["@module"] = { fg = palette.type },

    -- Operators
    ["@operator"] = { fg = palette.operator },

    -- Punctuation
    ["@punctuation.delimiter"] = { fg = palette.bracket },
    ["@punctuation.bracket"] = { fg = palette.bracket },
    ["@punctuation.special"] = { fg = palette.func },

    -- Comments
    ["@comment"] = { fg = palette.comment, italic = true },
    ["@comment.documentation"] = { fg = palette.comment, italic = true },
    ["@comment.error"] = { fg = palette.error, bold = true },
    ["@comment.warning"] = { fg = palette.warning, bold = true },
    ["@comment.todo"] = { fg = palette.warning, bold = true },
    ["@comment.note"] = { fg = palette.hint, bold = true },

    -- Markup (for markdown, etc.)
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.heading"] = { fg = palette.func, bold = true },
    ["@markup.quote"] = { fg = palette.comment, italic = true },
    ["@markup.math"] = { fg = palette.number },
    ["@markup.link"] = { fg = palette.type, underline = true },
    ["@markup.link.label"] = { fg = palette.string },
    ["@markup.link.url"] = { fg = palette.hint, underline = true },
    ["@markup.raw"] = { fg = palette.string },
    ["@markup.raw.block"] = { fg = palette.string },
    ["@markup.list"] = { fg = palette.func },
    ["@markup.list.checked"] = { fg = palette.git_add },
    ["@markup.list.unchecked"] = { fg = palette.comment },

    -- Tags (HTML, XML, etc.)
    ["@tag"] = { fg = palette.func },
    ["@tag.attribute"] = { fg = palette.attribute },
    ["@tag.delimiter"] = { fg = palette.tag_delimiter },
    ["@tag.builtin"] = { fg = palette.func },

    -- HTML specific
    ["@tag.html"] = { fg = palette.func },
    ["@tag.attribute.html"] = { fg = palette.attribute },
    ["@tag.delimiter.html"] = { fg = palette.tag_delimiter },
    ["@string.quoted.html"] = { fg = palette.string },

    -- CSS specific
    ["@property.css"] = { fg = palette.property },
    ["@string.css"] = { fg = palette.string },
    ["@number.css"] = { fg = palette.number },

    -- Special
    ["@label"] = { fg = palette.keyword },
    ["@attribute"] = { fg = palette.attribute },
    ["@constructor.lua"] = { fg = palette.bracket }, -- Lua table constructors

    -- Language specific
    ["@variable.parameter.bash"] = { fg = palette.parameter },
    ["@string.special.symbol.ruby"] = { fg = palette.constant },
    ["@field.yaml"] = { fg = palette.property },

    -- Additional common highlights
    ["@none"] = {},
    ["@conceal"] = { fg = palette.comment },
    ["@spell"] = {},
    ["@nospell"] = {},

    -- LSP Semantic tokens (fallback)
    ["@lsp.type.class"] = { fg = palette.class, bold = true },
    ["@lsp.type.decorator"] = { fg = palette.attribute },
    ["@lsp.type.enum"] = { fg = palette.type },
    ["@lsp.type.enumMember"] = { fg = palette.constant },
    ["@lsp.type.function"] = { fg = palette.func },
    ["@lsp.type.interface"] = { fg = palette.type },
    ["@lsp.type.macro"] = { fg = palette.builtin },
    ["@lsp.type.method"] = { fg = palette.func },
    ["@lsp.type.namespace"] = { fg = palette.type },
    ["@lsp.type.parameter"] = { fg = palette.parameter },
    ["@lsp.type.property"] = { fg = palette.property },
    ["@lsp.type.struct"] = { fg = palette.type },
    ["@lsp.type.type"] = { fg = palette.type },
    ["@lsp.type.typeParameter"] = { fg = palette.type },
    ["@lsp.type.variable"] = { fg = palette.usage },
  }

  for name, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, name, opts)
  end
end

return M
