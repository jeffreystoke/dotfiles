# `git`

git config management for multiple workspaces

## Files

- [.gitconfig](../.gitconfig) - The config entrypoint for `git`
- [.config/git](../.config/git) - All git related configs
  - `workspaces.gitconfig` - User defined workspaces
  - [presets](../.config/git/presets) - Helper gitconfig with predefined settings
    - [behavior](../.config/git/presets/behavior) - Enable/Disable certain git behvior
    - [tools](../.config/git/presets/tools) - Configure tools for git
    - [urls](../.config/git/presets/urls) - Set remote url rewrite
  - [users](../.config/git/users) - Git users
  - [workspaces](../.config/git/workspaces) - Workspace specific settings
  - [global.gitignore](../.config/git/global.gitignore) - Global .gitignore for all repos

## Concepts

- A `user` is a summary of its name, email, signing key and ssh identity
  - see [.config/git/users/joe.doyle.gitconfig](../.config/git/users/joe.doyle.gitconfig) for example
- A `workspace` is just a gitconfig for one or more groups of repos with following requirements:
  - A repo group can only be defined using `includeIf`
  - Each repo group MUST reference a `user` from [users](../.config/git/users)
  - Each repo group can set group specific config by add more `path = /path/to/some.gitconfig` lines to its `includeIf` section

## Usage

- Create workspaces in `~/.config/git/workspaces`, see [.config/git/workspaces/sample.gitconfig](../.config/git/workspaces/sample.gitconfig) for example
- Create `~/.config/git/workspaces.gitconfig` to include workspace definitions in `~/.config/git/workspaces/*.gitconfig`

  ```ini
  [include]
    path = ~/.config/git/workspaces/sample.gitconfig
  ```

## Repo placement

As you may have realized, using `includeIf` in gitconfig can have extra requirements for the placement of your repos:

- Repos with same `user` and behavior are grouped together and should share one parent directory so we can define one `includeIf` for them all
- Repos with different `user` MUST not be grouped together

Let's assume you have a directory `~/repos` for all your repos, with the requirements above, you should place your repos to `~/repos/<GROUP_NAME>/<REPO_NAME>`, and the file structure should look like this:

```txt
~/repos
|-- alice-group
|   `-- bob-repo
`-- foo-group
    |-- bar-repo
    `-- foobar-repo
```
