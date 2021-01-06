# Rime

[rime](https://github.com/rime/librime) config management from multiple platforms

__NOTE:__ Currently we only support following rime frontends: `ibus-rime`, `Squirrel` and `Weasel`

## Files

- [.config/rime](./../.config/rime/) - Config home of rime
  - [dicts](./../.config/rime/dicts) - Dictonary data and their presets
  - [opencc](./../.config/rime/opencc) - OpenCC configuration files
  - [presets](./../.config/rime/presets) - Reusable presets
  - [themes](./../.config/rime/themes) - Predefined color schemes
  - [default.custom.yaml](./../.config/rime/default.custom.yaml) - Core rime customization config
  - [squirrel.custom.yaml](./../.config/rime/squirrel.custom.yaml) - Squirrel customization config
  - [weasel.custom.yaml](./../.config/rime/weasel.custom.yaml) - Weasel customization config
  - other `*.custom.yaml` Customization for different input method settings

## Usage

1. Install `rime` with frontend according to [the official guide](https://github.com/rime/librime#install)
1. Remove default user data dir and create a symlink to `${DOTFILES_HOME}/.config/rime`
   - For Squirrel: `rm -rf ${HOME}/Library/Rime && ln -s ${DOTFILES_HOME}/.config/rime ${HOME}/Library/Rime`
   - For iBus-Rime:`rm -rf ${HOME}/.config/ibus/rime && ln -s ${DOTFILES_HOME}/.config/rime ${HOME}/.config/ibus/rime`
   - For Weasel: `rm -rf %APPDATA%\Rime && mklink /D %DOTFILES_HOME%\.config\rime %APPDATA%\Rime`
1. Customize your rime setup in `*.custom.yaml` by add preset entries to `__patch:` and direct overrides to `patch`

## Debug

Log files:

- Squirrel
  - `${TMPDIR}/rime.squirrel.INFO`
  - `${TMPDIR}/rime.squirrel.WARNING`
  - `${TMPDIR}/rime.squirrel.ERROR`
- Weasel
  - `%TEMP%\rime.weasel.INFO`
  - `%TEMP%\rime.weasel.WARNING`
  - `%TEMP%\rime.weasel.ERROR`
- iBus-Rime
  - `/tmp/rime.ibus.INFO`
  - `/tmp/rime.ibus.WARNING`
  - `/tmp/rime.ibus.ERROR`
