# Ansible Collection - lokal.lokal

Lokal is like HomelabOS or YunoHost but in Ansible with all services
tightly interconnected using standard tools. That means that there is
one instance of database (MySQL and Postgres) and all services are
using those instead creating their own. Users are managed by a LDAP
service that is, again, shared between all services. The same with
email.

Lokal is an ultimate configuration tool for any dockerizable service.


## Extensible

Adding services to lokal is IMO quite simple. Lokal gives you task
that will install and configure dbs, storages and routing in Lokal
for given service.