# OpenWISP

OpenWISP server (a.k.a `controller`) provides a web interface for managing OpenWRT routers
and optionally connect them into a mesh network. Your server and devices need to have the
same `shared_secret` in order to work together.

OpenWRT routers must have `openwisp-config` installed and `/etc/config/openwisp`
configured in order to connect to your OpenWISP controller. Please follow the official
guide for more details https://openwisp.io/docs/user/configure-device.html.

Optional addons to your server are
- `openwisp-monitoring` adds a nice map into your controller
- `openwisp-firmware-updater` adds posibility to update OpenWRT OS
- `openwisp-ipam` adds possibility to manage IP4/6 subnets in your mesh network

## OpenWRT firmware updates

OpenWISP controller needs access to your OpenWRT routers via ssh to upgrade their firmware.
Therefore you need to give access to a SSH private key that OpenWISP is going to use inside
`ssh_private_openwisp` and `ssh_public_openwisp`. Your public key will be appended to
`/etc/dropbear/authorized_keys` on the device.


## Configuration

- `shared_secret_opewisp` - needs to be shared with all nodes that should be able to join the mesh network
- `interface_openwisp` - network interface to create the mesh network at. Default is `eth0`
  when you are in a LAN. Being connected to the internet would require a preconfigured tunel
  (openVPN or Wireguard) that will create its own network interface (e.g. `tun0`).