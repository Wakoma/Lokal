#!/usr/bin/env bash
set -euf -o pipefail

library_file="${KIWIX_DATA_DIR}/library.xml"
complete_download_dir="${TRANSMISSION_DOWNLOADS_DIR}/complete"
zims="$(find ${complete_download_dir} -name '*.zim' | xargs)"

docker run --rm -it \
  --user "$(id -u):$(id -g)" \
  -v "${TRANSMISSION_DOWNLOADS_DIR}:${TRANSMISSION_DOWNLOADS_DIR}" \
  -v "${KIWIX_DATA_DIR}:${KIWIX_DATA_DIR}" \
  --entrypoint bash \
  kiwix/library \
  -c "kiwix-manage ${library_file} add ${zims}"
