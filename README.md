# My collection of configs I use every day

☀️ Light theme ❤️

---

Keybindings may seem kinda odd, but are adapted to the German **Neo 2**
Keyboard Layout.


Configurations are _applied_ with `stow`.


## Setup

Everything is weird, but it has its reason.

- [zsh](./zsh/.config/zsh) configuration files seem scattered through the whole
repository, but are placed in the belonging package. After stowing the package
they are linked into [~/.config/zsh/](./zsh/.config/zsh)

- [neovim](./nvim/.config/nvim) is configured with lua. Plugin config is placed
in [after/plugin/](./nvim/.config/nvim/after/plugin). It starts fast enough, for
me.

- [bspwm](./bspwm/) as WM with _sxhkd_ and _lemonbar_. Multi monitor set up with
desktop sharing over all monitors.

- Scripts are placed in _PACKAGE_/.local/bin/ and get linked into ~/.local/bin

