# Services

Lokal provides software as sepatare `roles`. There are two special roles. Maybe we should have moved
the `lokal` role to a separate module. We'll see if we do in the future.

## Common role

This is the only role that does not hold any software - it is intended solely for developers. You
will use it when add your own role (service). Common role contains logic to install, backup, restore, and remove
applications. Therefore it is hard-wired in playbook.yml because all standard roles are using it. If you
want to add a new software to Lokal stack please visit (lokal/)[this lokal role] for more information.

## Base role

The other special role is `base`. It is special because it is mandatory. It contains necessary software
for running Lokal.

## Other roles

All other roles contain installable software. Roles define their default variables in `default/main.yml`.
Roles can use undefined variables to force you to actually define them. This is not as lokal as before
because for example passowrds are deduced from `lokal_secret`. Only publically-facing credentials need to
be defined.

Each role should take advantage of `password_admin` to create any "admin" accounts if possible. If your
software is intended only for admin users and it doesn't have builtin authentication mechanism then you
can easily hide it behind traefik's basic authentication mechanism.

# Creating your own service

Please take a look in the `lokal` role that provides necessary logic for apps instalations and handling.

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
