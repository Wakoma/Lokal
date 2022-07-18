# How to install Lokal

You can either install Lokal directly on your machine or perform a remote installation over ssh using ansible.

# Prepare the client

Client is the machine that issues commands and launches services on the server. Client and server can be the
same machine - then it is a local installation.

You can either create a client from your machine (run `local.sh`) or use provided Dockerfile to
quickly prepare a controller on less dev-friendly environment such as Windows OS.

`docker build `

1. Install necessary software on your machine - use `local.sh` script in the root of this project.
2. Run ansible playbook to prepare the target machine for running docker-compose services
3. Run ansible playbook to actually launch the docker-compose services

## Remote host

If you want to launch services on a remote host, you need to create yourself an "inventory"
ansible file with connection details to the remote server.


# Envs
Live - actual production
Prod - development (because it contains Mailhog) but expects public IP and domain name
Prod-local - development (contains Mailhog) but no public access nor traefic CERT_RESOLVER
