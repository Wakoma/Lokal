#!/usr/bin/bash

for file in $(ls roles/docs/docs/docs/services/); do
    if [[ -e ../services/roles/$file ]]; then
        rm -rf roles/docs/docs/docs/services/$file
    fi
done