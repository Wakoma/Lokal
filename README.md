# Lokal Services. Global Impact.

Lokal enables communities to access opensource network services without the internet. Lokal provides opensource alternatives to the most used services such as youtube, twitter, whatsapp, blogs and others.
Lokal is focused on QoS, Ops and connectivity rather than just providing a bunch of services.

![Alt text](https://wakoma.co/wp-content/uploads/2021/04/content2.jpg) 

## What is it?

Lokal is a platform comprised of customizable open source software and services that enable communities and organizations to create, consume and communicate offline, or online if a connectivity to the internet is provided. Lokal can run on most servers, whether it’s a Raspberry Pi, a [nimble](https://wakoma.co/nimble), or a virtual private server.

## Hasn’t something like this been built before? 

Yes, many, many times. Which is why we’re trying not to reinvent anything.  Slightly less than half of the world is offline - our intention is to make it easier for communities and organizations to get offline/local content and services running and configured without the high cost and hassle.

## What is different about Lokal than similar platforms?

Lokal is built to be offline first.  Users can run the services in a global server OR local server that runs offline or online.

We're also using and integrating services that enable network management, offgrid communications, live radio, content production, and other tools which are absent in a number of existing platforms but essential for communities without meaningful connectivity. 

## How does it work?

Lokal is installed via ansible. Therefore we provide ansible playbook to prepare
your remote server and another playbook to handle installation and other operations.

Lokal is composed of services, that are, due to the choice of ansible, hidden in 
folder `roles`. You can specify which services will be installed for each host 
separately by using `services` variable in their `hosts/` file. Simply add the 
folder's name into the `services` array. The only mandator service is the `base`
service that provides database and monitoring. All other services are optional.

The inventory file is the only file you need to edit. It lives in `hosts/` folder
and is a complete prescription of the future Lokal installation. This file contains
list of installed services and their configuration. There are two example hosts files:
`local` and `remote`. We recommend naming your hosts files according to the domain
of your target server.

## How do I try it out?

Please take a look at the script `tryitout.sh`. There are the few necessary steps 
to run Lokal on your computer with the most basic setup (monitoring + wordpress).
If you happend to have `apt` based OS, then you can simply run the script.

The script will first create `$HOME/lokal-client` that is a python virtualenv and
installs ansible into it. Then it starts Lokal installation that will use provided `hosts/local`
"inventory file" hence will install lokal into `$HOME/lokal` with mentioned services.
You can change the location and services and passwords in this file. The file `hosts/local`
is the only file that you need to modify and it completely describes Lokal setup.

## Installation

Once you have setup ansible on your computer and (optionally) server ready using `prepare.yml`
then you can start using the main `playbook.yml` that by default installs all services defined in 
`hosts` file in `services` variable.
```bash
ansible-playbook -i hosts/<your-host-file> playbook.yml
```
You can run installation multiple times. It should only check that everything is
setup correctly. If you'd increase version in software in your hosts file or we
would increase the version in the underlying roles than running the installation
again would update the application.

## Backup

You can either backup concrete services by specifying `-e backup=service1,service2`.
```bash
ansible-playbook -i hosts/<your-host-file> -e backup=wordpress,matmoto playbook.yml
```

## Restore

Of course you can restore backed up services using `-e restore=service1,service2`.
```bash
ansible-playbook -i hosts/<your-host-file> -e restore=wordpress playbook.yml
```

## More documentation

For more details, please refer to our [documentation](docs/) or its rendered version
at https://docs.lokal.network


## What can it do?

The platform enables social eLearning (building, running and taking social courses), video and audio calling and messaging, high-speed file-sharing and synchronization, wireless network management, media streaming, collaborative document and spreadsheet creation, and much more. 

## How can I get involved?

Jump in here, or reach out to info@wakoma.co.

Also have a look at current paid opportunities to get involved [here](https://wakoma.co/opportunities/)! 


![Alt text](https://wakoma.co/wp-content/uploads/2020/01/IMG_5704-Large.jpg)
