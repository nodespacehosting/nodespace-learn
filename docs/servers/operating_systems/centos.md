# CentOS

![CentOS Logo](../images/oslogos/centos.png){: align=right style="width: 150px; margin: 0 0 10px 10px;" }

CentOS is a Linux distribution that provides a free, community-supported computing platform functionally compatible with its upstream source, Red Hat Enterprise Linux (RHEL). In January 2014, CentOS announced the official joining with Red Hat while staying independent from RHEL, under a new CentOS governing board. In December 2020, Red Hat announced that CentOS 8 would be discontinued at the end of 2021, with CentOS 7 being discontinued at the end of 2024. 

!!! warning "CentOS 8 Discontinued"
    CentOS 8 was discontinued on December 31, 2021. We recommend using [AlmaLinux 8](almalinux.md) instead.

## What versions of CentOS are available?

| Current Version | Supported Until    |
| --------------- | ------------------ |
| CentOS 7.9      | June 30, 2024      |
| CentOS Stream 8 | May 31, 2024       |
| CentOS Stream 9 | May 31, 2027       |

!!! note "CentOS Stream"
    CentOS Stream is a rolling-release Linux distribution that tracks just ahead of Red Hat Enterprise Linux (RHEL) development, positioned as a midstream between Fedora Linux and RHEL. For more information, see the [CentOS Stream FAQ](https://www.centos.org/centos-stream/).

!!! warning "Warning: CentOS 7 Approaching End of Life"
    CentOS 7 will be discontinued on June 30, 2024. We recommend using [AlmaLinux 8](almalinux.md) instead. While CentOS 7 will continue to receive updates until June 30, 2024, it will not receive any security updates. CentOS 7 can still be installed, but we recommend using AlmaLinux 8 instead.

## Using CentOS

CentOS is designed to be a drop-in replacement for RHEL. If you are familiar with RHEL, you should have no trouble using CentOS. If you are not familiar with RHEL, this guide will help you get started with some of the basics.

### Installing Software & Updates

CentOS uses the `yum` package manager to install software and updates. You can install software using the `yum install` command. For example, to install the Apache web server, you would run the following command:

```
yum install httpd
```

!!! note
    You must run the `yum` command as `root` or with `sudo`.

!!! note 
    CentOS 7 uses `yum` for package management. CentOS 8 uses `dnf` for package management. `dnf` is a fork of `yum` and is backwards compatible with `yum`. You can use `yum` on CentOS 8, but you will see a warning message. You can safely ignore this warning message.

You can also install multiple packages at once by separating them with a space. For example, to install Apache and PHP, you would run the following command:

```
yum install httpd php
```

To update your system, you can use the `yum update` command. For example, to update all packages on your system, you would run the following command:

```
yum update
```

### Managing Services

CentOS uses the `systemctl` command to manage services. To start a service, you would run the following command:

```
systemctl start httpd
```

!!! note
    You must run the `systemctl` command as `root` or with `sudo`.

!!! note
    The `systemctl` command does not provide any output if the command is successful. If the command fails, it will provide an error message.

!!! note
    Service names may vary based on the distribution. For example, the Apache web server is named `httpd` on CentOS, but it is named `apache2` on Ubuntu.

To stop a service, you would run the following command:

```
systemctl stop httpd
```

To restart a service, you would run the following command:

```
systemctl restart httpd
```

To enable a service to start automatically when the system boots, you would run the following command:

```
systemctl enable httpd
```

To disable a service from starting automatically when the system boots, you would run the following command:

```
systemctl disable httpd
```

### Firewall

!!! info
    CentOS installed from our automatic installer will have the firewall disabled by default. If you installed AlmaLinux from an ISO, the firewall will be enabled by default.

CentOS uses the `firewalld` firewall by default. To open a port in the firewall, you would run the following command:

```
firewall-cmd --add-port=80/tcp --permanent
```

To reload the firewall, you would run the following command:

```
firewall-cmd --reload
```

### SELinux

!!! info
    AlmaLinux installed from our automatic installer will have SELinux disabled by default. If you installed AlmaLinux from an ISO, SELinux will be enabled by default.

CentOS uses SELinux to provide an additional layer of security. SELinux is enabled by default. If you need to disable SELinux, you can do so by editing the `/etc/selinux/config` file and setting `SELINUX=disabled`. You will need to reboot your server for the changes to take effect.

## CentOS Resources

* [CentOS Website](https://www.centos.org/)
* [CentOS Wiki](https://wiki.centos.org/)
* [CentOS Documentation](https://docs.centos.org/)
* [CentOS FAQ](https://www.centos.org/faq/)
* [CentOS Forums](https://forums.centos.org/)
* [CentOS IRC](https://www.centos.org/irc/)
* [CentOS Mailing Lists](https://lists.centos.org/)

## CentOS Alternatives

* [AlmaLinux](almalinux.md)
* [Debian](debian.md)
* [Fedora](fedora.md)
* [Rocky Linux](rockylinux.md)
* [Ubuntu](ubuntu.md)

