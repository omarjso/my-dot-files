# 💤 LazyVim

I am using the starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Quick Intro

LazyVim is a Neovim setup powered by 💤 lazy.nvim to make it easy to customize and extend your config. See this [book](https://lazyvim-ambitious-devs.phillips.codes/) for an extensive guide on how to use LazyVim.

## My Configuration

### Options

- Indentation
  - default to 4
- Cursor
  - highlight only the number portion of the line the cursor and change its color
  - make the cursor a block in all modes

### Keybinds

- Map mistypings of `wq` to exit and save
  - disable `q:` [(issue)](https://github.com/Saghen/blink.cmp/issues/893)

### Plugins

The are three categories of plugins in LazyVim:
1- Plugins that are preconfigured in LazyVim
2- LazyExtras which are not enabled by default but integrate well
3- Third-party plugins which LazyVim has no awareness of.

- Disabled from LazyVim
  - `folke/noice.nvim` [(link)](https://github.com/folke/noice.nvim)
    - pretty UI for `cmdline`, `messages`, and `popupmenu`
- Extras
  - AI configured with the help of this [chapter](https://lazyvim-ambitious-devs.phillips.codes/course/chapter-16/)
    - `coding.copilot`, `coding.copilot-chat`
  - `coding.luasnip`
    - Snippets are saved in `nvim/snippets/`
- Third-party
  - `gruvbox` [(link)](https://github.com/ellisonleao/gruvbox.nvim)
    - theme
  - `nvim-tmux-navigator` [(link)](https://github.com/christoomey/vim-tmux-navigator)
    - navigate between nvim and tmux panes
    - lazyvim by defualt maps `<C-{i,j,k,l}>` to navigate between windows by
      mapping to `<C-W>{i,j,k,l}`. This [must be
      overridden](https://www.lazyvim.org/configuration/plugins#%EF%B8%8F-adding--disabling-plugin-keymaps)

### LSPs

Using `mason.nvim` which is preconfigured with LazyVim.
