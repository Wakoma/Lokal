# Lokal Services. Global Impact.

Open source glue for open source applications and services for content production, curation and sharing.

![Alt text](https://wakoma.co/wp-content/uploads/2021/04/content2.jpg) 

## What is it?

Lokal is a platform comprised of customizable open source software and services that enable communities and organizations to create, consume and communicate offline, or online where there is connectivity.  Lokal can run on most servers, whether it’s a Raspberry Pi, a [nimble](https://wakoma.co/nimble), or a virtual private server.

## Hasn’t something like this been built before? 

Yes, many, many times. Which is why we’re trying not to reinvent anything.  Slightly less than half of the world is offline - our intention is to make it easier for communities and organizations to get offline/local content and services running and configured without the high cost and hassle.

## What is different about Lokal than similar platforms?

Lokal is built to be offline first.  Users can run the services in a global server OR local server that runs offline or online.

We're also using and integrating services that enable network management, offgrid communications, live radio, content production, and other tools which are absent in a number of existing platforms but essential for communities without meaningful connectivity. 

## How does it work?

We provide ansible playbooks to prepare the target machine (either remote or localhost). Services themselves are packed as docker containers and are managed by docker-compose.


## Where did Lokal start?
In 2018 Wakoma partnered with VPUU ([Violence Prevention Through Urban Upgrading](https://vpuu.org.za)) in South Africa to start [V-NET](http://vpuu.org.za/towards-a-community-circular-economy/bridging-the-digital-divide/), a wireless community network, to bring connectivity in townships and informal settlements around Cape Town.  As part of V-NET, our team started building V-Stack, a suite of offline content and services offered to local communities.

What started as a small network connecting VPUU’s satellite offices has now become one of the largest community-based networks in South Africa, with over 75 hotspots, 40,000 unique users, and a 10Gbps+ backhaul capacity.  Wakoma is supporting the further development of the platform as 'Lokal' to meet the demands of V-NET, and enable other networks and communities to use and build on our progress to date. 

## What can it do?

The platform enables social eLearning (building, running and taking social courses), video and audio calling and messaging, high-speed file-sharing and synchronization, wireless network management, media streaming, collaborative document and spreadsheet creation, and much more. 


## What services does it include so far?
You can find the full list of services here: https://wakoma.co/lokal/#services


### Current Services

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

### Upcoming Services

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

## How can I get involved?

Jump in here, or reach out to info@wakoma.co.

Also have a look at current paid opportunities to get involved [here](https://wakoma.co/opportunities/)! 


![Alt text](https://wakoma.co/wp-content/uploads/2020/01/IMG_5704-Large.jpg)
