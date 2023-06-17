# AlmaLinux 

![AlmaLinux](../images/oslogos/almalinux.png){ align=right style="width: 150px; margin: 0 0 10px 10px;" }

AlmaLinux is a community-driven, 1:1 binary compatible fork of Red Hat Enterprise Linux (RHEL)® 8. It is a free and open-source Linux distribution built from the source code of Red Hat Enterprise Linux (RHEL). AlmaLinux is designed to be a drop-in replacement for RHEL and is built by the creators of the established CloudLinux OS.

## What versions of AlmaLinux are available?

NodeSpace offers both AlmaLinux 8 and AlmaLinux 9. We recommend using AlmaLinux 8 for production servers as it will be supported until 2029. AlmaLinux 9 is also a stable build, but RHEL 9 introduced some major breaking changes (see below) that may cause issues with some applications and hardware.

AlmaLinux tracks the Red Hat Enterprise Linux [life cycle](https://access.redhat.com/support/policy/updates/realtime). 

| Current Version | Supported Until    | 
| --------------- | ------------------ |
| AlmaLinux 8.8   | May 31, 2029       |
| AlmaLinux 9.2   | May 31, 2032       |

## Using AlmaLinux

AlmaLinux is designed to be a drop-in replacement for RHEL. If you are familiar with RHEL, you should have no trouble using AlmaLinux. If you are not familiar with RHEL, this guide will help you get started with some of the basics.

### Installing Software & Updates

AlmaLinux uses the `dnf` package manager to install software and updates. You can install software using the `dnf install` command. For example, to install the Apache web server, you would run the following command:

```
dnf install httpd
```

You can also install multiple packages at once by separating them with a space. For example, to install Apache and PHP, you would run the following command:

```
dnf install httpd php
```

To update your system, you can use the `dnf update` command. For example, to update all packages on your system, you would run the following command:

```
dnf update
```

### Managing Services

AlmaLinux uses `systemd` to manage services. You can start, stop, restart, and check the status of services using the `systemctl` command. For example, to start the Apache web server, you would run the following command:

```
systemctl start httpd
```

!!! note
    You must run the `systemctl` command as `root` or with `sudo`.

!!! note
    The `systemctl` command does not provide any output if the command is successful. If the command fails, it will provide an error message.

!!! note
    Service names may vary based on the distribution. For example, the Apache web server is named `httpd` on AlmaLinux, but it is named `apache2` on Ubuntu.

To stop the Apache web server, you would run the following command:

```
systemctl stop httpd
```

To restart the Apache web server, you would run the following command:

```
systemctl restart httpd
```

To check the status of the Apache web server, you would run the following command:

```
systemctl status httpd
```

### Firewall

!!! info
    AlmaLinux installed from our automatic installer will have the firewall disabled by default. If you installed AlmaLinux from an ISO, the firewall will be enabled by default.

AlmaLinux uses `firewalld` to manage the firewall. You can open ports using the `firewall-cmd` command. For example, to open port 80, you would run the following command:

```
firewall-cmd --add-port=80/tcp --permanent
```

To open port 443, you would run the following command:

```
firewall-cmd --add-port=443/tcp --permanent
```

To reload the firewall, you would run the following command:

```
firewall-cmd --reload
```

### SELinux

!!! info
    AlmaLinux installed from our automatic installer will have SELinux disabled by default. If you installed AlmaLinux from an ISO, SELinux will be enabled by default.

AlmaLinux uses SELinux to provide an additional layer of security. SELinux is enabled by default. You can check the status of SELinux using the `sestatus` command. For example, to check the status of SELinux, you would run the following command:

```
sestatus
```

To disable SELinux, you would run the following command:

```
setenforce 0
```

To enable SELinux, you would run the following command:

```
setenforce 1
```

To permanently disable SELinux, you would edit the `/etc/selinux/config` file and set `SELINUX=disabled`. To permanently enable SELinux, you would edit the `/etc/selinux/config` file and set `SELINUX=enforcing`.

!!! warning
    In AlmaLinux 9, SELinux is enabled by default and cannot be completely disabled without setting a kernel parameter. If you need to completely disable SELinux, you can run the following command:

    ```
    grubby --update-kernel=ALL --args="selinux=0"
    ```

    You will need to reboot your server for the changes to take effect. If you need to re-enable SELinux, you can run the following command:

    ```
    grubby --update-kernel=ALL --remove-args selinux
    ```
    And then you need to re-label the filesystem:

    ```
    fixfiles -F onboot
    ```

### Networking

AlmaLinux uses `NetworkManager` to manage the network. You can configure the network using the `nmcli` command. For example, to list the available network connections, you would run the following command:

```
nmcli connection show
```

To configure a static IP address, you would run the following command:

```
nmcli connection modify eth0 ipv4.addresses
nmcli connection modify eth0 ipv4.gateway
nmcli connection modify eth0 ipv4.dns
```
!!! info
    You will need to replace `eth0` with the name of your network interface. You can find the name of your network interface by running the `nmcli connection show` command. The name of your network interface will be listed under the `DEVICE` column.

    If your server was installed from our automatic installer, your IP address is already configured. If you installed AlmaLinux from an ISO, you will need to configure your IP address.

If you want to switch your system from NetworkManager to the legacy network scripts, you can run the following commands:

```
dnf install network-scripts
systemctl enable network
```

Next, you will need t oedit the `/etc/sysconfig/network-scripts/ifcfg-eth0` file and set `NM_CONTROLLED=no`. Remember to replace `eth0` with the name of your network interface.

Finally, you will need to stop and disable the NetworkManager service and restart the network service:

```
systemctl stop NetworkManager
systemctl disable NetworkManager
systemctl restart network
```
