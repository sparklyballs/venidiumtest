#!/usr/bin/env bash

# shellcheck disable=SC2154
venidium start "${service}"

trap "echo Shutting down ...; venidium stop all -d; exit 0" SIGINT SIGTERM

# shellcheck disable=SC2154
if [[ ${log_to_file} == 'true' ]]; then
  # Ensures the log file actually exists, so we can tail successfully
  touch "$VENIDIUM_ROOT/log/debug.log"
  tail -F "$VENIDIUM_ROOT/log/debug.log" &
fi

while true; do sleep 1; done
