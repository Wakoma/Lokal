# Base

Is a collection of necessary software that creates the heart of Lokal.

## Variables to set

```yaml
mysql_root_password: default
```

### Available versions

- `version_prometheus`: https://hub.docker.com/r/prom/prometheus/tags
- `version_grafana`: https://hub.docker.com/r/grafana/grafana/tags
- `version_traefik`: https://hub.docker.com/_/traefik

## Grafana

Default credentials are admin/admin and the default subdomain is `dash`. Once
you log in then you would want to add a prometheus data source. It lives on
address `http://prometheus:9090`.