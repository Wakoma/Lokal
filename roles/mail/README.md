# Mail

We use Maddy as the email server. Externally, the mail service expose only ports `465` and `993`.

- `465` is the sending (SMTP) protocol over TLS
- `993` is the reading (IMAP) protocol over TLS

No other protocol variants is available due to routing capabilities (getting the intended
hostname from the request).

Maddy will export DKIM key to `/var/lib/maddy/dkim_keys/example.org_default.dns`. This
must be available to user.


## Users

### LDAP
In case you have `users` role then it will take users dynamically created by the admin.
There is no special group needed for LDAP users to have their email account. They just
need to be `ou=people`.

### Static users
If no LDAP is used, you can define users statically via
```yaml
  mail_users:
    "username-without-@domain": "plaintext-password"
```
Hashed password must be in UNIX standard form `"$<ALG>$<SALT>$<HASH>"` that can be generated
using `openssl passwd`