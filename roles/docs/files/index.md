# Home

Lokal is a collection of software deployed by ansible that runs as separate docker containers.

How to deploy those docs?

```bash
ansible-playbook -i hosts/lokal.network -e install=docs playbook.yml
```