# Jitsi

We provide all jitsi services

## Migration from lokal 1.0 to lokal 2.0

### Passwords
Passwords were stored locally on the HOST machine (the machine that is running ansible)
in files at `$HOME/.ansible.pass/`. If you don't have the machine that installed jitsi
there, you can find password values in `$HOME/docker-jitsi-meet-stable-6865/.env` in
variables matching hosts variables (except the .env vars are uppercase)
- `jicofo_auth_password`
- `jvb_auth_password`
- `jigasi_xmpp_password`
- `jibri_recorder_password`
- `jibri_xmpp_password`
You must transfer the values into hosts variables shown above before attemtpting installation.

### Volumes
It is necessary(?) to move named volumes into bound volume paths (and preserve their rights)

```bash
sudo mv ~/.jitsi-meet-cfg/jvb /opt/lokal/jitsi/jvb
sudo mv ~/.jitsi-meet-cfg/web/letsencrypt /opt/lokal/jitsi/web
sudo mv ~/.jitsi-meet-cfg/transcripts /opt/lokal/jitsi/transcripts
sudo mv ~/.jitsi-meet-cfg/prosody/config /opt/lokal/jitsi/prosody
sudo mv ~/.jitsi-meet-cfg/prosody/prosody-plugins-custom /opt/lokal/jitsi/prosody-plugins-custom
sudo mv ~/.jitsi-meet-cfg/jicofo /opt/lokal/jitsi/jicofo
```