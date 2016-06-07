netboot-setup
=============

A (currently hacky) set of scripts to set up a netboot server, e.g. for kernel
development on ARM development boards. It:

- Provides DHCP and TFTP using standard tools (dnsmasq)
- Provides NFS for serving of a root filesystem
- Provides NAT so the devboard can access the internet through the same
  ethernet port used to provide DHCP and TFTP
- Isn't yet documented
