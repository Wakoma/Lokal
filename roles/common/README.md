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
      - a.binary.zip
```

If you follow this structure and recomendations given bellow, you will be able
to use the logic provided by the common role. It helps with the usual tasks as
creating folders, database and obtaining the most used information such as `uid`
and `gid`.

# Install

The `common.install` performs following steps
- creates and registers `{{app_root}}` so you can use it later;
- creates all `data_dirs` that you have specified inside `app_root`
- if you set `app_version`
  - saves the version specified in `app_version` into `{{app_root}}/version`
  - specifies app_upgrade if the version changed from the last time
- creates mysql database from `mysql_db`, `mysql_user`, and `mysql_password` variables for you
- renders `templates/compose.yml.j2` as `{{app_root}}/docker-compose.yml`
- starts the docker-compose (unless you specify `start:false`)

By default, the app_root is `{{project_root}}/{{app}}` where `project_root` is
by default at `/opt/lokal`. This folder (together with `/opt/lokal-backup`) are
created automatically on the first run by the common role.

## Database

If you specified `mysql_db`, `mysql_user`, and `mysql_password` then your database
will be available at `mysql_host` and `mysql_port` with the credentials provided.
Don't forget to add `mysql` external network to your docker-compose if you want to
connect to it.

## templates/compose.yml.j2

Lokal services must be completely written as docker-compose files. The `base` 
gives you a database and a traefik instance for routing the requests. Please
see the [compose.yml.j2](examples/compose.yml.j2) in examples directory.

### Volumes

Please use only bind mounts and only inside `{{app_root}}` otherwise the builtin
backup and restore will not work. All app files should be places in `{{project_root}}/<service-name>`. 
Once you call `common.install` in your task then this location will be available to you as `{{app_root}}`.
You can specify `data_dirs` for the `common.install` and those directories will be created inside `{{app_root}}`
and available for being bind-mounted into your docker containers.

### Privileges

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
      PUID: "{{uid}}"
      PGID: "{{gid}}"
```

### Network and Firewall
There are few external networks
- `traefik` - to be able to use traefik labels for routing external traffic
- `prometheus` - so your service exports monitoring data to prometheus
- `mysql` - needed to have access to external MariaDB instance

You can export ports but pay attention that you need to allow them in firewall
so they can receive to connection from the outside. You don't need to export
ports that will be accessed only within docker networks. Therefore you don't 
need to export the HTTP port that traefik will bind to using the label
```yaml
traefik.http.services.your-service.loadbalancer.server.port: your-http-port
```

Only possible firewall with dockerd in production is actually raw `iptables`.
We use `geerlingguy.firewall` role that is a bit of a hack around iptables.
It serializes all firewall rules into a script in `/etc/firewall.bash`, that 
is run on startup by `systemd`. The issue is that it ends with `DROP ALL` 
therefore you cannot just append new rules once the role has run. You need 
to INSERT them but they will not persist after a restart. Unfortunatelly, 
you need to add your service's ports into `prepare.yml` playbook to ensure 
everything works. Or to set them up (and persist) using `iptables` command.


# Backup and Restore

Those tasks are rather simple - they compress/restore whole `{{app_root}}`
together with the database, if it was specified. The storage for those data
is at `/opt/lokal-backup` and follows the structure of `/opt/lokal`.