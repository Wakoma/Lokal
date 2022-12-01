#!/usr/bin/env bash

# install necessary software
apt update
apt install --yes software-properties-common python3-pip python3-wheel python3-venv

# use pip to install the newest ansible 2.10+
python -m venv $HOME/lokal-client
source $HOME/lokal-client/bin/activate

pip install ansible

# install software plugins
ansible-galaxy install -r requirements.yml

# run the installation
ansible-playbook --ask-become-pass -i hosts/local playbook.yml
