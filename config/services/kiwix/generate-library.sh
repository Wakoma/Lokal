#!/usr/bin/env bash
set -euf -o pipefail

library_file="${KIWIX_DATA_DIR}/library.xml"
library_file_tmp=$(mktemp)
zims_dir="${KIWIX_DATA_DIR}/zims"

docker run --user "$(id -u):$(id -g)" --rm -i -v "${KIWIX_DATA_DIR}:${KIWIX_DATA_DIR}" --name kiwix-quickstart --entrypoint bash kiwix/library -c "kiwix-manage ${library_file_tmp} add $(ls ${zims_dir} | xargs)"
mv ${library_file} ${library_file}.$(date '+%Y-%m-%d_%H-%M-%S').bak
mv ${library_file_tmp} ${library_file}
