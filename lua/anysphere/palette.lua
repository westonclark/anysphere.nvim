local palette = {
  -- Base colors
  bg = "#1a1a1a",      -- Main background
  fg = "#D8DEE9",      -- Main foreground

  -- UI colors
  line = "#292929",         -- Current line highlight
  visual = "#303030",       -- Visual selection
  search = "#3A5A6B",       -- Search highlight (blended with background)
  float_border = "#2A2A2A", -- Floating window borders
  comment = "#6C6C6C",      -- Comments

  -- Syntax colors
  string = "#e394dc",    -- Pink for strings
  number = "#ebc88d",    -- Yellow for numbers
  boolean = "#82d2ce",   -- Cyan for booleans
  func = "#efb080",      -- Orange for functions
  keyword = "#83d6c5",   -- Green for keywords
  type = "#efb080",      -- Orange for types
  class = "#87c3ff",     -- Light blue for classes
  import = "#83d6c5",    -- Teal/cyan for imports (matching Cursor)
  operator = "#efb080",  -- Orange for operators
  bracket = "#e394dc",   -- Pink for brackets

  -- Variable colors
  declaration = "#AA9BF5", -- Dark purple for declarations
  usage = "#AA9BF5",       -- Purple for variable usage
  parameter = "#D8DEE9",   -- White for parameters
  property = "#D8DEE9",    -- White for properties
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
