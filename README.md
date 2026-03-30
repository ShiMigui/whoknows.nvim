# shimi.nvim

A modular **Neovim configuration** written in Lua, designed to be:

- Simple but powerful
- Easy to understand and extend
- Fast to bootstrap with `lazy.nvim`
- Ready for modern development workflows
  > A clean starting point for people who want control over their setup without dealing with bloated configs.

## Features

- Plugin management via `lazy.nvim`
- Structured keymap system (grouped by domain)
- Fuzzy finding with `telescope.nvim`
- Automatic LSP setup with `mason-catalog.nvim`
- Autocompletion with `nvim-cmp` + `LuaSnip`
- Theme: `tokyonight`
- Lightweight file explorer (`mini.files`)
- Formatting via `conform.nvim`
- Syntax highlighting with `treesitter`
- Git integration with `gitsigns.nvim`
- UI utilities from `mini.nvim`

## Project Structure

```bash
.
├── lua/
│   ├── core/
│   │   ├── mapping.lua   # Keymap system
│   │   ├── opts.lua      # Neovim options
│   │   └── lazy.lua      # lazy.nvim bootstrap
│   └── plugins/          # Plugin definitions
```

## Keymap System

Keymaps are organized into logical groups:

- `core`
- `ui`
- `lsp`
- `workspace`
- `diagnostic`
- `codelens`
- `terminal`
- `custom`
  Example:

```lua
M.lsp.definition = { lhs = "gd", rhs = buf.definition, desc = "Go to definition" }
```

Each mapping consists of:

- `lhs`: Key sequence that triggers the mapping
- `rhs`: Function or command to be executed
- `desc`: Description used by tools like `which-key`
  This structure makes it easy to override and extend mappings without chaos.

## Installation

### 1. Clone Repository

```bash
git clone https://github.com/ShiMigui/shimi.nvim ~/.config/nvim
```

> Fork it first (recommended). You _will_ customize it.

### 2. Start Neovim

```bash
nvim
```

`lazy.nvim` will install automatically.

### 3. Install tools

Inside Neovim:

1. Check [`mason-catalog`](./lua/plugins/mason-catalog.lua).
   It installs and configures LSP servers and formatters automatically based on filetype.
   Docs: https://github.com/ShiMigui/mason-catalog.nvim
2. Change the theme if you want
3. Have fun

## LSP & Formatting

- LSP servers are assigned by filetype, extension, or grouped rules
- Formatters:
  - `lua` → stylua
  - `php` → php-cs-fixer
  - `js/ts/css` → prettier
    Falls back to LSP formatting if needed.

## Keybindings

### Core

| Key         | Action           |
| ----------- | ---------------- |
| `<leader>q` | Close buffer     |
| `jk`        | Exit insert mode |

### UI

| Key         | Action                 |
| ----------- | ---------------------- |
| `<leader>h` | Clear search highlight |

### LSP

| Key          | Action                |
| ------------ | --------------------- |
| `gd`         | Go to definition      |
| `gD`         | Go to declaration     |
| `gi`         | Go to implementation  |
| `gt`         | Go to type definition |
| `gr`         | References            |
| `K`          | Hover documentation   |
| `<C-k>`      | Signature help        |
| `<leader>rn` | Rename symbol         |
| `<leader>ca` | Code action           |
| `<leader>f`  | Format buffer         |
| `<leader>th` | Toggle inlay hints    |

### Workspace

| Key          | Action                   |
| ------------ | ------------------------ |
| `<leader>wa` | Add workspace folder     |
| `<leader>wr` | Remove workspace folder  |
| `<leader>ws` | Search workspace symbols |
| `<leader>ds` | Search document symbols  |

### Diagnostics

| Key          | Action                  |
| ------------ | ----------------------- |
| `gl`         | Line diagnostics        |
| `[d`         | Previous diagnostic     |
| `]d`         | Next diagnostic         |
| `<leader>dl` | Diagnostics to loclist  |
| `<leader>dq` | Diagnostics to quickfix |

### CodeLens

| Key          | Action           |
| ------------ | ---------------- |
| `<leader>cl` | Run CodeLens     |
| `<leader>cr` | Refresh CodeLens |

### Terminal

| Key     | Action        |
| ------- | ------------- |
| `<C-\>` | Open terminal |

### File Explorer

| Key         | Action             |
| ----------- | ------------------ |
| `<leader>e` | Open file explorer |

### Telescope

| Key          | Action             |
| ------------ | ------------------ |
| `<leader>ff` | Find files         |
| `<leader>fg` | Live grep          |
| `<leader>fb` | Buffers            |
| `<leader>fh` | Help tags          |
| `<leader>fn` | Find Neovim config |

### Gitsigns

| Key          | Action            |
| ------------ | ----------------- |
| `]h`         | Next hunk         |
| `[h`         | Previous hunk     |
| `<leader>hs` | Stage hunk        |
| `<leader>hr` | Reset hunk        |
| `<leader>hp` | Preview hunk      |
| `<leader>hb` | Blame line        |
| `<leader>tb` | Toggle line blame |
| `<leader>hd` | Diff this         |

## Philosophy

This config avoids:

- Overengineered setups
- Hidden magic
- Hard-to-maintain complexity
  And focuses on:
- Clarity
- Modularity
- Full control

## Customization

You are expected to modify it:

- Edit keymaps (`core/mapping.lua`)
- Change theme
- Add/remove plugins
- Adjust LSP setup
  That’s the whole point.

## Contributing

Fork it, break it, rebuild it.
If it becomes better, great.

> [!NOTE]
> If you disagree with everything, you probably know what you're doing.
