# longway.nvim

A Neovim plugin written in Fennel.

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "yourusername/longway.nvim",
  config = function()
    require("longway").setup({
      -- Your configuration here
      enabled = true,
      debug = false,
    })
  end,
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "yourusername/longway.nvim",
  config = function()
    require("longway").setup()
  end
}
```

## Configuration

Default configuration:

```lua
{
  enabled = true,
  debug = false,
}
```

## Usage

### Commands

- `:LongwayHello` - Example command that prints a greeting

### API

```lua
local longway = require("longway")

-- Setup with custom options
longway.setup({
  enabled = true,
  debug = true,
})

-- Access core functions
longway.core.hello()
```

## Development

This plugin is written in [Fennel](https://fennel-lang.org/) and uses [nfnl](https://github.com/Olical/nfnl) for compilation.

### Project Structure

```
longway.nvim/
├── fnl/              # Fennel source files
│   └── longway/
│       ├── init.fnl  # Main entry point with setup()
│       ├── config.fnl # Configuration management
│       └── core.fnl  # Core functionality
├── lua/              # Compiled Lua files (auto-generated)
│   └── longway/
├── plugin/           # Vim plugin loader
└── doc/              # Documentation
```

### Building

The plugin uses nfnl for automatic Fennel to Lua compilation. When you edit `.fnl` files, they are automatically compiled to `.lua` files.

To manually compile:
```bash
# Compile all Fennel files
nfnl compile
```

## License

MIT

## Credits

Built with [nfnl](https://github.com/Olical/nfnl) and [Fennel](https://fennel-lang.org/).
