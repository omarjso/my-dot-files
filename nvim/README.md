# 💤 LazyVim

I am using the starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Quick Intro

LazyVim is a Neovim setup powered by 💤 lazy.nvim to make it easy to customize
and extend your config. See this
[book](https://lazyvim-ambitious-devs.phillips.codes/) for an extensive guide
on how to use LazyVim.

## My Configuration

### Options

- Indentation
  - default to 4
- Cursor
  - highlight only the number portion of the line the cursor and change its color
  - make the cursor a block in all modes

### Keybinds

- Map mistypings of `wq` to exit and save
- Disable `q:` [(issue)](https://github.com/Saghen/blink.cmp/issues/893)
- Make `gm` open or create a markdown file if it is not created
  - Tried to append this functionality to `gx` but faced problems
    1. markdown files weren't opened as a vim buffer
    2. didn't recover exact behavior of old `gx`, for example, when opening
       links
  - see [`gx.nvim`](https://github.com/chrishrb/gx.nvim/tree/main) for
    inspiration, and this
    [conversation](https://chatgpt.com/share/67d5b8a5-b41c-800d-ba77-980e83f9d695)
    for my attempts

### Plugins

The are three categories of plugins in LazyVim:

1. Plugins that are preconfigured in LazyVim
2. LazyExtras which are not enabled by default but integrate well
3. Third-party plugins which LazyVim has no awareness of.

For each of these, these are some highlights:

- Disabled from LazyVim
  - `folke/noice.nvim` [(link)](https://github.com/folke/noice.nvim)
    - pretty UI for `cmdline`, `messages`, and `popupmenu`
- Extras
  - AI configured with the help of this [chapter](https://lazyvim-ambitious-devs.phillips.codes/course/chapter-16/)
    - `coding.copilot`, `coding.copilot-chat`
  - `coding.luasnip`
    - Snippets are saved in `nvim/snippets/`
  - `vimtex`
    - See [this](#latex)
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

## Latex

Before 2025-02-24, I ran a `vim`/`nvim` tmux pane, on the left. On the right I
had a pane that runs my own script 'commod', which runs a command whenever a
file is updated. In this case, it ran `xelatex $FILE_NAME`.

As of 2025-02-25, I am using `vimtex` with `latexmk` as a compiler and
`sioyek` as a viewer. This now provides me with new features like inverse-search and
auto-compiling without an external script.

## Remote Projects

Having a portable `nvim` configuration is one of the mains reasons I am using
my current setup with LazyVim and the `dot-files` directory. However, this runs
into some issues when I want to configure `nvim` on a remote server. For
example, the server I ssh into at KAUST has outdated GLIBC, which caused
problems with `blink.cmp`. Thus, mounting the remote project and editing it
locally is the fastest solution. It also is the solutions that causes the least
headache.

### Setup on my Mac

1- Install `macFUSE`, which is a software package that provides support for
user-space file systems on macOS.

```bash
brew install macfuse
```

2- Install `sshfs` alternative (FUSE-T), which is a filesystem client based on
the SSH File Transfer

```bash
brew install gromgit/fuse/sshfs-mac
```

3- Mount the remote directory to a local directory

```bash
mkdir -p remote-project
sshfs -o reconnect,\
cache=no,\
ServerAliveInterval=15,\
ServerAliveCountMax=3,\
ProxyJump=proxy_user@proxy_host \
user@remote_host:/remote/directory local_mount_point
```

Where the options mean:

- `-o reconnect`: Automatically reconnect to the server if the connection is
  lost.
- `cache=no`: Disable caching to ensure that the file system always reflects
  the current state of the remote directory.
- `ServerAliveInterval=15`: Send a keep-alive message to the server every 15
  seconds to maintain the connection.
- `ServerAliveCountMax=3`: If the server does not respond to 3 consecutive
  keep-alive messages, the connection will be terminated.
- `ProxyJump=proxy_user@proxy_host`: Use the specified proxy server to connect
  to the remote host.
  - Needed this for KAUST
- `user@remote_host:/remote/directory`: The remote user, host, and directory to
  mount.
- `remote-project`: The local directory where the remote file system will be mounted.
