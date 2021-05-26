#!/usr/bin/env bash

set -euo pipefail

export ANSIBLE_HOST_KEY_CHECKING=False
export ANSIBLE_FORCE_COLOR=true
export ANSIBLE_VERBOSITY=0

ansible-playbook \
  -e root_ssh_user=${ROOT_SSH_USER} \
  -e primary_ssh_user=${PRIMARY_SSH_USER} \
  -i ${PROJECT_ROOT}/config/ansible/hosts.yml \
  ${PROJECT_ROOT}/config/ansible/preprovision.playbook.yml

su ${PRIMARY_SSH_USER} -c "\
  ansible-playbook \
    -e primary_ssh_user=${PRIMARY_SSH_USER} \
    -i ${PROJECT_ROOT}/config/ansible/hosts.yml \
    ${PROJECT_ROOT}/config/ansible/base.playbook.yml"

su ${PRIMARY_SSH_USER} -c "\
  ansible-playbook \
    -e primary_ssh_user=${PRIMARY_SSH_USER} \
    -e repo_owner=${repo_owner} \
    -e repo_name=${repo_name} \
    -e repo_branch=${repo_branch} \
    -i ${PROJECT_ROOT}/config/ansible/hosts.yml \
    ${PROJECT_ROOT}/config/ansible/deploy-services.playbook.yml"

su ${PRIMARY_SSH_USER} -c "\
  ansible-playbook \
    -e primary_ssh_user=${PRIMARY_SSH_USER} \
    -i ${PROJECT_ROOT}/config/ansible/hosts.yml \
    ${PROJECT_ROOT}/config/ansible/deploy-jitsi.playbook.yml"
