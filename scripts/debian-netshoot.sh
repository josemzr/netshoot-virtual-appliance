#!/bin/bash -eux

##
## Debian 
## Setup Network Troubleshooting Packages
##

echo '> Setup Netshoot Packages...'

# Install Netshoot packages
apt-get -y install apache2-utils bash dnsutils bird bridge-utils curl dhcping ldnsutils ethtool net-tools file fping httpie iftop iperf iproute2 ipset iptables iptraf-ng iputils-arping iputils-clockdiff iputils-ping iputils-tracepath  ipvsadm jq libc6 mtr snmp netcat-openbsd nftables ngrep nmap openssl scapy socat strace tcpdump tcptraceroute tshark util-linux vim sshpass

# Install Kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mv kubectl /usr/local/bin

# Install Termshark
wget https://github.com/gcla/termshark/releases/download/v2.2.0/termshark_2.2.0_linux_x64.tar.gz
tar -xzvf termshark_2.2.0_linux_x64.tar.gz --strip-components=1
rm -rf termshark_2.2.0_linux_x64.tar.gz
chmod +x termshark
mv termshark /usr/local/bin

# Refresh sources
apt-get update

echo '> Done'

