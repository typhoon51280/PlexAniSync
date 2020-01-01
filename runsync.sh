#!/bin/bash
echo "Updating settings.ini"
(python settingsupdater.py)

update() {
  local show_name = "${1}"
  if [[ -n "${show_name}" ]]; then
    (python TautulliSyncHelper.py "${show_name}")
  else
    echo "Usage: $0 update \"{show_name}\""
  fi
}

sync() {
  local loop_interval = "${1}"
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

case "$1" in
  update)
    update "${@:2}"
    ;;
  sync)
    sync "${@:2}"
    ;;
  *)
    echo "Usage: $0 {update|sync}"
    ;;
esac
