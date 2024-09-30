# My Neovim Configuration

Custom neovim configuration used on both MacOS and Arch Linux.

Based on NVChad, with changes to some keybindings, terminal behavior, language servers, formatters, and linters.

To get language servers to run on your machine, ensure npm and python-venv are installed. Then, in neovim, run the following command:

:MasonInstallAll

LSP/Formatting/Linting support for the following:

- Lua
- Python
- C/C++
- Rust
- JavaScript/TypeScript (Node.js) (** On node_support branch only ** )

For treesitter support for languages, run the following command in neovim:
:TSInstall <programming language>

WARNINGS:

- I use null-ls for the linters and formatters so they perform like language servers. However, null-ls is currently archived and will not receive future support, so this may eventually break.
- I have not extensively tested the JavaScript functionality, so this may have errors in it. Because of this, I have branched this functionality, but will merge it once I confirm it works.
