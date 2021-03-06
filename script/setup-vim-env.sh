#!/usr/bin/env bash

set -euo pipefail

eval "$(shelp init -)"

REPO_DIR=$(cd $(dirname $0)/.. && pwd)
DOTS_ROOT=${DOTS_ROOT:-"$(cd $(dirname $0)/.. && pwd)"}
include dot-sh dot.sh
require lib/setup.bashrc

VIM_DIR=${HOME}/.vim
TARGETS=(.vim/ftplugin .vim/ftdetect .vim/template)

# for Plugin Managers
NEOBUNDLE_DIR=${VIM_DIR}/bundle
DEIN_DIR=${VIM_DIR}/dein
NEOBUNDLE=${NEOBUNDLE:-}

# ============================================================
# Functions

install_neobundle() {
  if [[ ! -d $NEOBUNDLE_DIR ]]; then
    local workrepo="${bundle_dir}/neobundle.vim"
    mkdir -p $NEOBUNDLE_DIR
    git clone https://github.com/Shougo/neobundle.vim $workrepo
  fi
}

install_dein() {
  if [[ ! -d $DEIN_DIR ]]; then
    mkdir -p $DEIN_DIR
    (
      cd $DEIN_DIR
      curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
      sh ./installer.sh $DEIN_DIR
    )
  fi
}

# ============================================================
# Main

if [[ -n "${DOTS_ENV:-}" ]]; then
  echo "##### DOTS_ENV: ${DOTS_ENV} #####"
fi

echo "[START] setup vim environment"

link_dots_root

# create ~/.vim
mkdir -p ${VIM_DIR};

# create symlinks
for t in ${TARGETS[@]}; do
  link_home $t
done

# Install Plugin Manager
if [[ -z "${NEOBUNDLE}" ]]; then
  install_dein
else
  install_neobundle
fi

echo "[END] setup vim environment"

exit
