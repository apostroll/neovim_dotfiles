# neovim_dotfiles

## Requirements

* neovim 0.7.X
* a working compiler for treesitter. (`sudo apt install build-essential` on Debian)
* git (`sudo apt install git-core` on Debian)
* xclip for working clipboard. (`sudo apt install xclip` on Debian)
* ripgrep for live grepping of files (`sudo apt install ripgrep` on Debian)
* Several dependencies depending on the language servers you need installed.

## Installation

Download and install neovim from [github releases](https://github.com/neovim/neovim/releases/tag/v0.8.0)

Clone this repository inside the folder for neovim's configuration
```
$ mkdir ~/.config/nvim
$ cd ~/.config/nvim
$ git clone https://github.com/apostroll/neovim_dotfiles.git .
```

Run neovim to download/install packer and the remaining plugins. You'll need to then restart nvim for the plugins to load.

Check for problems using `:checkhealth`
