<p align="center">
<img src="https://user-images.githubusercontent.com/9512444/178539095-e17ee384-a9b9-49bc-8b76-f3711074c88c.png" alt="OneDarkPro.nvim" />
</p>

<h1 align="center">OneDarkPro.nvim</h1>

<p align="center">
<a href="https://github.com/olimorris/onedarkpro.nvim/stargazers"><img src="https://img.shields.io/github/stars/olimorris/onedarkpro.nvim?color=c678dd&logoColor=e06c75&style=for-the-badge"></a>
<a href="https://github.com/olimorris/onedarkpro.nvim/issues"><img src="https://img.shields.io/github/issues/olimorris/onedarkpro.nvim?color=%23d19a66&style=for-the-badge"></a>
<a href="https://github.com/olimorris/onedarkpro.nvim/blob/main/LICENSE"><img src="https://img.shields.io/github/license/olimorris/onedarkpro.nvim?color=%2361afef&style=for-the-badge"></a>
<a href="https://github.com/olimorris/onedarkpro.nvim/actions/workflows/ci.yml"><img src="https://img.shields.io/github/workflow/status/olimorris/onedarkpro.nvim/Tests?label=tests&style=for-the-badge"></a>
</p>

<p align="center">
    Highly customisable Neovim colorscheme. With support for custom colors, styles and highlights by filetype<br>
    Inspired by VS Code's <a href="https://github.com/Binaryify/OneDark-Pro">One Dark Pro</a>
</p>

<div align="center">
  <h3>onedark</h3><img src="https://user-images.githubusercontent.com/9512444/178539204-1b4b6b2a-653c-4ed3-b2e4-d0ebfda18c00.png" alt="onedark" />
  <h3>onelight</h3><img src="https://user-images.githubusercontent.com/9512444/178539496-c98e2210-006d-4489-8f3d-eca9293f23bf.png" alt="onelight" />
  <h3>onedark vivid</h3><img src="https://user-images.githubusercontent.com/9512444/178539827-0f376e2c-37bd-4f38-8aa2-1d3115557ddc.png" alt="onedark vivid" />
  <h3>onedark dark</h3><img src="https://user-images.githubusercontent.com/9512444/178539884-b9377c3c-6754-49d2-ae8d-b1d29d90519a.png" alt="onedark dark" />
</div>

## :book: Table of Contents<!-- omit in toc -->

