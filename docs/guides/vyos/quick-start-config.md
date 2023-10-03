# Quick Start Configuration

## Initial Configuration

!!! warning
    This guide focuses on using VyOS as a NAT router. This is a common configuration for our customers. 

Once VyOS is installed, you will need to configure it. The following steps will walk you through configuring VyOS and getting a basic configuration in place. 

!!! note
    Refer to the [CLI Help](cli-help.md) guide for more information on using the VyOS CLI, including some tips and tricks.

### Accessing the Console

By default, SSH is disabled on VyOS. This means that you will need to access the console to configure VyOS. If you installed VyOS on Proxmox VE, you can access the console from the Proxmox web interface. If you added a serial port to your VM, you can connect to the console over serial by SSHing into Proxmox and running the following command:

```bash
qm terminal <vmid>
```
Replace `<vmid>` with the ID of your VyOS VM. You can find the VM ID in the Proxmox web interface or by running the following command:

```bash
qm list
```

If you don't see the VyOS login prompt, press `Enter` to get to the login prompt. If you need to exit the console and return to the Proxmox shell, press `Ctrl + O`.

!!! note
    The serial console will wrap lines and may cause display issues. If you experience display issues, you can try using the Proxmox web console instead, or enable SSH and connect to the VyOS CLI over SSH.

### Interface Configuration

First you will need to identify the interfaces on your VyOS system. In most cases, you will have two interfaces: `eth0` and `eth1`. `eth0` will be your public interface and `eth1` will be your private interface. If you have more than two interfaces, you will need to identify which interfaces are public and which are private. Sometimes the interfaces will be switched around, so you will need to identify which interface is which.

The easiest way is to check the MAC addresses of the interfaces. You can do this by running the following command in operational mode:

```bash
show interfaces ethernet detail
```
Locate the last 4 characters of each MAC address and compare them to the MAC addresses of the interfaces on your server. Once you have identified the interfaces, you can configure them.

Once you have identified the interfaces, you can enter configuration mode by running the following command:

```bash
configure
```
Now you can configure the interfaces. Since we use static IP addresses, your public interface will be configured statically. Here's how to configure the public interface:

!!! note
    In this guide, we will be using `eth0` as our public interface and `eth1` as our private interface. If your interfaces are different, make sure to replace `eth0` and `eth1` with the correct interface names.

```bash
set interfaces ethernet eth0 address <ip-address>/<cidr>
set interfaces ethernet eth0 description "Public Interface"
```
Replace `<ip-address>` with the IP address you want to use for the interface and replace `<cidr>` with the CIDR of the subnet you want to use for the interface. For example, if you want to use the IP address `100.64.12.23` with a subnet mask of `255.255.255.248`, you would use the following command:

```bash
set interfaces ethernet eth0 address 10.64.12.23/29
```
The description is optional, but it is helpful to have. You can use any description you want. Once you have configured the public interface, you can configure the private interface. Here's how to configure the private interface:

```bash
set interfaces ethernet eth1 address <ip-address>/<cidr>
set interfaces ethernet eth1 description "Private Interface"
```
You can use any RFC1918 address on the private side. 

At this point, you can commit the changes. To do this, run the following command:

```bash
commit
```

!!! note
    When you enter commands into VyOS, they are not applied until you commit them with `commit`. Once you commit the changes, they are applied immediately. 

### Default Gateway

Now we need to configure the default gateway. This is done by configuring a static route on the system. Once the static route is configured, VyOS will be connected to the Internet. 

!!! warning
    If you want to keep VyOS off the Internet until firewall rules are in place, you can put `eth0` in administative down mode. This will prevent the interface from sending or receiving traffic. To do this, run the following command:

    ```bash
    set interfaces ethernet eth0 disable
    ```
    Once you have configured the static route, you can enable `eth0` by running the following command:

    ```bash
    set interfaces ethernet eth0 enable
    ```

To configure the static route, run the following command:

```bash
set protocols static route 0.0.0.0/0 next-hop <gateway-ip-address>
```
Replace `<gateway-ip-address>` with the IP address of your gateway. If you don't know the IP address of your subnet gateway.

Commit the changes by running the following command:

```bash
commit
```

### NAT Configuration

Now we need to configure NAT. This will allow the private network to access the Internet. To configure NAT, run the following commands:

```bash
set nat source rule 100 outbound-interface eth0
set nat source rule 100 source address <private-subnet>
set nat source rule 100 translation address masquerade
```
Replace `<private-subnet>` with the subnet you want to use for your private network. For example, if you want to use the subnet `192.168.1.0/24`, you would use the following command:

```bash
set nat source rule 100 source address 192.168.1.0/24
```

Commit the changes by running the following command:

```bash
commit
```

### DNS Forwarding

!!! note
    This step is optional. If you don't want to use VyOS as a DNS server, you can skip this step.

