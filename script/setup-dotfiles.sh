#!/usr/bin/env bash

set -eu

REPO_DIR=$(cd $(dirname $0)/.. && pwd)
DOTSH_DIR="${DOTSH_DIR:-${REPO_DIR}/submodule/dot-sh}"
source "${DOTSH_DIR}/dot.sh"
require lib/setup.bashrc
require lib/dotfiles.bashrc

if [[ -n "${DOTS_ENV:-}" ]]; then
  echo "##### DOTS_ENV: ${DOTS_ENV} #####"
fi

echo "[START] setup dotfiles"

bootstrap
setup_dotfiles

echo "[END] setup dotfiles"

exit

: <<'__EOF__'

=encoding utf8

=head1 NAME

B<setup-dotfiles.sh> - Script to set up dotfiles

=head1 SYNOPSYS

    DOTS_ENV=<target env> script/setup-dotfiles.sh

=head1 DESCRIPTION

Blah blah blah.

=head1 SEE ALSO

L<lib/dotfiles.sh>

=head1 AUTHORS

IKEDA Kiyoshi E<lt>progrhyme@gmail.comE<gt>

=cut

__EOF__
