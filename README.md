# Lokal Services. Global Impact.

Lokal enables communities to access opensource network services without the internet. Lokal provides opensource alternatives to the most used services such as youtube, twitter, whatsapp, blogs and others.
Lokal is focused on QoS, Ops and connectivity rather than just providing a bunch of services.

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

## How do I try it out?
First, you need ansible installation. We recommend version `>=2.10`. It is a python package so
alternatively, you can use pip to install it. Otherwise (since ansible does not work on windows)
you are free to use our docker container, that contains ansible with all necessary modules. You
can create one on your own with enclosed `Dockerfile` in the root of this project.
```bash
docker build -n lokal:latest -f Dockerfile .
docker run -v .:/lokal -it lokal:latest
```
This will give you a bash terminal where you can access local files and run all commands described below.
__This is just a "client" that you use to actually install Lokal on your server. It is not Lokal installation.__

You need a fresh ubuntu server to run Lokal on. We use ansible to deploy the whole complicated setup.
In order to install Lokal, you need to know the IP and root password of your server. Have an SSH key
ready as well.

First, create a new file in `hosts/` folder. I use server's nickname without any suffix. This file will include IP, domain and other details about your server so Lokal can setup correctly. It needs to be in
YAML format so you can specify services in this nice way. The minimal example is bellow

```YAML
all:
  hosts: 1.2.3.5 # your server's IP (can be a hostname too)
  vars:
    server_is_live: true # or false if it is just testing machine not visible from the internet
    domain: server.example.com # domain visible from the outside internet (used only when server_is_live=true)
    ansible_user: ubuntu # the application user under which Lokal will run
    services: # define wanted services - list of available is in services/ folder
    - lokal
    - wordpress
```

Other options, that can be overriden can be found in `roles/<service>/defaults/main.yml`. You most likely
want to check out `lokal` service because it contains all the most basic variables.

## Prepare a fresh server

This supposes that you already have created an application user and setup your SSH key in it's `authorized_keys` file. If this is not the case, we have a playbook that does everything for you. 
Create different `hosts/` file - I name it `server-prep` and the content is following
```ini
[your-server-nickname]
162.55.180.169

[your-server-nickname:vars]
app_user=ubuntu # change that to your desired application user
ansible_user=root
setup_ssh=true # if you have set SSH keys for then set this to false and leave `ssh_key` empty 
ssh_key=<content of your .ssh/id_rsa.pub or wherever you have your public key>
```

Now you are ready to run `ansible-playbook -i hosts/<your-host-prepare> prepare.yml`

## Services

Due to choice of ansible, the services are actually hidden in `roles` folder. You can find the basic
service `lokal` and optional services in other folders. You can choose services per host - thus in your
`hosts/` file. Add/remove any desired services in `vars:services` list. The `lokal` service is mandatory
- it would not make much sense without it. 

## Installation

```bash
ansible-playbook -i hosts/<your-host-file> playbook.yml
```

## Backup

You can either backup all services at once by specifying `-e backup=all` or just a couple of services
by using `-e backup=service1,service2`. See complete commands bellow.

```bash
ansible-playbook -i hosts/<your-host-file> -e backup=all playbook.yml
ansible-playbook -i hosts/<your-host-file> -e backup=wordpress,matmoto playbook.yml
```

## Restore

## Where did Lokal start?
In 2018 Wakoma partnered with VPUU ([Violence Prevention Through Urban Upgrading](https://vpuu.org.za)) in South Africa to start [V-NET](http://vpuu.org.za/towards-a-community-circular-economy/bridging-the-digital-divide/), a wireless community network, to bring connectivity in townships and informal settlements around Cape Town.  As part of V-NET, our team started building V-Stack, a suite of offline content and services offered to local communities.

What started as a small network connecting VPUU’s satellite offices has now become one of the largest community-based networks in South Africa, with over 75 hotspots, 40,000 unique users, and a 10Gbps+ backhaul capacity.  Wakoma is supporting the further development of the platform as 'Lokal' to meet the demands of V-NET, and enable other networks and communities to use and build on our progress to date. 

## What can it do?

The platform enables social eLearning (building, running and taking social courses), video and audio calling and messaging, high-speed file-sharing and synchronization, wireless network management, media streaming, collaborative document and spreadsheet creation, and much more. 

## How can I get involved?

Jump in here, or reach out to info@wakoma.co.

Also have a look at current paid opportunities to get involved [here](https://wakoma.co/opportunities/)! 


![Alt text](https://wakoma.co/wp-content/uploads/2020/01/IMG_5704-Large.jpg)
