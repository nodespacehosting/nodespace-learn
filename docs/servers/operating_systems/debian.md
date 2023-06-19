# Debian

![Debian](../images/oslogos/debian.png){: align=right style="width: 150px; margin: 0 0 10px 10px;" }

Debian is a Linux distribution composed of free and open-source software, developed by the community-supported Debian Project, which was established by Ian Murdock on August 16, 1993. The first version of Debian (0.01) was released on September 15, 1993, and its first stable version (1.1) was released on June 17, 1996. The Debian Stable branch is the most popular edition for personal computers and servers, and is the basis for many other distributions. Debian is one of the oldest operating systems based on the Linux kernel. The project is coordinated over the Internet by a team of volunteers guided by the Debian Project Leader and three foundational documents: the Debian Social Contract, the Debian Constitution, and the Debian Free Software Guidelines. New distributions are updated continually, and the next candidate is released after a time-based freeze.

## What versions of Debian are available?

| Current Version | Supported Until |
| --------------- | --------------- |
| Debian 8        | June 30, 2025   |
| Debian 9        | June 30, 2027   |
| Debian 10       | June 30, 2029   |
| Debian 11       | TBD             |
| Debian 12       | TBD             |

## Using Debian

Debian uses the `apt` package manager to install software and updates. You can install software using the `apt install` command. For example, to install the Apache web server, you would run the following command:

```
apt install apache2
```

!!! note
    You must run the `apt` command as `root` or with `sudo`. Debian does not include `sudo` by default and must be installed.

You can also install multiple packages at once by separating them with a space. For example, to install Apache and PHP, you would run the following command:

```
apt install apache2 php
```

To update your system, you can use the `apt update` command followed by the `apt upgrade` command. For example, to update all packages on your system, you would run the following command:

```
apt update
apt upgrade
```

### Managing Services

Debian uses the `systemctl` command to manage services. To start a service, you would run the following command:

``` 
systemctl start apache2
```

To stop a service, you would run the following command:

```
systemctl stop apache2
```

To restart a service, you would run the following command:

```
systemctl restart apache2
```

To enable a service to start on boot, you would run the following command:

```
systemctl enable apache2
```

To disable a service from starting on boot, you would run the following command:

```
systemctl disable apache2
```

### Managing Users

Debian uses the `adduser` command to manage users. To add a user, you would run the following command:

```
adduser username
```

To delete a user, you would run the following command:

```
deluser username
```

To add a user to a group, you would run the following command:

```
adduser username groupname
```

To remove a user from a group, you would run the following command:

```
deluser username groupname
```

### Managing Firewall

!!! note
    Debian does not include a firewall by default and must be installed.

Debian uses the `ufw` command to manage the firewall. To enable the firewall, you would run the following command:

```
ufw enable
```

To disable the firewall, you would run the following command:

```
ufw disable
```

To allow a port, you would run the following command:

```
ufw allow port
```

To deny a port, you would run the following command:

```
ufw deny port
```

