#!/bin/bash

. ./config

#echo "Installing tftp-hpa"
#sudo apt-get install tftpd-hpa

echo "Installing NFS server"
sudo apt-get -y install nfs-kernel-server

echo "Configuring NFS server"
echo "Creating rootfs share dir"
sudo mkdir -p /srv/rootfs

sudo tee -a /etc/exports << EOF
/srv/rootfs  $SN_INT(rw,no_root_squash,no_subtree_check)
EOF

sudo systemctl start 
