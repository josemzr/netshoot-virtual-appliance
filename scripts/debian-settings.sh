#!/bin/bash -eux

##
## Debian Settings
## Misc configuration
##

echo '> Debian Settings...'

echo '> SSH directory'
mkdir -vp $HOME/.ssh

echo '> Adding vimrc'
echo "set mouse-=a" >> /root/.vimrc

echo '> Debian acts as a Router now'
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf

echo '> Disable IPv6'
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf

echo '> Setup Appliance Banner for /etc/issue & /etc/issue.net'
echo "=============================" | tee /etc/issue /etc/issue.net > /dev/null
echo " Netshoot Virtual Appliance" | tee -a /etc/issue /etc/issue.net > /dev/null
echo "=============================" | tee -a /etc/issue /etc/issue.net > /dev/null
sed -i 's/#Banner none/Banner \/etc\/issue.net/g' /etc/ssh/sshd_config


echo '> Setup Netshoot hostname and adding it to /etc/hosts'
hostnamectl set-hostname netshoot
sed -i s/debian/netshoot/g /etc/hosts

sed -i 's/#Banner none/Banner \/etc\/issue.net/g' /etc/ssh/sshd_config

echo '> Run debian-setup script at boot'
echo "@reboot root  if [ ! -f /etc/ran_customization ]; then /opt/debian-setup.sh &> /var/log/debian-customization.log; fi" >> /etc/crontab

echo '> Done'
