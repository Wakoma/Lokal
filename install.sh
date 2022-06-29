#!/usr/bin/env bash

set -euo pipefail

if (( EUID != 0 )); then
   echo "This script needs to be run as root, e.g: sudo $0" 1>&2
   exit 100
fi

# install necessary software
apt update
apt install --yes software-properties-common ansible direnv

# install software plugins
ansible-galaxy install -r requirements.yml


# run the installation
export ROOT_SSH_USER=root
export PRIMARY_SSH_USER=ubuntu
ansible-playbook -c local -i "127.0.0.1," -l "127.0.0.1" lokal.yml
