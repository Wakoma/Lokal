# Operations

Operations describe management during the full lifetime of Lokal. In general, you
will want to perform
- upgrade
- backup
- restore
- uninstall

All of those commands are supported by `playbook.yml` and their support should be
included in every role (service).

## Upgrade

Roles should be written in such ways that the installation should behave as an upgrade
if it is run on already installed service. Usually, there are no extra steps required
than simply downloading a new docker image and restarting the service. Surely, you
want to upgrade services one-by-one, therefore we included `install` variable to
let you do exactly that. Following command will install/upgrade only the specified
services/roles.

```bash
ansible-playbook -i hosts/<your-host-file> -e install=wordpress,matmoto playbook.yml
```

## Backup

You can either backup concrete services by specifying `-e backup=service1,service2`.
```bash
ansible-playbook -i hosts/<your-host-file> -e backup=wordpress,matmoto playbook.yml
```

## Restore

Of course you can restore backed up services using `-e restore=service1,service2`.
```bash
ansible-playbook -i hosts/<your-host-file> -e restore=wordpress playbook.yml
```

## Uninstall

For uninstallation we provide `-e remove=service1,service2` variable.
```bash
ansible-playbook -i hosts/<your-host-file> -e remove=wordpress playbook.yml
```