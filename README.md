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
  - sensible defaults
- tmux-resurrect
  - restrating tmux with the same layout after computer restart
- tmux-continuum
  - built on top of tmux-resurrect and makes it automatic
- tmux-yank
  - copy to system clipboard in tmux
- tmux-ssh-split
  - allow splitting panes to the same server with ssh

### Keybinds

- Changed leader to `a` instead of `b`
- Changed visual mode to vim mode

### Vim pane integration

Added smart switching between tmux panes and vim panes

### Issues and Solutions

#### `resize-pane` shortcut not working on iTerm

At some point the `resize-pane` shortcut stopped working on iTerm. On
2025-03-06, I fixed this by following the following SuperUser
[answer](https://superuser.com/questions/660013/resizing-pane-is-not-working-for-tmux-on-mac).
Essentially, the sequences `C-Up,Down,Left,Right` weren't being sent correctly
by `iTerm`. This can be checked by running `cat` and pressing the keys. The fix
is changing the `iTerm` profile to send the correct sequences.

---

## Neovim

See [this](./nvim/README.md)

## Sioyek

Currently I am using
[sioyek](https://sioyek-documentation.readthedocs.io/en/latest/index.html) as
the pdf viewer for my `vimtex`.

### Configs Changes

- Added `<C-r>` to reload the screen
- Added `<C-x>` to toggle synctex
