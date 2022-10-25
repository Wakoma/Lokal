# Wordpress

## Install

The basic install can be run only once. Afterwards, would be the danger of downgrading your
installation that could have been updated manually via the web interface. Luckily, this role
takes that into account and run an upgrade step if possible.

## Upgrade

Wordpress' docker has two volume points (see `docker inspect wordpress:latest`)
- `/var/www/html/` for the application code (populated from the container if empty on startup)
- `/var/www/html/wp-content` for user's modification (done via the web UI)

There are two ways of arranging the docker-compose for upgrades

1. Having two persistent volumes thus if somebody does `down` and `up` the app code stays the same
2. Having only `wp-content` volume thus the app will always match the code in the image

Both options have own pros&cons regarding wordpress upgrade. Wordpress can be upgraded via the web
interface - that upgrades the code in `/var/ww/html` and run db migrations. We must ensure that code continue to matche the DB no matter what. Therefor, if somebody runs `docker-compose down`
and `docker-compose up` the database will be the same. So the code must stay the same as well.

For that reason, we need a persistent volume for the application code as well as for the `wp-content`.
To actually update the code from newer image, one need to clear the content of `/var/www/html/` manually
and then start a new container from the new image.

The docker-commpose is done in such way that only persistent volume is mounted to
`/var/www/html/wp-content` as recommended by the wordpress team. This directory
holds user's customizations such as serialized configs and plugins.
Other thing to note is `define('AUTOMATIC_UPDATER_DISABLED', true );` that blocks
automatic updates. Manual updates via web interface are still allowed. In order to
cope woth that the installation tasks will fail if the wordpress version is higher
than thr container's version.

## Migration guide from Lokal 1.0 to Lokal 2.0

We need to port the database and files inside `/var/www/html/wp-content`. Currently,
whole `/var/www/html` was mounted into a persistent volume. Thus we need to take only
the `wp-content` directory.

As for database - just do a `mysqldump` and restore into the new database using TCP port.

### Possible problems

If somebody upgraded their version then it would be better to align with this version
by setting variable `version_wordpress` to the correct value. See the default value
in `wordpress/defaults/main.yml`. The version must exist in Docker Hub.
