#!/bin/bash

THISIP=192.168.1.76

echo "Stopping services"
sudo systemctl stop tftpd-hpa.service

sudo apt-get -y install tftp tftpd-hpa

echo "Starting services"
if ! sudo systemctl start tftpd-hpa.service; then
	echo "tftpd-hpa failed to start"
	exit 1
fi

# Seperate tests/features
echo "Testing tftpd-hpa"
TS=`date | sed 's/ /-/g;s/:/-/g'`
sudo touch /srv/tftp/test-$TS

tftp $THISIP <<EOF
get test-$TS
quit
EOF

if [ -f test-$TS ]; then
	echo "Test succeeded"
	ec=0
else
	echo "Test failed"
	ec=1
fi

echo "Cleaning up"
rm test-$TS
sudo rm /srv/tftp/test-$TS

exit $ec
