# OpenWISP

Provides a way how to setup mesh network.

## Configuration

- `shared_secret_opewisp` - needs to be shared with all nodes that should be able to join the mesh network
- `interface_openwisp` - network interface to create the mesh network at. Default is `eth0`
  when you are in a LAN. Being connected to the internet would require a preconfigured tunel
  (openVPN or Wireguard) that will create its own network interface (e.g. `tun0`).