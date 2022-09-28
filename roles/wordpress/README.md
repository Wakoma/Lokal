# Wordpress

## Updating

The docker-commpose is done in such way that only persistent volume is moounted to
`/var/www/html/wp-content` as recommended by the wordpress team. This directory
holds user's customizations such as serialized configs and plugins.
Other thing to note is `define('AUTOMATIC_UPDATER_DISABLED', true );` that blocks
updates via web interface. Therefor the only way of upgrading wordpress is
actually via updating it's version in the `compose.yml.j2` template and re-deploy. 

## Upgrade guide

We need to port the database and files inside `/var/www/html/wp-content`. Currently,
whole `/var/www/html` was mounted into a persistent volume. Thus we need to take only
the `wp-content` directory.

As for database - just do a `mysqldump` and restore into the new database using TCP port.

### Possible problems

If somebody upgraded their version then it would be better to align with this version
by setting variable `version_wordpress` to the correct value. See the default value
in `wordpress/defaults/main.yml`. The version must exist in Docker Hub.
