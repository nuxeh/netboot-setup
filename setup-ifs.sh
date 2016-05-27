#!/bin/bash

. ./config

echo "Assigning IP ($IP_INT) to $IF_INT (internal interface)"
sudo ip addr add "$IP_INT" dev "$IF_INT"

echo "Setting up routing and NAT"
sudo iptables -A FORWARD -o $IF_EXT -i $IF_INT -s $SN_INT -m conntrack --ctstate NEW -j ACCEPT
sudo iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -t nat -F POSTROUTING
sudo iptables -t nat -A POSTROUTING -o $IF_EXT -j MASQUERADE

echo "Enabling IP forwarding"
sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
sed -i 's/^#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf

echo "Done."

#---
# REF: https://help.ubuntu.com/community/Internet/ConnectionSharing
