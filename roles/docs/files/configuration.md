# Configuration
Configuration is done via variables in your hosts file. This file completely
describes your Lokal instalation and therefore it is the only thing that you
need to backup in order to recreate fresh installation of your server.

## Mandatory variables
Following variables is mandatory to set because they are necessary for the
security or correct functioning of your installation.

### email_admin
Email account that will be publicly visible (e.g. on certificates and help pages). 

### password_admin
Password that will be used for the "admin" account throughout the apps. Should
be different from your admin's email passowrd.

### lokal_secret
All secrets/passwords that you, as a user, should not come to contact with
will be derived from this value. Such as database passwords and others.

### services
Array of Lokal services that will be installed on the machine. Only `base`
is mandatory. It must contain only folder names found at `roles/` folder.

Example:
```yaml
  services:
  - base
  - matrix
  - wordpress
```

### domain
Root domain. Only one HTTP service (for example wordpress) will hook to this.
All others will most likely create their own subdomains that can be usually
controlled by a `subdomain_<app>` variable. For example if your `domain: "myserver.com"`
and you add `matmoto` in the `services` and set `matmoto_subdomain: "learn"` then matmoto app
will be accesible via "https://learn.myserver.com".

## Encryption
Encryption of the traffic is crucial part of security and credibility. Lokal provides you
with three options:
- let's encrypt,
- static certificates,
- self-signed certificates

### ssl_use_acme
If `ssl_use_acme` is set to `true` then the server will use Let's encrypt services to issue
certificates for the root domain and all subdomains. Setting `email_admin` is necessary for
let's encrypt account creation.

### ssl_key and ssl_cert
If you have wildcard certificates for your domain then Lokal enables you to use them simple.
Put relative paths to both certificate and private key into repsective variables `ssl_key`
and `ssl_cert`. The paths are relative to where you run the playbook from, which will mostly
be the root of the repository.

In case that you were using self-signed certificates and then you switch to static certificates
then you need to go to the server and delete `<project_root>/<domain>.crt` and `<project_root>/<domain>.key`
because they will not be overriden.

### verbose
Increase verbosity of logging. Default `false`

## Optional variables

### project_root
Absolute path (optionally using envvars such as `$HOME`) to the root installation of Lokal.
All configuration and data files will be writen exclusively here. Therefor, if you don't use
symlinks, backing up this folder should guarantee a full backup of your whole setup.

Default: `"/opt/lokal/"`