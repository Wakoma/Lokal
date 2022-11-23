# Domains and certificates

Lokal provides 4 ways of securing your communication. You need SSL certificates
for your domain to be able to use HTTPS protocol. Lokal uses traefik for routing
traffic to docker containers and thus is using traefik's capabilities.

## HTTP challenge

This is the simplest method that obtains certificates from Let's Encrypt using
HTTP challenge. You need to own a domain and point it (and it's subdomains) to
the Lokal's server IP. Set those variables inside your hosts files in vars 
sections.

```yaml
email_acme: your@email.com
server_is_live: true
cert_resolver: http
```

Your email is necessary for registering to Let's encrypt. `server_is_life` turns
on the usage of Let's Encrypt and cert_resolver to http is obvious in this case.

Traefik will generate one certificate for each subdomain that any of your 
application uses. It even handles automatic renewal before expiration.

## DNS challenge

DNS challenge still uses Let's Encrypt but doesn't require you to pre-set your
DNS records to Lokal server. Since somebody has to do it, then your DNS provider
must support API access and traefik handles this. Currently, the only supported
DNS provider is Namecheap. Following variables are necessary in the hosts file.

```yaml
email_acme: your@email.com
server_is_live: true
cert_resolver: dns
dns_provider: namecheap
namecheap_api_user: your-user
namecheap_api_key: your-key
```

## Static certificates

Suppose you have set your domain's DNS to your server IP and you already have
the certificate generated. It must be two files - a key and certificate. Those
files MUST have standard extensions `.key` and `.crt`. The certificate must be
a wildcard certificate because Local currently does not support multiple static
certificates - one for each subdomain. Your hosts vars would look following

```yaml
static_certificate: "certificate-filename-without-suffix"
```

Then you need to manually copy your certificate and key to 
`/opt/lokal/base/traefik/certs/` and name them according to the 
`static_certificate` variable.

We know this is quite cumbersome and we will find a better solution. 
Recommendations are welcome.

## Self-signed certificates

If you don't setup anything then this is the default option. It supposes default
value `server_is_live: true` and empty `static_certificate`. Then a self-signed
certificates are generated.

The disadvantage is, that your temporal certificate authority, that Lokal uses
to generate those certificate, will definitely not be trusted by browsers.
Therefore anybody accessing any Lokal services will get "Invalid certificate"
warning and must confirm security exception for every domain separately.