-- This file defines all the types for the colorscheme's config,
--
-- The reason I'm maintaining 2 seperate files for the same config is to avoid
-- The annoying situation where you go to configure a plugin, and even though
-- You can do this:
--
--          require("plugin").setup({})
--
-- You still get annoying warning messages like:
--
--          ⚠ Missing required fields in type `plugin.Config`: `some_opt`
--
-- Is it more to maintain? yes.
-- Does it increase type safety for both me and you? also yes.
--
-- I'd say it's worth it.

---@alias CodeStyle "none"|"italic"|"bold"

---@class AnysphereColorscheme.style
---@field boolean? CodeStyle
---@field number? CodeStyle -- number constants
---@field float? CodeStyle -- floating point numbers
---@field error? CodeStyle -- any erroneous construct
---@field comments? CodeStyle
---@field conditionals? CodeStyle
---@field functions? CodeStyle -- function name
---@field headings? CodeStyle -- markdown headings
---@field operators? CodeStyle -- like "+"
---@field strings? CodeStyle
---@field variables? CodeStyle
---@field keywords? CodeStyle
---@field keyword_return? CodeStyle
---@field keywords_loop? CodeStyle -- "for", "while", etc
---@field keywords_label? CodeStyle -- "default", "case", etc
---@field keywords_exception? CodeStyle -- "try", "catch", etc
---@field builtin_constants? CodeStyle -- like "nil" in lua and golang
---@field builtin_functions? CodeStyle -- like "nil" in lua and golang
---@field builtin_types? CodeStyle -- like "nil" in lua and golang
---@field builtin_variables? CodeStyle -- like "this", "self"

---@class AnysphereColorscheme.plugins.cmp
---@field match? CodeStyle -- matching text for cmp plugins
---@field match_fuzzy? CodeStyle -- fuzzy matching text for cmp plugins

---@class AnysphereColorscheme.plugins.dashboard
---@field footer? CodeStyle

---@class AnysphereColorscheme.plugins.telescope
---@field match? CodeStyle -- matching text for telescope
---
---@class AnysphereColorscheme.plugins.neotest
---@field focused? CodeStyle -- style for the current focused test
---@field adapter_name? CodeStyle

---@class AnysphereColorscheme.plugins.lsp
---@field diagnostic_error? CodeStyle -- lsp diagnostic error text
---@field diagnostic_hint? CodeStyle -- lsp diagnostic hint text
---@field diagnostic_info? CodeStyle -- lsp diagnostic info text
---@field diagnostic_ok? CodeStyle -- lsp diagnostic ok text
---@field diagnostic_warn? CodeStyle -- lsp diagnostic warn text

---@class AnysphereColorscheme.plugins
---@field cmp? AnysphereColorscheme.plugins.cmp
---@field telescope? AnysphereColorscheme.plugins.telescope
---@field dashboard? AnysphereColorscheme.plugins.telescope
---@field lsp? AnysphereColorscheme.plugins.telescope

---@class AnysphereColorscheme.colors
---@field bg? string
---@field fg? string
---@field floatBorder? string
---@field line? string
---@field comment? string
---@field builtin? string
---@field func? string
---@field string? string
---@field number? string
---@field declaration? string
---@field property? string
---@field constant? string
---@field parameter? string
---@field visual? string
---@field error? string
---@field warning? string
---@field hint? string
---@field operator? string
---@field keyword? string
---@field type? string
---@field search? string
---@field plus? string
---@field delta? string

---@class AnysphereColorscheme.Config
---@field transparent? boolean
---@field bold? boolean
---@field italic? boolean
---@field style? AnysphereColorscheme.style
---@field colors? AnysphereColorscheme.colors
---@field plugins? AnysphereColorscheme.plugins
---@field on_highlights? fun(highlights: table<string, vim.api.keyset.highlight>, colors: AnysphereColorscheme.InternalConfig.colors)

---@type AnysphereColorscheme.Config | fun():AnysphereColorscheme.Config | nil
vim.g.anysphere_colorscheme = vim.g.anysphere_colorscheme
