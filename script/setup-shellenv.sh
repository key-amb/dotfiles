#!/usr/bin/env bash

set -euo pipefail

REPO_DIR=$(cd $(dirname $0)/.. && pwd)
source "${REPO_DIR}/lib/dotenv.shrc"
require lib/setup.bashrc
require lib/shellenv.bashrc

help() {
  pod2text $0
  exit 1
}

if [[ -z "$MYENV" ]]; then
  echo -e "[error] \$MYENV is not set!\n"
  help
fi

echo "[START] setup $MYENV"

bootstrap
setup_shellenv

echo "[END] setup $MYENV"

exit

: <<'__EOF__'

=encoding utf8

=head1 NAME

B<setup-shellenv.sh> - Script to set up a shell environment

=head1 SYNOPSYS

    MYENV=<target env> script/setup-shellenv.sh

=head1 DESCRIPTION

This script set up a shell environment for current user.

=head1 SEE ALSO

L<lib/shellenv.sh>

=head1 AUTHORS

IKEDA Kiyoshi E<lt>progrhyme@gmail.comE<gt>

=cut

__EOF__