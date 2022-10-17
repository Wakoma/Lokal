

# Volumes

We use volume mounts in `{{project_root}}/<service-name>`. If you use install
from the `common` role then this location will be available to you as {{app_root}}.
Put all your mount points into `data_dirs` list when using the standard `install`
If your service uses those mount points, then you need to start thinking about privileges.

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
in your docker-compose.yml. Those variables `uid` and `gid` are prepared for
you by the `common` role again and are available everywhere.

# Firewall

Only possible firewall with dockerd in production is actually raw `iptables`.
We use `geerlingguy.firewall` role that is a bit of a hack around iptables.
It serializes all firewall rules into a bash script, that is run on startup
by `systemd`. The issue is that it ends with `DROP ALL` therefore you cannot
addjust append new rules once the role has run. You need to INSERT them but
they will not persist after a restart. Unfortunatelly, you need to add your
service's ports into `prepare.yml` playbook to ensure everything works. Or
to set them up (and persist) manually using `iptables` command.
