#!/usr/bin/env bash
set -euf -o pipefail

# This script is designed to be added to cron or preferably incron
# e.g. `incrontab -e`:
# /data/transmission/downloads/complete IN_MOVED_TO /home/ubuntu/v-stack/config/services/kiwix/generate-library.sh

cd "$(dirname "$0")"
eval "$(direnv export bash)"

library_file="${KIWIX_DATA_DIR}/library.xml"
complete_download_dir="${TRANSMISSION_DOWNLOADS_DIR}/complete"
mkdir -p ${complete_download_dir}
zims="$(find ${complete_download_dir} -name '*.zim' | xargs)"

if test -z "$zims" 
then
  cp library.xml.tpl "${library_file}"
else
  docker run --rm \
    --user "$(id -u):$(id -g)" \
    -v "${TRANSMISSION_DOWNLOADS_DIR}:${TRANSMISSION_DOWNLOADS_DIR}" \
    -v "${KIWIX_DATA_DIR}:${KIWIX_DATA_DIR}" \
    --entrypoint ash \
    kiwix/kiwix-serve \
    -c "kiwix-manage ${library_file} add ${zims}"

  echo "The following files were added to ${library_file}:"
  echo "${zims}"
  echo "Restarting Kiwix"
fi

dc restart kiwix