DNS forwarding is used to forward DNS requests from the private network to a DNS server on the public network. This is useful if you want to use VyOS as a DNS server for your private network. VyOS can also cache requests to help save lookup time as well. To configure DNS forwarding, run the following commands:

```bash
set service dns forwarding cache-size 0
set service dns forwarding listen-address <eth1-ip-address>
set service dns forwarding name-server <dns-server-ip-address>
set service dns forwarding allow-from <private-subnet>
```
Replace `<eth1-ip-address>` with the IP address of `eth1`. Replace `<dns-server-ip-address>` with the IP address of your DNS server. Replace `<private-subnet>` with the subnet you want to use for your private network in CIDR notation.

Commit the changes by running the following command:

```bash
commit
```

### DHCP Server

If you want to use VyOS as a DHCP server, you can configure a DHCP server to listen to requests on `eth1`. To configure a DHCP server, run the following commands:

```bash
set service dhcp-server shared-network-name LAN subnet <private-subnet> default-router <eth1-ip-address>
set service dhcp-server shared-network-name LAN subnet <private-subnet> dns-server <eth1-ip-address>
set service dhcp-server shared-network-name LAN subnet <private-subnet> range 0 start <start-ip-address>
set service dhcp-server shared-network-name LAN subnet <private-subnet> range 0 stop <end-ip-address>
```
Replace `<private-subnet>` with the subnet you want to use for your private network in CIDR notation. Replace `<eth1-ip-address>` with the IP address of `eth1`. Replace `<start-ip-address>` with the first IP address you want to use for DHCP. Replace `<end-ip-address>` with the last IP address you want to use for DHCP.

!!! tip
    You can have multiple DHCP ranges. To add another range, replace `0` with the next number in the sequence. For example, if you want to add a second range, you would use `1` instead of `0`.

    Example:

    ```bash
    set service dhcp-server shared-network-name LAN subnet <private-subnet> range 1 start <start-ip-address>
    set service dhcp-server shared-network-name LAN subnet <private-subnet> range 1 stop <end-ip-address>
    ```
    You can add as many ranges as you need.

Commit the changes by running the following command:
    
```bash
commit
```

### Firewall Rules

!!! note
    The firewall rules in this guide are very basic and are designed to get you up and running. You will likely need to add additional rules to meet your needs.

Now we need to configure the firewall. This will allow us to control what traffic is allowed in and out of the VyOS system. Like all firewalls, these rules are processed in order from top down. Rules are ordered by their ID. The lower the ID, the higher the priority. For example, a rule with an ID of `10` will be processed before a rule with an ID of `20`.

Each interface has three "zones" - `in`, `local`, and `out`. `in` is traffic coming into the interface, `local` is traffic originating to the VyOS system, and `out` is traffic leaving the interface. For example, if you have a device on your private network and it wants to access a system on the internet, the traffic will go `in` `eth1` and `out` `eth0`. If you have a device on your private network and it wants to access the VyOS system, the traffic will go `in` `eth1` and `local` `eth1`. It can be confusing at first, but it makes sense once you get used to it.

!!! tip
    Name your firewall policies so they make sense. E.g. `LAN-IN`, `LAN-OUT`, `LAN-LOCAL`, `WAN-IN`, `WAN-OUT`, `WAN-LOCAL`, etc.

First we need to configure the default policies. Most firewalls typically put these rules in automatically and you cannot edit them. However, since VyOS is technically a router first, it doesn't have any default policies. In the current state of your configuration, all traffic is allowed in and out of your network and this is a security risk. To fix this, we are going to create a proper stateful firewall that blocks all traffic which was not initiated from the LAN side.

```bash
set firewall name WAN-IN default-action drop
set firewall name WAN-IN rule 10 action accept
set firewall name WAN-IN rule 10 state established enable
set firewall name WAN-IN rule 10 state related enable
```
Here's what these commands do:

1. Set the default action to drop. This will drop all traffic that does not match a rule.
2. Create a rule with an ID of `10` that accepts traffic. 
3. Edit rule `10` and enable state tracking for established connections. This will allow traffic that is part of an established connection.
4. Edit rule `10` and enable state tracking for related connections. This will allow traffic that is part of a related connection.

This policy will be applied to anything coming in from the WAN that is not destined for the VyOS system itself. Next, we will create a policy that will be applied to `WAN-LOCAL` and these rules will apply to the VyOS system itself.

```bash
set firewall name WAN-LOCAL default-action drop
set firewall name WAN-LOCAL rule 10 action accept
set firewall name WAN-LOCAL rule 10 state established enable
set firewall name WAN-LOCAL rule 10 state related enable
set firewall name WAN-LOCAL rule 20 action accept
set firewall name WAN-LOCAL rule 20 icmp type-name echo-request
set firewall name WAN-LOCAL rule 20 protocol icmp
set firewall name WAN-LOCAL rule 20 state new enable
```
You can see rule 10 (this is not an overlap as it is part of the `WAN-LOCAL` policy) is exactly the same as the `WAN-IN` policy. This is because we want to allow established and related connections to the VyOS system itself. Rule 20 allows ICMP echo requests. This is useful for troubleshooting. You can add additional rules as needed.

