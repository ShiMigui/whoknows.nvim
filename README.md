# whoknows.nvim

A simple and powerful Neovim configuration. Built by me, for me.

## Overview

This project aims to provide a fast, clean and modern Neovim setup with sensible defaults, LSP support, snippets, Treesitter, Telescope and various productivity enhancements. It is intended primarily for personal use, but can be adapted by anyone familiar with Lua-based Neovim configs.

## Requirements

Below are the required and optional dependencies grouped by category, followed by installation examples for Arch, Debian/Ubuntu and Fedora.

### Core

* neovim (v0.11+ recommended)
* git
* curl or wget, 
* unzip, tar or gzip
* wl-clipboard (Wayland) or xclip (X11)

### Languages and Toolchains

* lua5.1
* nodejs + npm
* gcc or clang
* make or cmake

### Recommended Extras

* ripgrep (rg)
* fd
* tree-sitter-cli
* rustup (for cargo-based tools)
* python (3.10+) and pip
* go
* pynvim (python)
* npm package: neovim

## Installation Examples

Below are minimal examples for installing common dependencies.

### Arch Linux

```bash
sudo pacman -S --needed neovim git lua51 curl wget unzip tar gzip \
  tree-sitter-cli ripgrep fd nodejs npm python python-pynvim go clang cmake make gcc
sudo npm install -g neovim
```

### Debian / Ubuntu

```bash
sudo apt update
sudo apt install -y neovim git lua5.1 curl wget unzip tar gzip \
  ripgrep fd-find nodejs npm python3 python3-pip golang clang \
  build-essential cmake
pip3 install --user pynvim
npm install -g neovim
```

Note: On Debian/Ubuntu, `fd` is provided as `fdfind`. You may want:

```bash
sudo ln -s $(which fdfind) /usr/local/bin/fd
```

### Fedora

```bash
sudo dnf install -y neovim git lua5.1 curl wget unzip tar gzip \
  ripgrep fd-find nodejs npm python3 python3-pip golang clang \
  gcc cmake make
pip3 install --user pynvim
npm install -g neovim
```

## License

This project is under [MIT License](./LICENSE)
