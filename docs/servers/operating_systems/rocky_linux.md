# Rocky Linux

![Rocky Linux](../images/oslogos/rocky.png){: align=right style="width: 150px; margin: 0 0 10px 10px;" }

Rocky Linux is a community enterprise operating system designed to be 100% bug-for-bug compatible with Red Hat Enterprise Linux (RHEL). It is under intensive development by the community. Rocky Linux is led by Gregory Kurtzer, founder of the CentOS project. 

## What versions of Rocky Linux are available?

| Current Version | Supported Until    | 
| --------------- | ------------------ |
| Rocky Linux 8.9   | May 31, 2029       |
| Rocky Linux 9.3   | May 31, 2032       |

## Using Rocky Linux

Rocky Linux is designed to be a drop-in replacement for RHEL. If you are familiar with RHEL, you should have no trouble using Rocky Linux. If you are not familiar with RHEL, this guide will help you get started with some of the basics.

### Installing Software & Updates

Rocky Linux uses the `dnf` package manager to install software and updates. You can install software using the `dnf install` command. For example, to install the Apache web server, you would run the following command:

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

Rocky Linux uses `systemd` to manage services. You can start, stop, restart, and check the status of services using the `systemctl` command. For example, to start the Apache web server, you would run the following command:

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

Rocky Linux uses `firewalld` to manage the firewall. You can open ports using the `firewall-cmd` command. For example, to open port 80, you would run the following command:

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
    Rocky Linux installed from our automatic installer will have SELinux disabled by default. If you installed Rocky Linux from an ISO, SELinux will be enabled by default.

Rocky Linux uses SELinux to provide an additional layer of security. SELinux is enabled by default. You can check the status of SELinux using the `sestatus` command. For example, to check the status of SELinux, you would run the following command:

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
    In Rocky Linux 9, SELinux is enabled by default and cannot be completely disabled without setting a kernel parameter. If you need to completely disable SELinux, you can run the following command:

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