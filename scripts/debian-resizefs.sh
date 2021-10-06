#!/bin/bash -eux

##
## Debian 
## Setup ResizeFS script
##

echo '> Setup ResizeFS boot script...'

chmod +x /opt/debian-resizefs.sh
echo "@reboot root  /opt/debian-resizefs.sh" >> /etc/crontab
