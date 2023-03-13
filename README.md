
# Lokal Services. Global Impact.

[![Twitter URL](https://img.shields.io/twitter/follow/WakomaInc?style=social)](https://twitter.com/WakomaInc)


At least 2.7 billion people out of 8 billion globally are [offline](https://www.itu.int/en/mediacentre/Pages/PR-2022-09-16-Internet-surge-slows.aspx) - and many people already connected do not have [meaningful access](https://a4ai.org/news/what-is-meaningful-internet-access-conceptualising-a-holistic-ict4d-policy-framework/).

Lokal, especially combined with [nimble](https://github.com/Wakoma/nimble), enables communities to quickly start and manage a network that has services and content which are available even when there is no access to the wider internet.  Existing networks can also deploy Lokal to bring local content and services to the communities they serve.

Included services (save one or two) are open source and primarily focused on enabling communities to create, localize, and share their *own* content, whether this is educational or just for fun.  The platform also enables offline, high resolution video/audio/text communication, whether or not there is internet access.  Our team works closely with underconnected communities around the world to add new services to Lokal to meet their own needs.

You can find the full list of current and upcoming services [here](https://github.com/Wakoma/Lokal/tree/main/roles#current-services).

![Alt text](https://github.com/Wakoma/docs/blob/main/docs/assets/nimblemeshcolorcropped.png)
 

## What else can it do?

The platform enables social eLearning (building, running and taking social courses), video and audio calling and messaging, high-speed file-sharing and synchronization, wireless network management, media streaming, collaborative document and spreadsheet creation, and much more.

## How does it work?

1. Find computer. New/old/laptop/desktop.
2. Install Linux operating system on computer.
3. Install Lokal (see below)
4. Add your own content, or download readily available content from the web.
5. Connect computer to your network to enable community access to the service.

## Installation Details

Lokal is installed via ansible. Therefore we provide ansible playbook to prepare your remote server and another playbook to handle Lokal's services.

Lokal is composed of services, that are, due to the choice of ansible, hidden in the folder `roles`. You can specify which services will be installed for each host separately by using `services` variable in their inventory file. Simply add the  folder's name into the `services` array. The only mandatory role to be included in your `services` is the `base`. All other
services are optional.

The inventory file is the only file you need to edit. It lives in `hosts/` folder and is a complete prescription of the future Lokal installation. This file contains list of installed services and their configuration. There are two example hosts files: `local` and `remote`. We recommend naming your hosts files according to the domain of your target server.

### How do I try it out?

Please take a look at the script `tryitout.sh`. There are the few necessary steps to run Lokal on your computer with the most basic setup (monitoring + wordpress). If you happend to have `apt` based OS, then you can simply run the script.
 
The script will first create `$HOME/lokal-client` that is a python virtualenv and installs ansible into it. Then it starts Lokal installation that will use provided `hosts/local` "inventory file" hence will install lokal into `$HOME/lokal` with mentioned services.

You can change the location and services and passwords in this file. The file `hosts/local` is the only file that you need to modify and it completely describes Lokal setup.

### Installation

Once you have setup ansible on your computer and (optionally) server ready using `prepare.yml` then you can start using the main `playbook.yml` that by default installs all services defined in `hosts` file in `services` variable.
```bash
ansible-playbook -i hosts/<your-host-file> playbook.yml
```
You can run installation multiple times. It should only check that everything is setup correctly. If you'd increase version in software in your hosts file or we would increase the version in the underlying roles than running the installation again would update the application.

### Backup

You can either backup concrete services by specifying `-e backup=service1,service2`.
```bash
ansible-playbook -i hosts/<your-host-file> -e backup=wordpress,matmoto playbook.yml
```

### Restore

Of course you can restore backed up services using `-e restore=service1,service2`.
```bash
ansible-playbook -i hosts/<your-host-file> -e restore=wordpress playbook.yml
```

## More documentation

For more details, please refer to our [documentation](docs/) or its rendered version at https://docs.lokal.network.

## Support/Info

Feel free to join us here:

* [nimble Website](https://wakoma.co/nimble/)
* [Matrix Space](https://matrix.to/#/!JWutrWVlqsuiauWbPf:wakoma.net?via=wakoma.net)
* [Twitter](https://twitter.com/WakomaInc)
* Mastodon, Peertube, Pixelfed (coming soon)

## Similar Projects

- https://github.com/yunohost
- https://github.com/getumbrel
- https://github.com/iiab/

There are many platforms for deploying services, many of which we support.  For example, [Internet in a Box](https://github.com/iiab/) is a great solution if you're aiming to deploying local content on a Raspberry Pi or similar SBC, to a smaller number of users.

Lokal aims to make it easier to deploy locally relevant content and services to ANY number of users, depending on the network in which it runs. 

We're also using and integrating services that enable network management, offgrid communications, live radio, content production, and other tools which are absent in a number of existing platforms but essential for communities without meaningful connectivity. 


## Contributing

Our team is global, diverse, and very open to new ideas and contributions.

We will soon make a guide at docs.lokal.network on how to add new services or features to Lokal.

In the meantime, feel free to ping us at info @ wakoma.co or in the Lokal [Matrix Room](https://matrix.to/#/!LiofJlKVLSDakgkDGf:wakoma.net?via=wakoma.net).

![Alt text](https://wakoma.co/wp-content/uploads/2020/01/IMG_5704-Large.jpg)
