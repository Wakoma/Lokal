# Lokal

Service in lokal - the generic idea is that you have install.yml that is inluding lokal/install.yml
tasks configured with [#Variables](variables). The lokal/install task will give you variables containing
freshly generated databases, buckets and other resources. Those variables will be available in your custom
compose.yml that will be automatically rendered by the lokal/install task. Other templates placed alongside
compose.yml and specified in `app_templates` will be rendered as well.

Each role should have following structure to allow installation, backup, and restore:
```
roles/
  - your-app/
    - defaults/
       main.yml // default values for the service
    - tasks/
      - main.yml - contains init steps (defining variables mainly)
      - install.yml
      - restore.yml
      - backup.yml
    - templates/
      - compose.yml
      - anything.else
    - files/
      - static.file1.txt
      - a.binary.zip
```

If you follow this structure and recomendations given bellow, you will be able
to use the logic provided by the lokal role. It helps with the usual tasks as
creating folders, database and obtaining the most used information such as `uid`
and `gid`.

## Global variables

- `mysql_host`, `mysql_port` - shared MySQL instance
- `postgres_host`, `postgres_port` - shared postgres instance

## Variables

A list of available variables that you can define in role's `tasks/install.yml` when
including `lokal.install` tasks. Please see the example `roles/_example/tasks/install.yml`

- `app` name of your app -
- `app_dirs` (optional) list of directories that will be created inside `app_root`
- `app_templates` (optional) files expected in `template/` that will be rendered to
  Example: `app_templates: database.yml: config/database.yml` will render template/config.conf from local folder to remote `{{app_root}}/config/database.yml` so you can use it in docker-compose.yml simply as `"config/database.yml"`
- `app_git` (optional) git URL where to download the app from - expects `build: {context: "{{app}}", dockerfile: {{app}}/Dockerfile}` in your compose.yml so the docker is built directly on the server
- `app_version` (optional) version of your app - if an update happen that `app_updated` will be true
- `app_db` set to "mysql" or "postgres" to receive `app_db_user`, `app_db_password`, and `app_db_name` to your compose.yml and rest of install.yml
- `app_bucket` set to "minio" to receive `app_bucket_name`, `app_bucket_user`, `app_bucket_password` to your compose.yml and rest of install.yml
- `start` (optional, boolean) - whether directly invoke `docker compose up -d` at the end

The lokal install tasks will finish with rendering  `templates/compose.yml` into
`{{app_root}}/docker-compose.yml` and optionally starting it using docker compose (unless
you specify `start:false`)

By default, the app_root is `{{project_root}}/{{app_domain}}` where `project_root` is
by default at `/opt/lokal`. This folder (together with `/opt/lokal-backup`) are
created automatically on the first run by the lokal role.

## Database

If you specified `mysql_db`, `mysql_user`, and `mysql_password` then your database
will be available at `mysql_host` and `mysql_port` with the credentials provided.
Don't forget to add `mysql` external network to your docker-compose if you want to
connect to it.
The same applies for `postgres` - simply replace all `mysql` with `postgres` in the
variables above. The same applies for the network as well.

### templates/compose.yml

Lokal services must be completely written as docker-compose files. The `base`
gives you a database and a traefik instance for routing the requests. Please
see the [compose.yml](examples/compose.yml) in examples directory.

### Cloning a GIT repository

Sometimes, you don't have a docker container built in a docker hub. You can specify
`app_git` with git clone URL (e.g.: https://github.com/username/repo.git) and specify `app_version`
to the tag/branch that you want cloned (e.g.: v1.2.3). Only when you change
this value, the repo will be fetched and updated! So restrain from using branch names.
Once install is finihed, you will find your app cloned under `{{app_root}}/git` so
you can then reference it in your `compose.yml` as

```
services:
  your-app:
    build:
      context: "git/"
      dockerfile: "git/Dockerfile"
    volumes:
      ...
```

because the compose.yml is run in {{app_root}} so your code will be accessible in "git/" folder.


### Networks

At the end of your compose.yml, you must specify networks, that you are using
```yaml
networks:
  traefik:
    external: true
  mysql:
    external: true
  prometheus:
    external: true
```

#### Traefik

To avoid scratching your head, Lokal provides a template file for labels that you just
include into your compose.yml and if you have defined `app_port` and `app_domain` then
you are good to go

```yaml
services:
  your-service:
    image: service:{{app_version}}
{% include "labels.yml" %}
```

Or you can do it the hard way by defining traefik's labels. Traefik is used to route outside
traffic into your container. It handles certificate generation for your custom (sub)domains.
If you are using ACME for certificates, then it is necessary to add following IF block in
the container's labels.

```yaml
    networks:
    - traefik # necessary for extenal access to your app (via a domain name)
    - mysql # necessary if you want to use the external mysql database
    - prometheus # to get monitoring
    labels:
      traefik.enable: "true"
      # traefik will only listen on HTTPS
      traefik.http.routers.yourapp.entrypoints: websecure
      # here you construct your final domain
      traefik.http.routers.yourapp.rule: Host(`{{subdomain_yourapp}}.{{domain}}`)
      traefik.http.routers.yourapp.tls: "true"
      # where the container listens (no need to export this port)
      traefik.http.services.yourapp.loadbalancer.server.port: 80
{% if ssl_use_acme %}
      traefik.http.routers.yourapp.tls.certresolver: {{cert_resolver}}
{% endif %}
```

### Volumes

Please use only bind mounts and only inside `{{app_root}}` otherwise the builtin
backup and restore will not work. All app files should be places in `{{project_root}}/<service-name>`.
Once you call `lokal.install` in your task then this location will be available to you as `{{app_root}}`.
You can specify `data_dirs` for the `lokal.install` and those directories will be created inside `{{app_root}}`
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
you by the `lokal` role again and are available everywhere.

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

There are few external networks that you want to include if you need access to the services
- `traefik` - to be able to use traefik labels for routing external traffic
- `prometheus` - so your service exports monitoring data to prometheus
- `mysql` - gives you access to a MariaDB
- `postgres` - gives you access to a PostgreSQL instance

You can export ports but pay attention that you need to allow them in firewall
so they can receive to connection from the outside. You don't need to export
ports that will be accessed only within docker networks. Therefore you don't
need to export the HTTP port that traefik will bind to using the label
```yaml
traefik.http.services.your-service.loadbalancer.server.port: your-http-port
```

# Backup and Restore

Those tasks are rather simple - they compress/restore whole `{{app_root}}`
together with the database, if it was specified. The storage for those data
is at `/opt/lokal-backup` and follows the structure of `/opt/lokal`.