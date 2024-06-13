# Jellyfin

Jellyfin is a video home server comparable to Netflix and others. We provide two ways of adding
content - via transmission client (https://torrent.{your-domain}) and by manual furnihing into
the `data` folder by default located on the server at `/opt/lokal/jellyfin/data` (where `/opt/lokal`)
is configurable by `project_root` variable thus can be found elsewhere.

## Setup

Unfortunatelly, you need to finish the installation manually because there is no
way of creating the admin account automatically.
After installation, go to `https://{subdomain_jellyfin}.{your-domain}/web/index.html#!/wizarduser.html`
to invoke the admininstration setup. Where jellyfin's default subdomain is `video`.

## Connecting

If it asks you to connect to a server, simply use `https://{subdomain_jellyfin}.{your-domain}` without
specifying any port as hinted in the prompt.