# Anysphere

A dark colorscheme for Neovim with support for many plugins, based on the Anysphere theme.

<img width="1582" alt="Screenshot 2025-05-24 at 1 44 17 PM" src="https://github.com/user-attachments/assets/8145d76e-3040-4bee-b6bf-3c65140f4786" />

## Installation

```lua
-- Lazy
{
  "your-username/anysphere.nvim",
  config = function()
    -- NOTE: you do not need to call setup if you don't want to.
    require("anysphere").setup({
      -- optional configuration here
    })
  end
},
```

## Default configuration

```lua
require("anysphere").setup({
  transparent = false, -- don't set background
  -- disable bold/italic globally in `style`
  bold = true,
  italic = true,
  style = {
    -- "none" is the same thing as default. But "italic" and "bold" are also valid options
    boolean = "bold",
    number = "none",
    float = "none",
    error = "bold",
    comments = "italic",
    conditionals = "none",
    functions = "none",
    headings = "bold",
    operators = "none",
    strings = "italic",
    variables = "none",

    -- keywords
    keywords = "none",
    keyword_return = "italic",
    keywords_loop = "none",
    keywords_label = "none",
    keywords_exception = "none",

    -- builtin
    builtin_constants = "bold",
    builtin_functions = "none",
    builtin_types = "bold",
    builtin_variables = "none",
  },
  -- plugin styles where applicable
  -- make an issue/pr if you'd like to see more styling options!
  plugins = {
    cmp = {
      match = "bold",
      match_fuzzy = "bold",
    },
    dashboard = {
      footer = "italic",
    },
    lsp = {
      diagnostic_error = "bold",
      diagnostic_hint = "none",
      diagnostic_info = "italic",
      diagnostic_ok = "none",
      diagnostic_warn = "bold",
    },
    neotest = {
      focused = "bold",
      adapter_name = "bold",
    },
    telescope = {
      match = "bold",
    },
  },

  -- Override highlights or add new highlights
  on_highlights = function(highlights, colors) end,

  -- Override colors
  colors = {
    bg = "#181818",
    fg = "#d6d6dd",
    floatBorder = "#383838",
    line = "#212121",
    comment = "#474747",
    builtin = "#83d6c5",
    func = "#ebc88d",
    string = "#e394dc",
    number = "#d6d6dd",
    property = "#d6d6dd",
    constant = "#83d6c5",
    parameter = "#aa9bf5",
    visual = "#2a282a",
    error = "#f14c4c",
    warning = "#ea7620",
    hint = "#838383",
    operator = "#d6d6dd",
    keyword = "#83d6c5",
    type = "#87c3ff",
    search = "#163764",
    plus = "#15ac91",
    delta = "#e5b95c",
  },
})
```

## Explicitly Supported plugins

- [Blink](https://github.com/Saghen/blink.cmp)
- [Cmp](https://github.com/hrsh7th/nvim-cmp)
- [Dashboard](https://github.com/nvimdev/dashboard-nvim)
- [Diffview](https://github.com/sindrets/diffview.nvim)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [Neotest](https://github.com/nvim-neotest/neotest)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Snacks](https://github.com/folke/snacks.nvim)
- [Rainbow delimiters](https://github.com/hiphish/rainbow-delimiters.nvim)
- [Mini](https://github.com/echasnovski/mini.nvim)
- [Vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace)

## Extras

Extra color configs for [Ghostty](https://ghostty.org/),
[Alacritty](https://github.com/alacritty/alacritty),
[Kitty](https://sw.kovidgoyal.net/kitty) and [foot](https://codeberg.org/dnkl/foot) can be
found in [extras](extras/). To use them, refer to their respective
documentation.

## Contributing

PR's are welcome and encouraged.

If you would like to propose support for a specific plugin, you can make a PR with your modifications to the `lua/anysphere/groups` directory
# anysphere.nvim
