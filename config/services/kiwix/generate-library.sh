#!/usr/bin/env bash
set -euf -o pipefail

library_file="${KIWIX_DATA_DIR}/library.xml"
zims_dir="${KIWIX_DATA_DIR}/zims"
docker run --workdir "${zims_dir}" --rm -iv "${KIWIX_DATA_DIR}:${KIWIX_DATA_DIR}" --entrypoint bash kiwix/library -c "kiwix-manage ${library_file} add $(ls ${zims_dir} | xargs)"
