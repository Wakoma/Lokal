# Fdroid repository

Fdroid repository is s statically generated content served by an ordinary HTTP server.

The infrastructure consist of the generator (docker-executable-fdroidserver) and from a 
metadata managment django app called repomaker. The repomaker image is able to handle
keys and sign APKs or repository because it contains fdroid binary (making docker-executable-fdroidserver)
useless.

Fdroid binary has an ability to synchronize with an existing fdroid repo via command `fdroid mirror <url>`
that will download the static content and serve it as its own. This can be done with the official repository
at `https://fdroid.org`. All fdroid repository expect to have the repo accessible at `/fdroid/repo` path.
Therefor you can have only one repo per domain.

Only two envvars are necessary (because they are pulled from the env by the app)
- REPOMAKER_HOSTNAME
- REPOMAKER_SECRET_KEY
