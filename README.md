# Netshoot Virtual Appliance


This is a template to have the [Netshoot project](https://github.com/nicolaka/netshoot) by Nicolaka in an OVA format. It is very useful for those situations when you require a light and fast to deploy VM to troubleshoot a faulty network VM or container environment, but don't want to install a full VM.

The OVA is based around Debian GNU/Linux Buster and can be built using [Packer](https://www.packer.io). The Packer template is based around the Debian template developed by [Timo Sugliani](https://github.com/tsugliani/packer-vsphere-debian-appliances). 

The following Packer templates will build an OVA using a VMware vSphere ESXi host (although it is easily modifiable to build from VMware Workstation or Fusion) from a Debian Buster minimal image. After the creation, the VM will be customizable using OVF parameters, so network and root password will be assignable during deployment. If no network is configured during deployment, it will use DHCP.


---

**Requirements**

- A Linux or Mac environment (to be able to run the shell-local provisioner)
- A VMware ESXi host to use as builder prepared for Packer using [this guide](https://nickcharlton.net/posts/using-packer-esxi-6.html)
    - Note: if you are using a ESXi 7.x as a builder, switch to the esxi-70 branch, as it is configured to use [VNC over websockets]
- A DHCP-enabled network.
- [Packer 1.6.6](https://www.packer.io/downloads)
- [OVFTool](https://www.vmware.com/support/developer/ovf/) installed and configured in your PATH.

---

**Building**

To build this template, you will need to edit the netshoot-builder.json file with your ESXi values:


```
{
  "builder_host": "packerbuild.sclab.local",
  "builder_host_username": "root",
  "builder_host_password": "VMware1!",
  "builder_host_datastore": "datastore1",
  "builder_host_portgroup": "VM Network"
}
```


Then run the build-netshoot.sh script or execute the following commands:

```
rm -rf output-netshoot/*

packer build \
    --var-file="netshoot-builder.json" \
    --var-file="netshoot-1.0.json" \
    netshoot.json
```

---

**Try it out**

Pre-built releases are uploaded in [GitHub releases](https://github.com/josemzr/netshoot-virtual-appliance/releases)

---


**Included Packages:**

The following packages are included in Netshoot Virtual Appliance:

```
apache2-utils
bash
dnsutils
bird
bridge-utils
curl
dhcping
docker
kubectl
ldnsutils
ethtool
net-tools
file
fping
httpie
iftop
iperf
iproute2
ipset
iptables
iptraf-ng
iputils-arping
iputils-clockdiff
iputils-ping
iputils-tracepath
ipvsadm
jq
libc6
mtr
snmp
netcat-openbsd
nftables
ngrep
nmap
openssl
scapy
socat
strace
tcpdump
tcptraceroute
tshark
termshark
util-linux
vim
sshpass
```

---

**Acknowledgements**


This project is possible because of the great work done in the [packer-vsphere-debian-appliances](https://github.com/tsugliani/packer-vsphere-debian-appliances) project and the amazing [Netshoot](https://github.com/nicolaka/netshoot) by Nicolaka. Also, Robert Guske contributed to the previous project, Netshoot-OVA.
