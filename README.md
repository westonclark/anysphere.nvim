# Anysphere

A clean, dark colorscheme for Neovim with modern syntax highlighting and plugin support.

## Features

- Clean, organized code structure
- Modern Treesitter support
- Built-in LSP diagnostic highlighting
- Popular plugin support (Telescope, GitSigns, etc.)
- Easy customization

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "your-username/anysphere.nvim",
  config = function()
    vim.cmd("colorscheme anysphere")
  end
}
```

### Manual

```bash
git clone https://github.com/your-username/anysphere.nvim ~/.config/nvim/pack/plugins/start/anysphere.nvim
```

Then in your `init.lua`:

```lua
vim.cmd("colorscheme anysphere")
```

## Configuration

Basic usage (no configuration needed):

```lua
vim.cmd("colorscheme anysphere")
```

With transparency enabled:

```lua
require("anysphere").setup({
  transparent = true
})
vim.cmd("colorscheme anysphere")
```

With custom colors:

```lua
require("anysphere").setup({
  transparent = false,  -- Optional: disable transparency (default)
  colors = {
    bg = "#000000",      -- Override background
    fg = "#ffffff",      -- Override foreground
    string = "#ff69b4",  -- Override string color
    -- ... any palette color
  }
})
vim.cmd("colorscheme anysphere")
```

## Debugging

To enable debug prints that show transparency settings:

```lua
vim.g.anysphere_debug = true
require("anysphere").setup({
  transparent = true
})
vim.cmd("colorscheme anysphere")
```

## Supported Plugins

- LSP (built-in diagnostics and references)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [GitSigns](https://github.com/lewis6991/gitsigns.nvim)

Plugin support is automatically detected and loaded.

## Color Palette

Access the color palette in your config:

```lua
local colors = require("anysphere").get_palette()
print(colors.bg)     -- "#1a1a1a"
print(colors.func)   -- "#efb080"
-- ... etc
```

## Structure

The colorscheme is organized into clean, focused modules:

```
lua/anysphere/
├── init.lua              -- Main setup function
├── palette.lua           -- All colors defined here
└── highlights/
    ├── editor.lua        -- UI highlights
    ├── syntax.lua        -- Basic syntax highlighting
    ├── treesitter.lua    -- Modern syntax highlighting
    └── plugins/          -- Plugin-specific highlights
        ├── lsp.lua
        ├── telescope.lua
        └── gitsigns.lua
```
