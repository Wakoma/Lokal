# Grafana

Default user is admin with password defined in `password_admin` variable.

The default subdomain is `dash` and can be changed by `subdomain_grafana`
variable. Once you log in then you would want to add a prometheus data source.
It lives on (internal) address `http://prometheus:9090`.

You can controll grafana version by a variable `version_grafana`. Available version
are listed in https://hub.docker.com/r/grafana/grafana/tags.
