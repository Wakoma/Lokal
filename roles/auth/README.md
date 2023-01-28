# Authelia

Authelia provides a single sign on (SSO) to your applications. Authelia captures every request that
is going to your application. If it sees the request origin for the first time then it redirects user
to a login portal. Once the user is logged-in the you will see following headers in HTTP requests to
your application: `X-Forwarded-Proto`, `X-Forwarded-Host`, `X-Forwarded-Uri`, `X-Forwarded-For`, 
`X-Forwarded-Method`

# Usage

If you want your application to be protected by authelia then add following line into your `labels`

```yaml
        traefik.http.routers.your-router.middlewares: authelia@docker
```

# Configuration

Authelia binds to LDAP from `base` role. It requires working SMTP (over TLS) to send password-resets
to the users. Currently the `base` does not provide a SMTP server but there is `mail` role that we
recommend installing prior to `auth`. Just put the `mail` role before `auth` in your `services`
variable.