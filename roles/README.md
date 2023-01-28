# Services

Lokal provides software as sepatare `roles`. There are two special roles. Maybe we should have moved
the `common` role to a separate module. We'll see if we do in the future.

## Common role
But, speaking of `common` - this is the only role that does
not install any software - it contains logic to install/backup/restore/remove applications. Therefore
it is hard-wired in playbook.yml and all other roles are taken from the `services` variable. If you
want to add a new software to Lokal stack please visit this role for more information.

## Base role
The other special role is `base`. It is special because it is mandatory. It contains necessary software
for running Lokal and a database that majority apps is using because it is setup via common.install task.

## Other roles
In order to add more software to your host server it is necessary to add them into `services` variable
that is simply an array of strings where the values are names of the roles. Therefore the most basic
setup for a host would be

```yaml
all:
  hosts: "x.y.z.a"
  vars:
    ssl_use_acme: true
    domain: your.domain.com
    email_admin: your@email.com
    ansible_user: ubuntu
    services:
    - base
    - unifi
```

# Running stuff
`playbook.yml` has multiple mode-operandi it works in:

- install (default)
- backup
- restore
- remove (only some services)

```bash
ansible-playbook -i hosts/your-host playbook.yml
```
This command will install/update all applications specified in the `services` variable.

To issue something else than installation, you need to specify the action using `-e` 
together with services, that you want to affect. It is discussed in detail in the 
following sections.

## Install

Installation should be an indempotent operation (the author of installation tasks is responsible).
Installation either installs or updates the application. For example wordpress has more complicated
upgrade logic because it could have been manually updated via the web interface and its role takes
this into account.

## Backup

You control what is being run by ansible-playbook's command line argument `-e backup`. Variable
backup should contain comma-separated services that you want to backup e.g.:
```bash
ansible-playbook -i host/your-host -e backup=wordpress,matmoto playbook.yml
```

## Restore

Restore is controlled by property `restore` with the same syntax as `backup` - it should contain also
comma-separated services that you want to restore.
```bash
ansible-playbook -i host/your-host -e restore=wordpress,matmoto playbook.yml
``` 

## Uninstall

Uninstall is controlled by `uninstall` property with same syntax as the ones above. You can remove the
uninstalled program from `services` variable before or after running the `uninstall` command.

# Creating your own service

Please take a look in the `common` role that provides necessary logic for apps instalations and handling.

# What services does it include so far?

You can find the full list of services here: https://wakoma.co/lokal/#services

## Current Services

* [AzuraCast](https://www.azuracast.com/) - azuracast is a free and open-source self hosted web radio management suite.

* [Calibre Web](https://github.com/janeczku/calibre-web) - Calibre-Web is a web app providing a clean interface for browsing, reading and downloading eBooks using an existing Calibre database.

* [Collabora Office](https://www.collaboraoffice.com/) - Powerful on-premise office suites that enable you to access documents, author new content and work collaboratively.

* [Element](https://element.io/) - All-in-one secure chat app for teams, friends and organisations.

* [Grafana](https://grafana.com/) - From dashboards to metrics, logs and traces. Choose what works best for you and your team.

* [Jellyfin](https://jellyfin.org/) - Jellyfin is the volunteer-built media solution that puts you in control of your media. Stream media to any device.

* [Jitsi](https://jitsi.org) - More secure, more flexible, and completely free video conferencing.

* [Kiwix](https://www.kiwix.org/en/) - Offline Wikipedia, Gutenberg Library, TED talks, and terabytes more.

* [Kolibri](https://learningequality.org/kolibri/) - An education content library for easy access to Khan Academy and more.

* [Matomo](https://matomo.org/) - Google Analytics alternative that protects your data and your customers’ privacy.

* [Matrix Synapse](https://matrix.org/) - An open network for secure, decentralized communication.

* [Moodle](https://moodle.com/) - a flexible, open source LMS.

* [Nextcloud](https://nextcloud.com/) - The self-hosted productivity platform that keeps you in control.

* [OpenVPN](https://openvpn.net/) - Free and full-featured VPN client to connect to OpenVPN Cloud, Access Server or any OpenVPN protocol compatible server.

* [Prometheus](https://prometheus.io/) - Power your metrics and alerting with a leading open-source monitoring solution.

* [ResourceSpace](https://www.resourcespace.com/) - ResourceSpace open source Digital Asset Management software is the simple, fast, & free way to organise your digital assets.

* [Transmission](https://transmissionbt.com/) - Fast, easy, and free BitTorrent Client (for downloading Kiwix ZIM files and other open licensed content).

* [UISP](https://uisp.ui.com/) - Advanced network monitoring and management (not open source)

* [UniFi Controller](https://www.ui.com/software/) - Network Management Software that binds gateways, switches and wireless access points together with one graphical front end. (Not open source)

* [UnPoller](https://unpoller.com/) - UnPoller allows you to collect data from your UniFi network controller, save it to a database, and then display it on pre-supplied attractive and data-rich Grafana dashboards

* [WireGuard](https://www.wireguard.com/) - Lightweight and high performance open source VPN protocol.

* [Wordpress](https://wordpress.org/) - WordPress is open source software you can use to create a beautiful website, blog, or app.

## Upcoming Services

* [BigBlueButton](https://bigbluebutton.org/) - Supports real-time sharing of audio, video, slides (with whiteboard controls), chat, and the screen. Instructors can engage remote students with polling, emojis, and breakout rooms.

* [Diagrams.net](https://www.diagrams.net/) - A configurable diagramming/whiteboarding visualization application

* [Discourse](https://www.discourse.org/) - Discourse is the 100% open source discussion platform. Use it as a mailing list, discussion forum, long-form chat room, and more!

* [DokuWiki](https://www.dokuwiki.org/dokuwiki) - DokuWiki is a simple to use and highly versatile Open Source wiki software that doesn’t require a database.

* [Etherpad](https://etherpad.org/) - Etherpad is a highly customizable open source online editor providing collaborative editing in really real-time.

* [F-Droid](https://f-droid.org/en/) - An installable catalogue of FOSS (Free and Open Source Software) applications for the Android platform.

* [HedgeDoc](https://hedgedoc.org/) - HedgeDoc (formerly known as CodiMD) is an open-source collaborative markdown editor.

* [Home Assistant (HASSIO)](https://www.home-assistant.io/) - Open source home automation that puts local control & privacy first. 

* [LimeSurvey](https://www.limesurvey.org/) - Create and launch surveys.

* [Lychee](https://lychee.electerious.com/) - Lychee is a free photo-management tool, which runs on your server or web-space.

* [MediaWiki](https://www.mediawiki.org/wiki/MediaWiki) - MediaWiki is a collaboration and documentation platform brought to you by a vibrant community.

* [Minecraft](https://www.minecraft.net/) - Server for multiplayer Minecraft.

* [osTicket](https://osticket.com/) - osTicket is a widely used and trusted open source support ticketing system.

* [Piwigo](https://piwigo.org/) - Piwigo is open source photo gallery software for the web. Designed for organisations, teams and individuals.

* [RoundCube](https://roundcube.net/) - A browser-based multilingual IMAP client with an application-like user interface. (Open Source email software).

* [Syncthing](https://syncthing.net/) - A free, open-source peer-to-peer file synchronization application.

* [Tiny Tiny RSS](https://tt-rss.org/) - Tiny Tiny RSS is a free and open source web-based news feed (RSS/Atom) reader and aggregator
