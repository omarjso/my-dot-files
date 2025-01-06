## Zsh

### Plugins
- git (what does this do?)

### Aliases
I have a file of aliases in `~/.aliases/.bash_aliases` which is composed of
both dynamically generated aliases

### Conda
I appended conda at the end of `PATH` so that conda environments have 
precedence over other python installations

---

## Tmux

### Plugins
- tpm
    - pluggin manager
- tmux-sensible
- tmux-resurrect
- tmux-continuum
- tmux-yank

### Keybinds
- Changed leader to `a` instead of `b`
- Changed visual mode to vim mode

### Vim pane integration
Added smart switching between tmux panes and vim panes

---

## Neovim

### lazy
I am using the starter config from [lazyvim starter](https://github.com/LazyVim/starter)

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
- `lazy` [(link)](https://github.com/LazyVim/LazyVim)
    - pluggin manager
- `gruvbox` [(link)](https://github.com/ellisonleao/gruvbox.nvim)
    - theme
- `nvim-tmux-navigator` [(link)](https://github.com/christoomey/vim-tmux-navigator)
    - navigate between nvim and tmux panes
    - lazyvim by defualt maps `<C-{i,j,k,l}>` to navigate between windows by mapping to `<C-W>{i,j,k,l}`. This [must be overridden](https://www.lazyvim.org/configuration/plugins#%EF%B8%8F-adding--disabling-plugin-keymaps)
