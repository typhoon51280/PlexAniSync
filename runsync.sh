#!/bin/bash

create_settings() {
  echo "Generating settings.ini"
  (python settingsupdater.py)
}

update() {
  local show_name="${1}"
  if [[ -n "${show_name}" ]]; then
    (python TautulliSyncHelper.py "${show_name}")
  else
    echo "Usage: $0 update \"{show_name}\""
  fi
}

sync() {
  local loop_interval="${1}"
  if [[ "${loop_interval}" -gt "0" ]]; then
    while true
    do
      (python PlexAniSync.py)
      sleep ${loop_interval}
    done
  else
    (python PlexAniSync.py)
  fi
}

echo "parameters: ${@}"
echo "operation: ${1}"

case "${1}" in
  update)
    create_settings
    update "${@:2}"
    ;;
  sync)
    create_settings
    sync "${@:2}"
    ;;
  *)
    echo "Usage: $0 {update|sync}"
    ;;
esac
