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

## NAT & Port Forwarding

If you want to use a single IP address on your Proxmox server, or you want to use your Proxmox server's main IP address for other things, you can use NAT and port forwarding. 

### How to set up NAT and port forwarding

To set up NAT and port forwarding, you will need to do the following:

#### 1. Create a new bridge

!!! note
    This step is going to be done through SSH. While setting up a bridge through the Proxmox web interface is possible, the additional configuration we need to do is not available through the web interface.

First, SSH into your Proxmox server as the `root` user. Then, open the `/etc/network/interfaces` file in your favorite text editor. We'll use `nano` for this example:

```bash
nano /etc/network/interfaces
```

Find your main network bridge interface. It will typically be named `vmbr0`. After that block, add a new block for your new bridge. We'll call it `vmbr1` (assuming you don't already have a `vmbr1` interface):

```bash
auto vmbr1
iface vmbr1 inet static
        address 10.10.10.1/24
        bridge-ports none
        bridge-stp off
        bridge-fd 0

```

!!! note
    You can set the IP address to any private IP address range. Avoid "squatting" on IP addresses you don't have the ability to use and avoid using CGNAT ranges.

#### 2. Add NAT rules

After the `bridge-fd 0` line, add the following lines:

```bash
        post-up echo 1 > /proc/sys/net/ipv4/ip_forward
        post-up   iptables -t nat -A POSTROUTING -s '10.10.10.0/24' -o vmbr0 -j MASQUERADE
        post-down iptables -t nat -D POSTROUTING -s '10.10.10.0/24' -o vmbr0 -j MASQUERADE
```
Make sure to replace `10.10.10.0/24` with the IP address and subnet mask you chose for your new bridge.

Here's what these lines do:

- `post-up echo 1 > /proc/sys/net/ipv4/ip_forward` - Enables IP forwarding. This is required for NAT to work.
- `post-up iptables -t nat -A POSTROUTING -s '10.10.10.0/24' -o vmbr0 -j MASQUERADE` - Adds a NAT rule to the `POSTROUTING` chain of the `nat` table. This rule will apply to all traffic from the `10.10.10.0/24` subnet and will masquerade it as the IP address of the `vmbr0` interface.
- `post-down iptables -t nat -D POSTROUTING -s '10.10.10.0/24' -o vmbr0 -j MASQUERADE` - Removes the NAT rule we added above when the interface is brought down.

If you haven't saved the file yet, do so now.

#### 3. Restart networking

At this point, while the rules have been added, they haven't been applied yet. To apply them, we need to restart networking. Run the following command:

```bash
ifreload -a
```
#### 4. Test the new bridge

Create a new VM and assign it a network interface on the bridge you just created. You will need to statically assign an IP address to the VM. Make sure the IP address is in the same subnet as the bridge. The gateway should be the IP address of the bridge. Once the VM is created, start it up and try to ping the gateway. If you can ping the gateway, try to ping an external IP address. If you can ping the external IP address, you're all set! You can run a command like `curl https://icanhazip.com` to verify the IP address you're using is your Proxmox server's main IP address.

#### 5. Set up port forwarding

Now that you have a working bridge, you can set up port forwarding. To do this, you'll need to SSH into your Proxmox server as the `root` user. Then, open the `/etc/network/interfaces` file in your favorite text editor. We'll use `nano` for this example:

```bash
nano /etc/network/interfaces
```

In the block for your NAT bridge, you can add port forwarding rules. Here's an example:

```bash
        post-up   iptables -t nat -A PREROUTING -i vmbr0 -p tcp --dport 80 -j DNAT --to 10.10.10.100:80
        post-down iptables -t nat -D PREROUTING -i vmbr0 -p tcp --dport 80 -j DNAT --to 10.10.10.100:80
```

These rules will port forward all traffic on port 80 to the IP address `10.10.10.100` on port 80. You can add as many rules as you need. Make sure to save the file when you're done.

!!! warning
    If you're going to use multiple services that run on the same port, you will need to use different ports or use a reverse proxy. For example, if you want to run two web servers, you can't forward port 80 to both of them. You can forward port 80 to one of them and port 8080 to the other one. You can then access the second web server by going to `http://your-ip-address:8080`. Or you can use a reverse proxy to forward traffic to the correct server based on the domain name.

!!! tip "Configure NAT Port Forward for Reverse Proxy"
    If you're using a reverse proxy, you can use the following rules to forward all traffic on port 80 and 443 to the reverse proxy:

    ```bash
            post-up   iptables -t nat -A PREROUTING -i vmbr0 -p tcp --dport 80 -j DNAT --to 10.10.10.100:80
            post-down iptables -t nat -D PREROUTING -i vmbr0 -p tcp --dport 80 -j DNAT --to 10.10.10.100:80
            post-up   iptables -t nat -A PREROUTING -i vmbr0 -p tcp --dport 443 -j DNAT --to 10.10.10.100:443
            post-down iptables -t nat -D PREROUTING -i vmbr0 -p tcp --dport 443 -j DNAT --to 10.10.10.100:443
    ```
    Make sure to replace `10.10.10.100` with the IP address of your reverse proxy. To use your reverse proxy, point the subdomain you want to use to your Proxmox server's main IP address. Then, configure your reverse proxy to forward traffic to the correct server based on the domain name.

#### 6. Restart networking

At this point, while the rules have been added, they haven't been applied yet. To apply them, we need to restart networking. Run the following command:

```bash
ifreload -a
```

#### 7. Test the port forwarding

At this point, you should be able to access the service you forwarded the port to. If you forwarded port 80 to a web server, you should be able to access it by going to `http://your-ip-address`. If you forwarded port 443 to a web server, you should be able to access it by going to `https://your-ip-address`. If you forwarded port 2222 to an SSH server, you should be able to SSH into it by running `ssh -p 2222 your-ip-address`. 

!!! note
    Remember that Proxmox has the SSH service listening on port 22. If you want to use port 22 for a different server, you will need to change the port Proxmox's SSH service listens on. You can do this by editing the `/etc/ssh/sshd_config` file and changing the `Port` line. Make sure to restart the SSH service after making the change.


### How to port forward port ranges

If you want to port forward a range of ports, you can use the following commands:

```bash
post-up   iptables -t nat -A PREROUTING -i vmbr0 -p tcp --dport 10000:20000 -j DNAT --to 10.10.10.100
post-down iptables -t nat -D PREROUTING -i vmbr0 -p tcp --dport 10000:20000 -j DNAT --to 10.10.10.100
```

This will forward all traffic on ports 10000 through 20000 to the IP address `10.10.10.100`. Make sure to replace the IP, port range, and protocol with the correct values for your setup.
