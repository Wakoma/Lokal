# Base

Is a collection of necessary software that creates the heart of Lokal.
It gives you

1. MySQL database at `mysql_host` (you need to join "mysql" network with your container)
2. PostgreSQL with PostGIS at `postgres_host` (you need to join "postgres" network with your container)


## Variables to set

You only need to set a `lokal_secret` that will act as a seed for other
passwords and a `password_admin` that you will be using every time when
you will be asked to login as an admin user. An admin person in LDAP with
this password will be created. HTTP simple auth will use this password
as well (for protecting services that don't have own authentication such
as portainer).

### Available versions

- `version_prometheus`: https://hub.docker.com/r/prom/prometheus/tags
- `version_traefik`: https://hub.docker.com/_/traefik

## Portainer setup

Portainer comes with default "admin" user with `password_admin` password.
Upon first usage, it is necessary to set new environment defined by
the docker socket that is already bound to the portainer container.

![portainer-setup](portainer-setup.png)