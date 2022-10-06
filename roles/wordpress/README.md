# Wordpress

## Install

The basic install can be run only once. Afterwards, there is a danger of downgrading your
installation. Installation will thus fail if there is any wordpress installation found.
The code that prevents downgrade is hidden in `upgrade` command. Use that after installation.

## Upgrading

Wordpress has two volumes
- `/var/www/html/` for the application code
- `/var/www/html/wp-content` for user's modification (done via the web UI)

There are two ways of arranging the docker-compose for upgrades

1. Having two volumes thus if somebody does `down` and `up` the manually updated code stays
2. Having only `content` volume thus image version will always set the code version

Both ways have own disadvantage. With two volumes, we cannot accidentaly have different
DB schema and code. Because code and DB schema stays between restarts and even `up&down`s.
But to actually upgrade the code, one need to clear the content of `/var/www/html/` before
launching a new container.
With one volume, the upgrade is more straightforward because the code gets updated automagically.
The problem is if somebody `down&up`s a container then the code might get reverted to older version
(if it wasd updated manually via the web interface) but the DB stays in the later version.


The docker-commpose is done in such way that only persistent volume is mounted to
`/var/www/html/wp-content` as recommended by the wordpress team. This directory
holds user's customizations such as serialized configs and plugins.
Other thing to note is `define('AUTOMATIC_UPDATER_DISABLED', true );` that blocks
automatic updates. Manual updates via web interface are still allowed. In order to
cope woth that the installation tasks will fail if the wordpress version is higher
than thr container's version.

## Migration guide

We need to port the database and files inside `/var/www/html/wp-content`. Currently,
whole `/var/www/html` was mounted into a persistent volume. Thus we need to take only
the `wp-content` directory.

As for database - just do a `mysqldump` and restore into the new database using TCP port.

### Possible problems

If somebody upgraded their version then it would be better to align with this version
by setting variable `version_wordpress` to the correct value. See the default value
in `wordpress/defaults/main.yml`. The version must exist in Docker Hub.
