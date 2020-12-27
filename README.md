# dotfiles

Manage home directory with `git` directly

- [Usage](#usage)
  - [Prerequisites](#prerequisites)
  - [Initialize](#initialize)
  - [Update (for those kept this repo as `upstream`)](#update-for-those-kept-this-repo-as-upstream)
  - [Uninstall](#uninstall)
  - [Guidelines](#guidelines)
- [Repo Maintenance](#repo-maintenance)
  - [Adding files or directories](#adding-files-or-directories)
- [LICENSE](#license)

## Usage

### Prerequisites

- `git` >= `2.25.0`

### Initialize

#### Before you start

1. Backup your existing `${HOME}` directory (or just move it to somewhere else)
2. Remove existing home directory (`rm -rf ${HOME}`)

__NOTE:__ DO NOT fork this repo for private syncing purpose

#### Option 1: Keep this repo as `upstream`

1. Clone this repo as your home directory
    - `git clone --no-checkout https://github.com/jeffreystoke/dotfiles.git ${HOME}`
1. Go to `${HOME}` and checkout files
    - Set sparse-checkout mode: `git sparse-checkout init`
    - (Optional) Update `.gitkeep` to keep expected directories and files only
    - Ckeckout expected files: `cat .gitkeep | git sparse-checkout set --stdin`
1. Move files back to your `${HOME}` and resolve possible overrides according to `git status`
1. Use private repo for secret config syncing
   - Rename `origin` to `upstream`: `git remote rename origin upstream`
   - Forbid unexpected push to `upstream`: `git config remote.upstream.pushurl 'STOP PUSHING TO PUBLIC UPSTREAM'`
   - Add your private repo as `origin`: `git remote add origin ${MY_PRIVATE_REPO_URL}`

#### Option 2: Use this repo as template

1. Create a new private repo using this repo as template
1. Follow steps listed in [option 1](#option-1-keep-this-repo-as-upstream) (change the repo url to yours) and skip the last step

### Update (for those kept this repo as `upstream`)

1. Go to `${HOME}`
1. Run `git stash` to save all overrides to `${HOME}`
1. Update dotfiles by executing `git pull upstream master --rebase`
1. Run `git stash pop` and resolve all conflicts
1. Commit your changes and push to `origin`

### Uninstall

1. Backup your dotfiles
1. Remove all files from this project by running `git sparse-checkout set ""`
1. Remove `${HOME}/.git`

### Guidelines

- [git](./docs/git.md) config management

## Repo Maintenance

### Adding files or directories

The [root `.gitignore`](./.gitignore) is configured to ignore all files by default for `${HOME}`, so when you want to add files in this repo, you must:

- Add new files and directories
- Update `.gitignore` to exclude new files
- If the new files are expected to present in `${HOME}`, add them to `.gitkeep`

## LICENSE

MIT
