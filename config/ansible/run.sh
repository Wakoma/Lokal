#!/usr/bin/env bash

set -euo pipefail

export ANSIBLE_HOST_KEY_CHECKING=False
export ANSIBLE_FORCE_COLOR=true
export ANSIBLE_VERBOSITY=0


# ansible-playbook --user ${PRIMARY_SSH_USER} -e root_ssh_user=${ROOT_SSH_USER} -e primary_ssh_user=${PRIMARY_SSH_USER} -i ${PROJECT_ROOT}/config/ansible/hosts.yml ${PROJECT_ROOT}/config/ansible/preprovision.playbook.yml
ansible-playbook --user ${PRIMARY_SSH_USER} -e primary_ssh_user=${PRIMARY_SSH_USER} -i ${PROJECT_ROOT}/config/ansible/hosts.yml ${PROJECT_ROOT}/config/ansible/base.playbook.yml
