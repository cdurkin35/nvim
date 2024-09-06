# My Neovim Configuration

Custon neovim configuration used on both MacOS and Arch Linux.

Based on NVChad, with changes to some keybindings, terminal behavior, language servers, formatters, and linters.

To get language servers to run on your machine, ensure npm and python-venv are installed. Then, in neovim, run the following command:

:MasonInstallAll

LSP/Formatting/Linting support for the following languages:

 - Lua
 - Python
 - C/C++
 - Rust

 For treesitter support for languages, run the following command in neovim:
 :TSInstall <programming language>
