# dotfiles

Manage home directory with `git` directly

- [Usage](#usage)
  - [Prerequisites](#prerequisites)
  - [Initialize](#initialize)
  - [Update (for those kept this repo as `upstream`)](#update-for-those-kept-this-repo-as-upstream)
  - [Uninstall](#uninstall)
  - [Guideline](#guideline)
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
    - Set sparse-checkout mode: `git sparse-checkout init`
    - (Optional) Update `.gitkeep` to keep expected directories and files only
    - Ckeckout expected files: `cat .gitkeep | git sparse-checkout set --stdin`
2. Move files back to your `${HOME}` and resolve possible overrides according to `git status`
3. Use private repo for secret config syncing
   - Rename `origin` to `upstream`: `git remote rename origin upstream`
   - Forbid unexpected push to `upstream`: `git config remote.upstream.pushurl 'STOP PUSHING TO PUBLIC UPSTREAM'`
   - Add private repo as `origin`: `git remote add origin ${MY_PRIVATE_REPO_URL}`
   - Update `.gitignore` files to include your private files

#### Option 2: Use this repo as template

1. Create a new private repo using this repo as template
2. Follow steps listed in [option 1](#option-1-keep-this-repo-as-upstream) and skip last step

### Update (for those kept this repo as `upstream`)

1. Run `git stash` to save all overrides to `${HOME}`
2. Update dotfiles by executing `git pull --rebase`
3. Run `git stash pop` and resolve all conflicts

### Uninstall

1. Remove all files from this project by running `git sparse-checkout set ""`
1. Remove `${HOME}/.git`

### Guideline

- [git](./docs/git.md) config management

## Repo Maintenance

### Adding files or directories

The [root `.gitignore`](./.gitignore) is configured to ignore all files by default for `${HOME}`, so when you want to add files in this repo, you must:

- Add new files and directories
- Update `.gitignore` to exclude new files
- If the new files are expected to present in `${HOME}`, add them to `.gitkeep`

## LICENSE

MIT
