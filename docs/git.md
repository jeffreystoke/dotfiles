# `git`

Git config management

## Files

- [.gitconfig](../.gitconfig) - The config entrypoint for `git`
- [.gitconfigs](../.gitconfigs) - All git configs
  - [presets](../.gitconfigs/presets) - Helper gitconfig with predefined settings
    - [behavior](../.gitconfigs/presets/behavior) - Enable/Disable certain git behvior
    - [tools](../.gitconfigs/presets/tools) - Configure tools for git
    - [urls](../.gitconfigs/presets/urls) - Set remote url rewrite
  - [users](../.gitconfigs/users) - Git users
  - [workspaces](../.gitconfigs/workspaces) - Workspace specific settings
  - [global.gitignore](../.gitconfigs/global.gitignore) - Global .gitignore for all repos

## Concepts

- A `user` is a summary of its name, email, signing key and ssh identity
  - see [.gitconfigs/users/joe.doyle.gitconfig](./../.gitconfigs/users/joe.doyle.gitconfig) for example
- A `workspace` is just a gitconfig for one or more groups of repos with following requirements:
  - A repo group can only be defined using `includeIf`
  - Each repo group MUST reference a `user` from [users](../.gitconfigs/users)
  - Each repo group can set group specific config by add more `path = /path/to/some.gitconfig` lines to its `includeIf` section

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
