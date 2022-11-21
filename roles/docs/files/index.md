# Home

Lokal is a collection of software deployed by ansible that runs as separate docker containers.

Check more about development at [devel](devel.html)

How to deploy those docs?

```bash
ansible-playbook -i hosts/lokal.network -e install=docs playbook.yml
```