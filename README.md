# dotfiles

Manage `${HOME}` directory with `git` directly

- [Purpose](#purpose)
- [Features](#features)
- [Usage](#usage)
  - [Prerequisites](#prerequisites)
  - [Initialize](#initialize)
  - [Setup](#setup)
  - [Update](#update)
  - [Uninstall](#uninstall)
- [Repo Maintenance](#repo-maintenance)
  - [Adding files or directories](#adding-files-or-directories)
- [LICENSE](#license)

## Purpose

There are a lot of `dotfiles` projects, but in my personal experience, most of them only provide configurations of various kinds of tools, this project is trying to embrace them with some concise core files for config syncing:

- Organized customization using existing dotfiles projects (without changing core files)
- Continuous update of core files with git

## Features

- [`git` config management for multiple workspaces](./docs/git.md)
- [`zsh` config management with `oh-my-zsh`](./docs/zsh.md)
- [`kubectl` config management with `kubie`](./docs/kubectl.md)

## Usage

### Prerequisites

- `git` >= `2.25.0`

### Initialize

1. Set environment variable `DOTFILES_HOME` (defaults to your `${HOME}`)
2. Set environment variable `SETUP_METHOD` (defaults to `git-init`)
   - `git-init`: Init a new git repo in `${DOTFILES_HOME}`
     - You may need to backup your `${DOTFILES_HOME}` directory if it's not empty
   - `git-clone`: Create `${DOTFILES_HOME}` directory
     - `${DOTFILES_HOME}` MUST NOT exist
3. Initialize `${DOTFILES_HOME}`
    - with curl: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/jeffreystoke/dotfiles/master/scripts/setup.sh)"`
    - with wget: `sh -c "$(wget -qO- https://raw.githubusercontent.com/jeffreystoke/dotfiles/master/scripts/setup.sh)"`
4. Move files back to your `${DOTFILES_HOME}` and resolve possible overrides according to `git status`
5. Add private repo as remote `origin` for secret config syncing
   - `git remote add origin ${MY_PRIVATE_REPO_URL}`

__NOTE:__ When using this repo as a template, set `DOTFILES_UPSTREAM` and `DOTFILES_UPSTREAM_BRANCH` environment variable according to your own repo settings before initialization

### Setup

Configure tools following instructions in [feature docs](#features)

### Update

1. Go to `${DOTFILES_HOME}`
2. Run `git stash` to save all overrides to `${DOTFILES_HOME}`
3. Update core files by executing `git pull upstream master --rebase`
4. Run `git stash pop` and resolve all conflicts
5. Commit your changes and push to `origin`

### Uninstall

1. Backup your data in dotfiles (show them with `git sparse-checkout list | xargs -I0 echo "${HOME}0"`)
1. Remove all files from this project by running `git sparse-checkout set ""`
1. Remove `${DOTFILES_HOME}/.git`
1. Restore your data to their origin directories

## Repo Maintenance

### Adding files or directories

The [root `.gitignore`](./.gitignore) is configured to ignore all files by default for `${HOME}`, so when you want to add files in this repo, you must:

- Add new files and directories
- Update `.gitignore` to exclude new files
- If the new files are expected to present in `${HOME}`, add them to `.gitkeep`

## LICENSE

MIT
