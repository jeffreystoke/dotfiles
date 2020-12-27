# dotfiles

Manage home directory with `git` directly

## Usage

### Prerequisites

- `git` >= `2.25.0`

### Initialize

1. Backup your existing `${HOME}` directory (or just move it to somewhere else)
1. Remove existing home directory by running `rm -rf ${HOME}`
1. Clone this repo as your home directory
    - `git clone --no-checkout https://github.com/jeffreystoke/dotfiles.git ${HOME}`
    - Set sparse-checkout mode: `git sparse-checkout init`
    - Keep functional files only: `cat sparse-checkout-files.txt | git sparse-checkout set --stdin`
1. Move files back to your `${HOME}` and resolve possible overrides according to `git status`
1. (Optional) Update remote url to your private repo so you can sync to remote with credentials

### Update

Keep your home directory infrastructure updated

1. Run `git stash` to save all overrides to `${HOME}`
1. Update `${HOME}` by executing `git pull --rebase`
1. Run `git stash pop` and resolve all conflicts

### Uninstall

1. Backup your existing `${HOME}` directory without `${HOME}/.git`
1. Remove `${HOME}/.git` and move other files back to `${HOME}`

## Maintenance

### Add files or directories

- Add new files and directories
- Update `sparse-checkout-files.txt` to include new files

## LICENSE

MIT
