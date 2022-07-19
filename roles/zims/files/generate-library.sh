#!/usr/bin/env bash
set -euf -o pipefail

# This script is designed to be added to cron or preferably incron
# e.g. `incrontab -e`:
# /data/transmission/downloads/complete IN_MOVED_TO /home/ubuntu/v-stack/config/services/kiwix/generate-library.sh
docker exec kiwix -c "kiwix-manage /library/library.xml add $(find ${complete_download_dir} -name '*.zim')"
if [ "$(docker ps -q -f name=kiwix)" ]; then
  dc restart kiwix
fi
