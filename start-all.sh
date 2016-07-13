#!/bin/bash

echo "Starting dnsmasq"
sudo systemctl start dnsmasq.service

echo "Starting nfs-kernel-server"
sudo systemctl start nfs-kernel-server.service
