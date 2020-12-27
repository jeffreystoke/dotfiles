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
  - [global.gitignore] - Global .gitignore

## Concepts

- A `user` is a summary of its name, email, signing key and ssh identity
  - see [.gitconfigs/users/joe.doyle.gitconfig](./../.gitconfigs/users/joe.doyle.gitconfig) for example
- A `workspace` is just a gitconfig for one or more groups of repos with following requirements:
  - A repo group can only be defined using `includeIf`
  - Each repo group should reference a `user` from [users](../.gitconfigs/users)
  - Each repo group can set group specific config by add more `path = /path/to/some.gitconfig` lines to its `includeIf` section