- [Features](#sparkles-features)
- [Requirements](#zap-requirements)
- [Installation](#package-installation)
- [Usage](#rocket-usage)
- [Configuration](#wrench-configuration)
  - [Default configuration](#default-configuration)
  - [Configuring themes](#configuring-themes)
  - [Configuring plugins](#configuring-plugins)
  - [Configuring styles](#configuring-styles)
  - [Configuring colors](#configuring-colors)
  - [Configuring highlight groups](#configuring-highlight-groups)
  - [Configuring filetype highlight groups](#configuring-filetype-highlight-groups)
  - [Configuring options](#configuring-options)
- [Supported Plugins](#electric_plug-supported-plugins)
- [Comparison to VS Code's One Dark Pro](#microscope-comparison-to-vs-codes-one-dark-pro)
- [Extras](#gift-extras)
- [Credits](#clap-credits)

## :sparkles: Features

- Override default styles, colors, highlight groups and filetype highlight groups
- Create custom highlight groups and highlight groups by filetypes
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) support
- Support for many [popular plugins](#electric_plug-supported-plugins)

## :zap: Requirements

- Neovim 0.5 or greater (0.7 or above for filetype highlights)
- `termguicolors` enabled for true color support
- `treesitter` for full syntax highlighting

## :package: Installation

Install with your package manager:

```lua
use "olimorris/onedarkpro.nvim"    -- Packer
```
```vim
Plug 'olimorris/onedarkpro.nvim'   " Vim-Plug
```
## :rocket: Usage

Use the built-in `:colorscheme` command:

```lua
vim.cmd("colorscheme onedarkpro")
```
```vim
colorscheme onedarkpro
```

## :wrench: Configuration

### Default configuration

A call to the `setup` function is only required if you wish to change the defaults:

```lua
require("onedarkpro").setup({
  dark_theme = "onedark", -- The default dark theme
  light_theme = "onelight", -- The default light theme
  -- The theme function can be overwritten with a string value for the theme
  theme = function()
      if vim.o.background == "dark" then
          return config.dark_theme
      else
          return config.light_theme
      end
  end,
  colors = {}, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
  hlgroups = {}, -- Override default highlight groups
  filetype_hlgroups = {}, -- Override default highlight groups for specific filetypes
  plugins = { -- Override which plugin highlight groups are loaded
    -- ...
  },
  styles = { -- Choose from "bold,italic,underline"
      strings = "NONE", -- Style that is applied to strings.
      comments = "NONE", -- Style that is applied to comments
      keywords = "NONE", -- Style that is applied to keywords
      functions = "NONE", -- Style that is applied to functions
      variables = "NONE", -- Style that is applied to variables
      virtual_text = "NONE", -- Style that is applied to virtual text
  },
  options = {
      bold = false, -- Use the colorscheme's opinionated bold styles?
      italic = false, -- Use the colorscheme's opinionated italic styles?
      underline = false, -- Use the colorscheme's opinionated underline styles?
      undercurl = false, -- Use the colorscheme's opinionated undercurl styles?
      cursorline = false, -- Use cursorline highlighting?
      transparency = false, -- Use a transparent background?
      terminal_colors = false, -- Use the colorscheme's colors for Neovim's :terminal?
      window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
  }
})
```

### Configuring themes

Currently, there are four themes available:

- `onedark`
- `onelight`
- `onedark_vivid`
- `onedark_dark`

A default theme can be set with:

```lua
theme = "onedark_vivid",
```

If no value is specified, the colorscheme will use the values as per the default config. This will use the `vim.o.background` option to set the theme. With a dark background, the theme will use `onedark` and with a light background, `onelight`. For greater customisation with the `vim.o.background` option, default dark and light themes can be set:

```lua
dark_theme = "onedark_vivid",
light_theme = "onelight",
```

### Configuring plugins

> **Note:** For a full list of plugins supported, and their names, see the plugins [folder](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/plugins)

By default, all of the plugins supported by the theme are loaded at runtime. Specific plugins can be disabled as follows:

```lua
plugins = {
  native_lsp = false,
  polygot = false,
  treesitter = false
}
```

Alternatively, all of the plugins can be disabled at once:

```lua
plugins = {
  all = false
}
```

Or, all of the plugins can be disabled with only a select few enabled:

```lua
plugins = {
  all = false
  native_lsp = true,
  treesitter = true
}
```

### Configuring styles

Within the colorscheme, collections of highlight groups have been grouped together into `styles`. For users who use monospaced fonts with nice italics, this can go someway to enhancing the aesthetic of the colorscheme. These styles may be configured as below:

```lua
styles = {
  comments = "italic",
  functions = "NONE",
  keywords = "bold,italic",
  strings = "NONE",
  variables = "NONE",
  virtual_text = "NONE"
}
```

Where **italic**, **bold**, **underline** and **NONE** are possible values for styles.

### Configuring colors

The colorscheme has a palette of 13 core colors alongside many additional ones used for menus and git diffs. These colors can be found in the [color files](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/colors).

The default colors can be changed by specifying the name of the color and the new hex code:

```lua
colors = {
  red = "#FF0000"
}
```

#### Specifying new colors

New colors may be defined which will then be merged into a theme's color palette:

```lua
colors = {
  my_new_red = "#f44336"
}
```

> **Note:** Custom colors can also be referenced when creating custom highlight group overrides in `hlgroups`

#### Specifying colors by theme

It's possible to override default colors within a theme such as the `bg` color. This is a common question for those who wish to have a darker background than the default. Of course it would make sense to have different `bg` colors for the `onedark` and `onelight` themes. This can be achieved by specifying the theme name as a table, followed by the color:

```lua
colors = {
  onedark = {
    bg = "#FFFF00" -- yellow
  },
  onelight = {
    bg = "#00FF00" -- green
  }
}
```

### Configuring highlight groups

The [editor.lua](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/highlights/editor.lua), [syntax.lua](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/highlights/syntax.lua) file and [plugins](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/highlights/plugins) use a large array of highlight groups. There are three ways to customize them:

1. Using specific hex colors
2. Referencing the name of color variables
3. Linking to other highlight groups in the theme

```lua
hlgroups = { -- Overriding the Comment highlight group
  Comment = { fg = "#FF0000", bg = "#FFFF00", style = "italic" }, -- 1
  Comment = { fg = "${my_new_red}" bg = "${yellow}", style = "bold,italic" }, -- 2
  Comment = { link = "Substitute" } -- 3
}
```

### Configuring filetype highlight groups

The original <a href="https://binaryify.github.io/OneDark-Pro">One Dark Pro</a> utilises custom highlights based on filetype to achieve its distinctive look. This can also be achieved within the colorscheme:

```lua
filetype_hlgroups = {
  yaml = { -- Use the filetype as per the `set filetype?` command
    TSField = { fg = "${red}" }
  },
  python = {
    TSConstructor = { fg = "${bg}", bg = "${red}" }
  }
}
```

> **Note:**
> - Neovim 0.7 or above is required for filetype highlights
> - Currently support for highlighting in Telescope's previewer is unavailable
> - Please see [this issue](https://github.com/olimorris/onedarkpro.nvim/issues/24) for how other users are configuring their theme by filetype
> - The excellent [hlargs.nvim](https://github.com/m-demare/hlargs.nvim) plugin allows for greater customisation over arguments definitions and usages

#### Ignoring filetypes and buffer types

Filetype highlight groups work by detecting the filetype of the current buffer and checking the user's config to determine if any should be applied. As the user moves between buffers, the theme checks for a filetype change and applies any new highlights as necessary.

When using common plugins such as [Telescope](https://github.com/nvim-telescope/telescope.nvim) or [Trouble](https://github.com/folke/trouble.nvim), additional windows with distinct filetypes are opened. This can cause the colorscheme to reapply the default highlight groups as it detects a buffer filetype change. When closing the windows, the user's custom filetype highlight groups are then lost. To prevent this from happening, the colorscheme has a table of filetypes and buffer types to ignore:

```lua
filetype_hlgroups_ignore = {
  filetypes = {
    "^aerial$",
    "^alpha$",
    "^fugitive$",
    "^fugitiveblame$",
    "^help$",
    "^NvimTree$",
    "^packer$",
    "^qf$",
    "^startify$",
    "^startuptime$",
    "^TelescopePrompt$",
    "^TelescopeResults$",
    "^terminal$",
    "^toggleterm$",
    "^undotree$"
  },
  buftypes = {
    "^terminal$"
  }
```

Additional filetypes and buffer types can be added in the config.

### Configuring options

#### Formatting

Alongside styles, the colorscheme applies some opinionated formatting. These can be found in the [theme.lua](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/theme.lua) file with `style` options containing `theme.*` values.

These can be configured with the following options:

```lua
options = {
  bold = true, -- Use the colorscheme's opinionated bold styles?
  italic = true, -- Use the colorscheme's opinionated italic styles?
  underline = true, -- Use the colorscheme's opinionated underline styles?
  undercurl = true -- Use the colorscheme's opinionated undercurl styles?
}
```

#### Transparency

The colorscheme supports transparent backgrounds:

```lua
options = {
  transparency = true
}
```

By setting the transparency option to true, the `Normal`, `Folded`, `SignColumn`, `Statusline` and `Tabline` groups will have a `NONE` background color. Additional transparency may be achieved by overriding more highlight groups.

#### Terminal Colors

The colorscheme supports changing the colors for Neovim's `:terminal`:

```lua
options = {
  terminal_colors = true
}
```

#### Window Focus Color

The colorscheme supports changing the color of the main window in Neovim when focussed is lost. For example, when a `telescope` or `packer` pop up appears:

```lua
options = {
  window_unfocussed_color = true
}
```

> **Note:** This can be seen in the [Python screenshots](#python) above where `nvim-tree` is opened and out of focus

#### Cursorline

Cursorline highlighting is supported in the colorscheme using a `cursorline` color (which may of course be overriden). This can be enabled with the following:

```lua
colors = {
  cursorline = "#FF0000" -- This is optional. The default cursorline color is based on the background
},
options = {
  cursorline = true
}
```

## :electric_plug: Supported Plugins

The colorscheme supports the following plugins:
  - [aerial.nvim](https://github.com/stevearc/aerial.nvim)
  - [barbar.nvim](https://github.com/romgrk/barbar.nvim)
  - [Copilot.vim](https://github.com/github/copilot.vim)
  - [Dashboard](https://github.com/glepnir/dashboard-nvim)
  - [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
  - [Hop.nvim](https://github.com/phaazon/hop.nvim)
  - [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim/tree/lua)
  - [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)
  - [marks.nvim](https://github.com/chentau/marks.nvim)
  - [Neotest](https://github.com/nvim-neotest/neotest)
  - [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
  - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
  - [nvim-dap](https://github.com/mfussenegger/nvim-dap)
  - [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
  - [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens)
  - [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
  - [nvim-notify](https://github.com/rcarriga/nvim-notify)
  - [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
  - [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)
  - [packer.nvim](https://github.com/wbthomason/packer.nvim)
  - [polygot](https://github.com/sheerun/vim-polyglot)
  - [startify](https://github.com/mhinz/vim-startify)
  - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
  - [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
  - [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  - [Trouble](https://github.com/folke/trouble.nvim)
  - [Vim Ultest](https://github.com/rcarriga/vim-ultest)
  - [Which Key](https://github.com/folke/which-key.nvim)

## :microscope: Comparison to VS Code's One Dark Pro

### Python<!-- omit in toc -->
<img src="https://user-images.githubusercontent.com/9512444/178540087-bda08b3c-fab3-422f-bcb2-46a521de4738.png" alt="Comparison to VS Code - Python" />

### React<!-- omit in toc -->
<img src="https://user-images.githubusercontent.com/9512444/178540105-73dd2fa9-282b-4332-8bae-1ba26a8551cc.png" alt="Comparison to VS Code - React" />

> **Note:** A greater likeness to Visual Studio Code can be achieved by using the theme's ability to [customise highlight groups by filetype](#configuring-filetype-highlight-groups)

## :gift: Extras

### Terminal themes<!-- omit in toc -->

The colorscheme comes with [Alacritty](https://github.com/alacritty/alacritty) and [Kitty](https://github.com/kovidgoyal/kitty) themes. These can be found in the [extras](https://github.com/olimorris/onedarkpro.nvim/tree/main/extras) folder.

### Helpers<!-- omit in toc -->

#### Theme color tables

To enable the theme's colors to be extracted and used elsewhere in the Neovim config, a helper function, `get_colors()`, has been included. This returns a table of the theme's current colors.

```lua
local colors = require("onedarkpro").get_colors(vim.g.onedarkpro_theme)
print(colors.purple) -- #9a77cf
```

> **Note:** The global variable `vim.g.onedarkpro_theme` automatically detects whether to use the `onedark` or `onelight` theme.

#### Toggling between themes

To enable the easy switching between themes, the following helper function could be used:

```lua
function ToggleTheme()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end
```

#### Configuring styles/colors/highlight groups based on the theme

When configuring the colorscheme, it may be useful to apply different colors or styles depending on whether `onedark` or `onelight` is active. This can be achieved by applying a conditional in the configuration:

```lua
hlgroups = {
  TSField = {
    fg = (vim.o.background == "dark" and "${red}" or "${green}")
  }
}
```

## :clap: Credits

### Contributors<!-- omit in toc -->

Thanks to the following contributors for their work on the colorscheme:

- [mmirus](https://github.com/mmirus) - [contributions](https://github.com/olimorris/onedarkpro.nvim/commits?author=mmirus)

### Inspiration<!-- omit in toc -->

The following colorschemes were used as an inspiration:

- [One Dark Pro](https://github.com/Binaryify/OneDark-Pro) - The inspiration for this colorscheme
- [Nightfox](https://github.com/EdenEast/nightfox.nvim) - For the beautiful code base and structure
- [GitHub nvim theme](https://github.com/projekt0n/github-nvim-theme) - For the logo inspiration
