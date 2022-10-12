

# Volumes

We use volume mounts in {{project_root}}/<service-name>/data. If your service
uses more mount points, simply add them either into data/ folder or in your
service root. Usually it is just a config/ dir en plus. If your service uses
those mount points, then you need to start thinking about privileges. 

# Privileges

Docker-compose has a way of specifying the UID/GID that is used to run the
service inside a container. That's the UID/GID that will create folders in
mounted volumes. By default, its root but that is not always useful. We should
aim for running the services as the default app user (usually user `ubuntu`).
To enable this, make sure to have line `user: "{{ansible_facts["user_uid"]}}:{{ansible_facts["user_gid"]}}"` in your docker-compose service definition.

# Firewall

Only possible firewall with dockerd in production is actually raw `iptables`.
We use `geerlingguy.firewall` role that is a bit of a hack around iptables.
It serializes all firewall rules into a bash script, that is run on startup
by `systemd`. The issue is that it ends with `DROP ALL` therefore you cannot
addjust append new rules once the role has run. You need to INSERT them but
they will not persist after a restart. Unfortunatelly, you need to add your
service's ports into `prepare.yml` playbook to ensure everything works. Or
to set them up (and persist) manually using `iptables` command.
