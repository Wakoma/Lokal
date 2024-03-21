#!/usr/bin/env bash
if [ $USER == "root" ]; then
	echo "Do NOT run this script as root (it will sudo when needed)"
	exit 1
fi

if [ ! -f playbook.yml ]; then
	echo "You must run this script from the Lokal folder"
	exit 1
fi

if which docker-compose; then
	echo "You must uninstall docker-compose (and docker.io) because they are obsolete"
	echo "Newest docker will be installed in next step"
	exit 1
fi

export ORIGINAL_USER=$USER

if ! which docker; then
	if [ ! -z "$UBUNTU_CODENAME" ]; then
		VERSION_CODENAME=$UBUNTU_CODENAME
	fi
	sudo apt update
	sudo apt install --yes ca-certificates curl
	sudo install -m 0755 -d /etc/apt/keyrings
	sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
	sudo chmod a+r /etc/apt/keyrings/docker.asc

	# Add the repository to Apt sources:
	echo \
	"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
	$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
	sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
	sudo apt-get install --yes docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-buildx-plugin
	sudo usermod -aG docker $ORIGINAL_USER
	echo "The script added group 'docker' to your user. This will take effect after re-logging"
	echo "Please logout, login and run this script again to continue"
	exit 0
fi

# first run of tryitout - the .venv does not exist yet
if [ ! -e .venv ]; then
	# install necessary software
	sudo apt update
	sudo apt install --yes software-properties-common python3-pip python3-wheel python3-venv

	# install venv so we can use pip - system package ansible-core causes always issues
	python3 -m venv .venv
	source .venv/bin/activate
	pip install --upgrade ansible-core passlib docker

	# install software plugins
	ansible-galaxy install -r requirements.yml
else
	source .venv/bin/activate
fi

# run the installation
ansible-playbook --ask-become-pass -i hosts/local playbook.yml
