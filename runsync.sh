#!/bin/bash
echo "Updating settings.ini"
(python settingsupdater.py)

if [ "${INTERVAL}" -gt "0" ]; then
  while true
  do
    (python PlexAniSync.py)
    sleep ${INTERVAL}
  done
else
  (python PlexAniSync.py)
fi
