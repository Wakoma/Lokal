# Installation

Lokal is installed using `ansible`. We recommend version `>=2.11`. Ansible is a python package so
alternatively, you can use `pip` to install it. Otherwise (since ansible does not work on windows)
you are free to use our docker container, that contains ansible with all necessary modules.
```bash
docker build -t lokal:latest .
docker run --rm -itv ${PWD}:/lokal lokal:latest
```
This will give you a bash terminal where you can access lokal files and run all commands described below.
__This is just a "client" that you use to actually install Lokal on your server. It is not Lokal installation.__

Next, you need a fresh ubuntu server to run Lokal on. In order to install Lokal, you need to know the IP and root password of your server. Have your SSH key ready as well.

First, create a new file in `Lokal/hosts/`. I use server's nickname or domain, if it is short. 
This file will contain the IP, domain and other details about your server so Lokal can be setup 
correctly. It needs to be in YAML format so you can specify services in this nice way. 
The minimal example is bellow. For complete setup see [configuration section](configuration.md)

```YAML
all:
  hosts: 1.2.3.5 # your server's IP (can be a hostname too)
  vars:
    server_is_live: true # or false if it is just testing machine not visible from the internet
    domain: server.example.com # domain visible from the outside internet (used only when server_is_live=true)
    ansible_user: ubuntu # the application user under which Lokal will run
    services: # define wanted services - list of available services is in roles/ folder
    - lokal
    - wordpress
```

Other options, that can be overriden can be found in `roles/<service>/defaults/main.yml`.
The most important variables are described in [configuration section](configuration.md)
and can be found in `roles/common/defaults/main.yml`

## Prepare a fresh server (optional)

This is an optional step that helps you prepare a fresh machine with only root user on it.
The play `prepare.yml` creates an application user and adds your SSH key in `authorized_keys`
if you define `setup_ssh:true` in your hosts vars. It also secures your server with some basic
firewall rules and installs necessary basic software. You need to create a separate `hosts/` 
file because this play connects as `root`. The content of the hosts file is following
```YAML
all:
  hosts: "1.2.3.4"
  vars:
    app_user: ubuntu # the application user under which lokal will run
    ansible_user: root # mandatory to connect as root user
    setup_ssh: true # set to true only if app_user does not have SSH setup yet (and fill `ssh_key`)
    ssh_key: <content of your .ssh/id_rsa.pub or wherever you have your public key>
```

Now you are ready to run `ansible-playbook -i hosts/<your-host-root> prepare.yml`

## Services

The services are hidden in `roles` folder (ansible required naming). You can find there the `base`
service, `common` service used only as a source of configuration and optional services in other folders.
You define which services to install in your `hosts/` file (per-server). Add/remove any desired services
in `vars:services` list. The `base` service is mandatory - it would not make much sense without it. 

### Installation

Once you have ansible setup on your local machine and remote server ready (preferably using `prepare.yml`)
then you can start using the main `playbook.yml` that by default installs all services defined in 
`hosts` file in `services` variable.
```bash
ansible-playbook -i hosts/<your-host-file> playbook.yml # remote installation
ansible-playbook --ask-become-pass -i hosts/local playbook.yml # local installation
```
or you can specify explicitly services that you want to install/update
```bash
ansible-playbook -i hosts/<your-host-file> -e install=wordpress playbook.yml
```

You can run installation multiple times. It should only check that everything is
setup correctly. If you'd increase version in software in your hosts file or we
would increase the version in the underlying roles than running the installation
again would update the application.

