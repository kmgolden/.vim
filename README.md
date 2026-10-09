# .vim

Personal vim config. Plugins are git submodules under `pack/plugins/start/`
(native Vim 8+ packages, no plugin manager).

## Install

```sh
git clone --recurse-submodules https://github.com/kmgolden/.vim.git ~/.vim
```

Vim reads `~/.vim/vimrc` directly. On Windows, native Vim looks in
`~/vimfiles`, so link it: `New-Item -ItemType Junction ~/vimfiles -Target ~/.vim`.

Machine-specific settings go in `~/.vimrc.local` (outside this repo).

## Update plugins

Submodules are pinned to a commit until you bump them. Each one tracks its
upstream branch (see `.gitmodules`), so to pull the latest of everything:

```sh
git submodule update --init --remote
git commit -am "Bump plugins"
```

## Add a plugin

```sh
git submodule add -b master https://github.com/OWNER/REPO.git pack/plugins/start/REPO
```
