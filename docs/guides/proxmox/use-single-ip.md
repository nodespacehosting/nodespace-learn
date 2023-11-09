# Using a single IP with Proxmox VE Node

If your Proxmox server is issued only a single IP, either from a /30 subnet or a /32 from a larger subnet, you may be wondering how to setup and use virtual machines on the host.

**Pros:**
- Easy to setup.
- Not complicated; easy to troubleshoot.
- Single NAT.

**Cons:**
- Not very flexible.
- No default DHCP.
- Relies on Proxmox firewall & NAT.
- Requires iptables for NAT port forwarding.

To set this up, edit /etc/network/interfaces and add the following:

    auto vmbr1
    iface vmbr1 inet static
        address 10.10.10.1/24
        bridge_ports none
        bridge_stp off
        bridge_fd 0
        post-up   echo 1 > /proc/sys/net/ipv4/ip_forward
        post-up   iptables -t nat -A POSTROUTING -s '10.10.10.0/24' -o vmbr0 -j MASQUERADE
        post-down iptables -t nat -D POSTROUTING -s '10.10.10.0/24' -o vmbr0 -j MASQUERADE

Adjust the address to fit your needs. This assumes that vmbr0 is your public interface and has an IP assigned to it. Once you add this to your interfaces file, you will need to restart networking to apply the settings. You can run this command: ifreload -a (if you have ifupdown2 installed) or go into the Proxmox web interface > select your node > select network > edit the bridge interface you created in the terminal and add a note. Then click on the apply button which will restart networking.

In a virtual machine, adjust the network interface to use the bridge you created (in this example, vmbr1) and then assign a static IP from within the guest. The default gateway should be the bridge's IP address (in this example, 10.10.10.1). Once you apply those settings, you should be able to access the Internet from that guest. Try pinging 1.1.1.1 or google.com if you want to check DNS settings.

In order to port forward to any VMs on this private network, you will need to add the following to your vmbr1 config:

    post-up   iptables -t nat -A PREROUTING -i vmbr0 -p tcp --dport 80 -j DNAT --to 10.10.10.5:80
    post-down iptables -t nat -D PREROUTING -i vmbr0 -p tcp --dport 80 -j DNAT --to 10.10.10.5:80

Adjust the iptables rules as necessary and restart networking. Remember, since you are port forwarding, you can only have 1 port open on your Proxmox host's IP. This is where it would be beneficial to use a reverse proxy to handle multiple web servers.

To access your servers remotely, we would recommend using a jump box such as Guacamole instead of directly port forwarding RDP or SSH ports.