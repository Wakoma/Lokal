# Common

Welcome in the role, that helps you to install, backup and restore services
in Lokal. Each app should have following structure
```
roles/
  - your-app/
    - defaults/
       main.yml // defaults for templates & tasks
    - tasks/
      - main.yml (install/upgrade)
      - restore.yml
      - backup.yml
    - templates/
      - compose.yml.j2
      - anything.else.j2
    - files/
      - static.file1.txt
      - maybe.binary.zip
```

# Volumes

Please use only bind mounts and only inside `{{app_root}}` otherwise the builtin
backup and restore will not work. All app files should be places in `{{project_root}}/<service-name>`. 
Once you call `common.install` in your task then this location will be available to you as `{{app_root}}`.
You can specify `data_dirs` for the `common.install` and those directories will be created inside `{{app_root}}`
and available for being bind-mounted into your docker containers.

# Privileges

Docker-compose has a way of specifying the UID/GID that is used to run the
service inside a container. That's the UID/GID that will create folders in
mounted volumes. By default, its root but that is not always useful. We should
aim for running root-less services. To enable this, make sure to have line
```yaml
services:
  your-service:
    user: "{{uid}}:{{gid}}"
```
in your compose.yml.j2. Those variables `uid` and `gid` are prepared for
you by the `common` role again and are available everywhere.

Sometimes the image allows you to specify `PUID/PGID` env variables. That
means that the container will be privileges-aware and will automatically
drop the root privileges after it has done what it needed to do. In this
case, do not use the `user` as recomended above but pass the `uid/gid` as
env vars. This is true for example for most of linuxserver docker images
```yaml
services:
  your-service:
    # no user: {{uid}}:{{gid}}
    environment:
      PUID: '{{uid}}'
      PGID: '{{gid}}'
```

# Firewall

Only possible firewall with dockerd in production is actually raw `iptables`.
We use `geerlingguy.firewall` role that is a bit of a hack around iptables.
It serializes all firewall rules into a bash script, that is run on startup
by `systemd`. The issue is that it ends with `DROP ALL` therefore you cannot
addjust append new rules once the role has run. You need to INSERT them but
they will not persist after a restart. Unfortunatelly, you need to add your
service's ports into `prepare.yml` playbook to ensure everything works. Or
to set them up (and persist) manually using `iptables` command.
