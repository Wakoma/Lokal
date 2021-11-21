#!/usr/bin/env bash

set -euo pipefail

export ANSIBLE_HOST_KEY_CHECKING=False
export ANSIBLE_FORCE_COLOR=true
export ANSIBLE_VERBOSITY=0

export repo_owner=Wakoma
export repo_name=Lokal
export repo_branch=custom_install_dnwt

ROOT_SSH_USER=root
PRIMARY_SSH_USER=ubuntu

# Uncomment on first run, comment once run
#ansible-playbook -e "ansible_user=${ROOT_SSH_USER}" -e "setup_ssh=true" \
#  -e root_ssh_user=${ROOT_SSH_USER} \
#  -e primary_ssh_user=${PRIMARY_SSH_USER} \
#  -i config/ansible/hosts.yml \
#  config/ansible/preprovision.playbook.yml

su ${PRIMARY_SSH_USER} -c "ansible-galaxy role install -r config/ansible/requirements.yml"

. .envrc.quickstart

su ${PRIMARY_SSH_USER} -c "\
  ansible-playbook \
    -e primary_ssh_user=${PRIMARY_SSH_USER} \
    -i config/ansible/hosts.yml \
    config/ansible/base.playbook.yml

read -rsp $'Setup server .envrc files and lokal.network ssl certs in /tmp folder, then press any key to continue...\n' -n1 key

ansible-playbook \
    -e primary_ssh_user=${PRIMARY_SSH_USER} \
    -e repo_owner=${repo_owner} \
    -e repo_name=${repo_name} \
    -e repo_branch=${repo_branch} \
    -i config/ansible/hosts.yml \
    config/ansible/deploy-services.playbook.yml

ansible-playbook \
    -e primary_ssh_user=${PRIMARY_SSH_USER} \
    -e repo_name=${repo_name} \
    -i config/ansible/hosts.yml \
    config/ansible/deploy-jitsi.playbook.yml
