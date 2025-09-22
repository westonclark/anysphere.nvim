local palette = {
  -- Base colors
  bg = "#1a1a1a",      -- Main background
  fg = "#D8DEE9",      -- Main foreground

  -- UI colors
  line = "#292929",         -- Current line highlight
  visual = "#404040",       -- Visual selection
  search = "#5A7A8A",      -- Search highlight (based on Cursor theme)
  float_border = "#2A2A2A", -- Floating window borders
  comment = "#6C6C6C",      -- Comments

  -- Syntax colors
  string = "#e394dc",    -- Pink for strings
  number = "#ebc88d",    -- Yellow for numbers
  boolean = "#82d2ce",   -- Cyan for booleans
  orange = "#efb080",    -- Orange (used for functions, types, operators)
  keyword = "#83d6c5",   -- Green for keywords
  class = "#87c3ff",     -- Light blue for classes
  import = "#83d6c5",    -- Teal/cyan for imports (matching Cursor)
  comparison = "#d6d6dd", -- White for comparison operators (===, !==, etc.)
  bracket = "#e394dc",   -- Pink for brackets

  -- Semantic aliases for the orange color
  func = "#efb080",      -- Orange for functions
  type = "#efb080",      -- Orange for types
  operator = "#efb080",  -- Orange for operators

  -- Variable colors
  declaration = "#AA9BF5", -- Dark purple for declarations
  usage = "#AA9BF5",       -- Purple for variable usage
  parameter = "#D8DEE9",   -- White for parameters
  property = "#AA9BF5",    -- Purple for properties (matching Cursor theme)
  constant = "#82d2ce",    -- Cyan for constants
  builtin = "#83d6c5",     -- Green for built-ins
  self = "#C1808A",        -- Pinkish-red for self/this

  -- HTML/XML specific
  attribute = "#AA9BF5",   -- Dark purple for attributes
  tag_delimiter = "#898989", -- Gray for tag delimiters

  -- Diagnostic colors
  error = "#BF616A",    -- Red for errors
  warning = "#EBCB8B",  -- Yellow for warnings
  hint = "#88C0D0",     -- Cyan for hints
  info = "#88C0D0",     -- Cyan for info

  -- Git colors
  git_add = "#A3BE8C",    -- Green for git added
  git_change = "#EBCB8B", -- Yellow for git modified
  git_delete = "#BF616A", -- Red for git deleted
}

return palette
