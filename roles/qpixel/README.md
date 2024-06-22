# QPixel

StackOverflow-like forum.

## Settings

- `qpixel_domain` or `qpixel_subdomain`: `qpixel_subdomain` is by default "qpixel" which would install at qpixel.{{domain}}
  you can override that by specifying whole `qpixel_domain`
- `qpixel_community_name` string (spaces allowed) that will appear in the title of the app
- `qpixel_mysql_password`: change the default mysql password
- `qpixel_minio_password`: change the default minio password


## Debugging

The installation script should create a community with given `qpixel_community_name` and `qpixel_domain`.

It should also mark your admin user (email: admin@`qpixel_domain`, password your `admin_password`)