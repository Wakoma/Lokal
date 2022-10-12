# Migration guide

Lokal has evolved from a monolythic to composed architecture. A few improvements were
made part of this restructuralization that were not necessary but still implemented.
Here we provide a migration guide from the old to the new.

## Volumes

Volumes were changed from named volumes to bound volumes. All data of all containers
can be now found under the lokal's root path `/opt/lokal` by default. Each service has its
own folder e.g. `/opt/lokal/wordpress` and all directories under the app dir are data
directories mounted into the containers.

## Traefik

Static certificates are controlled by `static_certificate` variable that must contain
the path to the certificate and key. Currently, it should contain absolute path without
a suffix that will be added (`.crt` for the certificate and `.key` for the key). Example
value could be _/media/certs/lokal.network_. The old lokal user non-standard `.cer` suffix.


## Wordpress

One change includes a different mount point. In original setup, the wordpress volume was
mounted under `/var/www/html/` but currently (with respect to the container upgrade guide)
the mount points to `/var/www/html/wp-content`. It is therefor necessary to copy only
the folder `wp-content` as `/opt/lokal/wordpress/data` before installing the new Lokal.
