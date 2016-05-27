#!/bin/bash

. ./config

sudo apt-get install dnsmasq
sudo systemctl stop dnsmasq
sudo cp /etc/dnsmasq.conf /etc/dnsmasq.conf-backup

sudo tee /etc/dnsmasq.conf < EOF
interface=$IF_INT
dhcp-range=$DHCP_START,$DHCP_END,72h
EOF

sudo systemctl start dnsmasq

#---
# REF: https://help.ubuntu.com/community/Internet/ConnectionSharing
