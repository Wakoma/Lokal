#!/usr/bin/env bash

set -euo pipefail

if (( EUID != 0 )); then
   echo "This script needs to be run as root, e.g: sudo $0" 1>&2
   exit 100
fi

apt update
apt install --yes software-properties-common unzip
apt-add-repository --yes --update ppa:ansible/ansible
apt install --yes ansible

export repo_owner=Wakoma
export repo_name=Lokal
export repo_branch=main

temp_file=$(mktemp --dry-run)
temp_dir=$(mktemp --directory)

wget https://github.com/${repo_owner}/${repo_name}/archive/${repo_branch}.zip -O ${temp_file}
unzip ${temp_file} -d ${temp_dir}
rm ${temp_file}

src=${temp_dir}/${repo_name}-${repo_branch}

ansible-galaxy install -r ${src}/config/ansible/requirements.yml

export PROJECT_ROOT=${src}
export ROOT_SSH_USER=root
export PRIMARY_SSH_USER=ubuntu
${src}/config/ansible/run.sh

rm -rf ${temp_dir}
