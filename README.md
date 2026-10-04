# dotfiles

## Dependencies

- git
- stow
- zsh

## Installation

1. Clone the repository into your home directory

```bash
git clone --recurse-submodules git@github.com:cxredvmp/.dotfiles.git
cd .dotfiles
```

2. Symlink the configuration files using stow

**Warning:** The following will overwrite any conflicting configuration files.

```sh
stow --adopt -t ~ .
git restore .
```
