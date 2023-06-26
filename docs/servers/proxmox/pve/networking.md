# PVE Networking

## What is the smallest number of IPs I can use with Proxmox?

The smallest number of IPs we recommend in a typical Proxmox setup is a /29 or 5 usable IPs. Depending on how you plan to setup and configure Proxmox, we recommend a /29 with the following IP justification:

    [x.x.x.x] - Hypervisor management IP
    [x.x.x.x] - Virtual Firewall WAN IP
    [x.x.x.x] - Future use
    [x.x.x.x] - Future use
    [x.x.x.x] - Future use

Alternatively, it is possible to use Proxmox with only a /30 or 1 usable IP. Please note that this setup method does have some limitations. This setup method will require a private VLAN as well as VPN access to manage Proxmox. Please keep in mind that this setup can delay provisioning, so please place it in the order notes. Existing servers can be moved to this setup, but there will be downtime.

When Proxmox is installed, it will instead be configured to use the secondary NIC connected to your private VLAN and then the public IP allocated could be used for either a virtual firewall or reverse proxy server that is bridged with the public interface of the server. In order to manage Proxmox, you will need to utilize VPN access. Also, our private network does not support general Internet access. At this current time, Proxmox updates would not be possible. ISO images would also have to be uploaded either over a VPN or from our internal mirror.

Another alternative is to instead use NAT networking. This allows your VMs to utilize a private network and also use the main Proxmox server NIC for internet access. You would still be able to access Proxmox via the public IP, but to access VMs, you would need to utilize NAT port forwarding. NAT is a little easier to deal with than exclusively using the private network as Proxmox would be able to update over the Internet. You would also need to heavily rely on the Proxmox firewall.

Please contact technical support if you would like to discuss these different scenarios. If you're not a NodeSpace customer, please contact sales@nodespace.net as technical support is reserved for active customers.