#!/usr/bin/env bash
set -e
SHELL_DIR=$(dirname "$0")
SHELL_FULL_PATH=$(cd "${SHELL_DIR}" || exit 99; pwd)/$(basename "$0")
echo "[$(date)]"
echo "Entering: ${SHELL_FULL_PATH}"
echo "Work dir: $(pwd)"
EXIT_MSG=""
function exit_action {
  echo -n
}
function exit_shell {
  EXIT_CODE=$?
  if [[ -n ${EXIT_MSG} ]]; then
    END_MSG=", ${EXIT_MSG}"
  fi
  exit_action
  echo "[$(date)]"
  echo "Work dir: $(pwd)"
  echo "Exiting : ${SHELL_FULL_PATH}"
  echo "ExitCode: ${EXIT_CODE}${END_MSG}"
  echo
}
trap exit_shell EXIT
# -------------------------------------------------------------------

# Using set -e
# Starting shell scripts with set -e is considered a best practice
# https://stackoverflow.com/questions/6930295/set-e-and-short-tests

# Overrwrite EXIT_MSG or function exit_shell to customize.

# https://stackoverflow.com/questions/5312266/how-to-trap-exit-code-in-bash-script
# https://stackoverflow.com/questions/11193466/echo-without-newline-in-a-shell-script
