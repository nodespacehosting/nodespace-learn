# Private Networking

NodeSpace offers private networking on most of our dedicated and virtual servers. Private networking allows you to create a private network between your servers. This private network is isolated from the public internet and is only accessible from your servers. You are given a VLAN with a private IP address subnet that additional servers can be added to.

!!! note
    IPv6 is not available on private networks currently.

## Backend Services

NodeSpace offers a number of backend services that are available on private networks. For example, we offer DNS, NTP, Windows Update, Linux update mirrors, and more.

These services are available on the following IPs and domains:

| Service | IP Address | Domain |
| ------- | ---------- | ------ |
| DNS     | 10.200.15.200   | intlnrdns1.service.nodespace.com    |
| DNS 2   | 10.200.16.200   | intlnrdns2.service.nodespace.com    |
| NTP     | 10.200.15.200 10.200.16.200   | time.service.nodespace.com |
| Windows Update | 10.X.X.X | windowsupdate.service.nodespace.com |
| AlmaLinux Update | 10.X.X.X | almalinux.service.nodespace.com |
| Ubuntu Update | 10.X.X.X | ubuntu.service.nodespace.com |
| CentOS Update | 10.X.X.X | centos.service.nodespace.com |
| Debian Update | 10.X.X.X | debian.service.nodespace.com |
| Rocky Linux Update | 10.X.X.X | rocky.service.nodespace.com |
| Fedora Update | 10.X.X.X | fedora.service.nodespace.com |
| OpenSUSE Update | 10.X.X.X | opensuse.service.nodespace.com |
| EPEL | 10.X.X.X | epel.service.nodespace.com |

!!! note
    Some services may not be available in all data center locations.

### How to connect to backend services

In order to connect to our backend services, you will need to configure your server to use the private network DNS servers. You will also need to configure your server's private network connection. Obtain the private network IP address from support and configure your server's private network interface with the IP address and netmask provided. **Do not configure a gateway on the private network interface.** You will need to configure a static route to the private network gateway IP address. The private network gateway IP address will be provided by support.

Configuring a static route will vary depending on your operating system. Below are some examples:

=== "RHEL"
    Edit `/etc/sysconfig/network-scripts/route-ethX` and add the following:

    ```bash
    ADDRESS0=10.0.0.0
    GATEWAY0=<private network gateway IP address>
    NETMASK0=255.0.0.0 
    ```
    Replace `<private network gateway IP address>` with the private network gateway IP address provided by support. Replace `ethX` with the name of your private network interface. Keep in mind that it may not be `ethX` and may be something like `ensX` or `enpXsX`.

=== "Ubuntu"
    Edit `/etc/netplan/01-netcfg.yaml` and add the following:

    ```yaml
    network:
      version: 2
      ethernets:
        ethX:
          routes:
            - to: 10.0.0.0/8
              via: <private network gateway IP address>
    ```
    Replace `<private network gateway IP address>` with the private network gateway IP address provided by support. Replace `ethX` with the name of your private network interface. Keep in mind that it may not be `ethX` and may be something like `ensX` or `enpXsX`.

    Apply the changes with `netplan apply`.

=== "Debian"
    Edit `/etc/network/interfaces` and add the following to the private network interface:

    ```bash
    up ip route del 10.0.0.0/8 via <private gateway> 
    up ip route add 10.0.0.0/8 via <private gateway> 
    ```
    A complete example would look like this:

    ```bash
    auto ethX
    iface ethX inet static
        address <private network IP address>
        netmask 255.255.255.248
        up ip route del 10.0.0.0/8 via <private gateway>
        up ip route add 10.0.0.0/8 via <private gateway>
    ```
    Replace `<private network gateway IP address>` with the private network gateway IP address provided by support. Replace `ethX` with the name of your private network interface. Keep in mind that it may not be `ethX` and may be something like `ensX` or `enpXsX`.

    Restart networking with `systemctl restart networking`.

=== "Windows"
    Open a command prompt as administrator and run the following:

    ```powershell
    route -p add 10.0.0.0 MASK 255.0.0.0 <private network gateway IP address>
    ```
    Replace `<private network gateway IP address>` with the private network gateway IP address provided by support.

    !!! note
        The `-p` flag is required to make the route persistent across reboots. If you do not use the `-p` flag, the route will be lost after a reboot.

You can verify that the route is configured correctly by attempting to ping one of the backend services. For example, you can ping one of the DNS servers. Once the route is configured correctly, remove any existing DNS servers from your server's configuration and add the private network DNS servers. If you do not remove the existing DNS servers, your server will attempt to use them first and will not be able to resolve the backend services.


## Private IP Addresses

By default, clients are issued a /29 subnet with 5 usable IP addresses. If you need additional IP addresses or a larger subnet, one can be issued upon request.
