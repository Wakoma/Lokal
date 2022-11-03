# Jitsi

Jitsi is a bit harder to install because Jitsi team did a great job in
making everything very complicated.

## Migration from lokal 1.0 to lokal 2.0

```bash
mkdir -p /opt/lokal/jitsi/prosody
sudo cp -r /var/lib/docker/volumes/jitsi/_data /opt/lokal/jitsi/jitsi
sudo cp -r /var/lib/docker/volumes/jvb/_data /opt/lokal/jitsi/jvb
...
sudo chown -R {{ansible_user}}:{{ansible_user}} /opt/lokal/jitsi
```