# Mail

We use Maddy as the email server. Externally, the mail service expose only ports `465` and `993`.

- `465` is the sending (SMTP) protocol over TLS
- `993` is the reading (IMAP) protocol over TLS

No other protocol variants is available due to routing capabilities (getting the intended
hostname from the request).

Maddy will export DKIM key to `/var/lib/maddy/dkim_keys/example.org_lokal.dns`. Which is
bond to `{{project_root}}/mail.{{domain}}/mail/dkim_keys/<domain>_<dkimword>.dns`. This
wil; be available to user at CWD.


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
