# shellcheck disable=SC2148

# DO NOT EDIT

# Set oh-my-zsh installation path
export ZSH="${HOME}/.config/zsh/oh-my-zsh"

# Set user provided preferences (e.g. theme, plugins)
if [ -f "${HOME}/.config/zsh/preference.sh" ]; then
  source "${HOME}/.config/zsh/preference.sh"
fi

# Ensure there is a theme set by default
ZSH_THEME="${ZSH_THEME:-"robbyrussell"}"

# Setup oh-my-zsh
source "${ZSH}/oh-my-zsh.sh"

for config in "${HOME}/.config/zsh/configs/"*.sh; do
  source "${config}"
done
