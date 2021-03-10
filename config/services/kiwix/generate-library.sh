#!/usr/bin/env bash
set -euf -o pipefail

library_file="${KIWIX_DATA_DIR}/library.xml"
zims_dir="${KIWIX_DATA_DIR}/zims"
zims=(${zims_dir}/*.zim)

docker run --rm --user "$(id -u):$(id -g)" "${KIWIX_DATA_DIR}:${KIWIX_DATA_DIR}" --entrypoint bash kiwix/library -c "kiwix-manage ${library_file} add ${zims[*]}"
