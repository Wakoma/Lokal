#!/usr/bin/env bash
set -euf -o pipefail

library_file="${PWD}/data/library.xml"
library_dir="$(dirname ${library_file})"
library="$(basename ${library_file})"
mkdir -p "${library_dir}"

cp -n "${PWD}/.zims.tpl" "${PWD}/.zims"
readarray -t zimurls < .zims

if [ ! -f "${library_file}" ]; then
    echo "[INFO]: ${library} does not exist. Proceeding to generate it ..."
    for download in "${zimurls[@]}"; do
        zim="$(basename ${download})"
        echo "[INFO]: Inspecting ${zim}"
        zimfile="${library_dir}/${zim}"
        if [ ! -f "${zimfile}" ]; then
            echo "[INFO]: Downloading ${zim}"
            wget -q --show-progress --no-clobber "${download}" -O "${zimfile}"
        fi
        echo "[INFO]: Adding ${zim} to ${library}"
        docker run --user "$(id -u):$(id -g)" --rm -i -v "${PWD}:${PWD}" --name kiwix-quickstart --entrypoint bash kiwix/library -c "kiwix-manage ${library_file} add ${zimfile}"
    done
    echo "[INFO]: ${library} generated"
else
    echo "[INFO]: ${library} already exists. Ready to launch!"
fi