!!! tip
    If you want to disable a rule, you can use the `disable` command. For example, if you want to disable rule `20` on `WAN-LOCAL` which would block pings, you would run the following command:

    ```bash
    set firewall name WAN-LOCAL rule 20 disable
    ```

    Then if you want to enable it again, you would run the following command:

    ```bash
    set firewall name WAN-LOCAL rule 20 enable
    ```

!!! example "Example: Enable SSH from WAN"
    These example rules will allow you to SSH into the VyOS system from the WAN. Keep in mind if you're following this guide step by step, we have not enabled SSH yet so you will not be able to SSH into the VyOS system until you enable SSH.

    ```bash
    set firewall name WAN-LOCAL rule 30 action drop
    set firewall name WAN-LOCAL rule 30 destination port 22
    set firewall name WAN-LOCAL rule 30 protocol tcp
    set firewall name WAN-LOCAL rule 30 recent count 4
    set firewall name WAN-LOCAL rule 30 recent time 60
    set firewall name WAN-LOCAL rule 30 state new enable
    set firewall name WAN-LOCAL rule 31 action accept
    set firewall name WAN-LOCAL rule 31 destination port 22
    set firewall name WAN-LOCAL rule 31 protocol tcp
    set firewall name WAN-LOCAL rule 31 state new enable
    ```
    You might be wondering why we have rule `30` and `31` and why they are in this order. First, rule `30` will rate limit SSH traffic to 4 requests per minute to help block brute force attacks. Rule `31` will actually allow SSH traffic to VyOS.

You'll notice that we're not creating any rules on the LAN side. In this guide, we're not restricting LAN traffic in any way. If there is no firewall policy applied to an interface, then all traffic is allowed. If you want to create a LAN policy, you can use these previous examples as a guide. Just keep in mind you will need to add a `default-action drop` to the policy, otherwise all traffic will be allowed even if you have rules that block traffic. Traffic that does not match a rule will follow the default action.

Once you create a firewall policy, it's a good idea to commit the changes so you don't lose them. 

Now you can apply the policy to the interface.

!!! note
    These commands have changed from VyOS 1.3 to VyOS 1.4 and later.

=== "VyOS 1.3"
    ```bash
    set interfaces ethernet eth0 firewall in name WAN-IN
    set interfaces ethernet eth0 firewall local name WAN-LOCAL
    ```

=== "VyOS 1.4 and later"
    ```bash
    set firewall interface eth0 in name WAN-IN
    set firewall interface eth0 local name WAN-LOCAL
    ```

Once the policy is applied, you can commit the changes.

### Saving the Configuration

Now that you have configured VyOS, you need to save the configuration. To do this, run the following command:

```bash
save
```
Now you can type `exit` to exit configuration mode and return to operational mode. If you want to see your configuration, you can run the following command:

```bash
show configuration
```

You will see a lot of extra configuration that you didn't add. This is because VyOS will set a lot of defaults for you. If you want to change any of those defaults, you can enter configuration mode and then edit the configuration. For example, if you want to change the hostname, you can run the following commands:

```bash
configure
set system host-name <hostname>
commit
save
exit
```

!!! note
    VyOS will automatically redact sensitive details like passwords and keys.

!!! tip
    If you want to see the configuration as commands that you can copy and paste to another VyOS system, you can run the following command:

    ```bash
    show configuration commands
    ```
    This command will show passwords and keys in plain text, so be careful when using it.

### Enabling SSH

SSH is disabled by default on VyOS. To enable SSH, run the following commands:

```bash
configure
set service ssh port 22
commit
save
exit
```
You can make SSH more secure by changing the port and/or using SSH keys instead of passwords. If you want to change the port, replace `22` with the port you want to use. 

## Next Steps

At this point, you should have a working VyOS system. You can now configure your private network devices to use VyOS as their default gateway. You can also configure port forwarding to allow access to services on your private network from the Internet.

!!! note
    This guide was designed to get you up and running quickly. You will likely need to make additional changes to meet your needs. For example, you may need to add additional firewall rules, configure NAT port forwarding, configure a VPN, etc. For help with these tasks, refer to the [VyOS documentation](https://docs.vyos.io/en/latest/), check the [NodeSpace Knowledge Base](https://help.nodespace.com), or ask on the [VyOS forums](https://forum.vyos.io/).

## Additional Resources

- [VyOS Documentation](https://docs.vyos.io/en/latest/)
- [VyOS Forums](https://forum.vyos.io/)

