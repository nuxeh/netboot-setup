#!/bin/bash

. ./config

cat << EOF
setenv serverip 10.0.0.1
setenv nfsroot /srv/rootfs/arm64-rootfs
setenv bootargs mem=2048M consoleblank=0 console=ttySC0,115200 rw root=/dev/nfs ip=dhcp nfsroot=\${serverip}:\${nfsroot},v3,tcp rootwait relative_sleep_states=1 cma=384MB video=HDMI-A-1:1920x1080 video=HDMI-A-2:1920x1080
setenv tftpboot dhcp; tftp 0x48080000 Image; tftp 0x48000000 r8a7795-salvator-x.dtb; bootm 0x48080000 - 0x48000000
setenv bootcmd run tftpboot
EOF
