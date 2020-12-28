#!/bin/sh

set -ex

SETUP_METHOD="${SETUP_METHOD:-"git-init"}"

DOTFILES_UPSTREAM="${REPO:-"https://github.com/jeffreystoke/dotfiles.git"}"
DOTFILES_PATH="${DOTFILES_PATH:-"${HOME}"}"
DOTFILES_UPSTREAM_BRANCH="${DOTFILES_UPSTREAM_BRANCH:-"master"}"

setup_upstream() {
  case "${SETUP_METHOD}" in
  "git-init")
    mkdir -p "${DOTFILES_PATH}"
    cd "${DOTFILES_PATH}"

    git init

    git remote add upstream "${DOTFILES_UPSTREAM}"
    git fetch upstream
    git config remote.upstream.pushurl 'STOP PUSHING TO PUBLIC UPSTREAM'

    local_def_branch="$(git symbolic-ref HEAD)"
    local_def_branch="${local_def_branch#"refs/heads/"}"

    git branch -f "${local_def_branch}" "upstream/${DOTFILES_UPSTREAM_BRANCH}"

    git sparse-checkout init
    git sparse-checkout set /.gitkeep
    git checkout
    cd -
    ;;
  "git-clone")
    git clone --no-checkout --branch "${DOTFILES_UPSTREAM_BRANCH}" \
      --origin upstream "${DOTFILES_UPSTREAM}" "${DOTFILES_PATH}"
    git config remote.upstream.pushurl 'STOP PUSHING TO PUBLIC UPSTREAM'

    cd "${DOTFILES_PATH}"
    git sparse-checkout init
    git sparse-checkout set /.gitkeep
    git checkout
    cd -
    ;;
  *)
    echo "unsupported setup method ${SETUP_METHOD}"
    exit 1
    ;;
  esac
}

checkout_dotfiles() {
  cd "${DOTFILES_PATH}"
  git sparse-checkout set --stdin <.gitkeep
  git submodule update --init --recursive
  cd -
}

case "$1" in
setup-upstream)
  setup_upstream
  ;;
checkout-dotfiles)
  checkout_dotfiles
  ;;
"")
  setup_upstream
  checkout_dotfiles
  ;;
esac
