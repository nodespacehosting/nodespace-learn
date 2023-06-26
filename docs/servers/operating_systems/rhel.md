# Red Hat Enterprise Linux (RHEL)

![Red Hat Enterprise Linux](../images/oslogos/redhat.png){ align=right style="width: 150px; margin: 0 0 10px 10px;" }

Red Hat Enterprise Linux (RHEL) is a Linux distribution developed by Red Hat and targeted toward the commercial market. Red Hat Enterprise Linux is released in server versions for x86-64, Power ISA, ARM64, and IBM Z, and a desktop version for x86-64. All of the Red Hat's official support and training, together with the Red Hat Certification Program, focuses on the Red Hat Enterprise Linux platform. Red Hat Enterprise Linux is often abbreviated to RHEL, although this is not an official designation.

## What versions of RHEL are available?

| Current Version | Supported Until    |
| --------------- | ------------------ |
| RHEL 7          | June 30, 2024      |
| RHEL 8          | May 31, 2029       |
| RHEL 9          | May 31, 2032       |

## Using RHEL

If you are familiar with CentOS, you should have no trouble using RHEL. If you are not familiar with CentOS, this guide will help you get started with some of the basics.

### Installing Software & Updates

!!! note "yum and dnf"
    RHEL 7 uses the `yum` package manager, while RHEL 8 and 9 use the `dnf` package manager. However, `yum` is still available on RHEL 8 and 9 for backwards compatibility but is deprecated and will probably be removed in a future release.

RHEL uses the `yum` package manager to install software and updates. You can install software using the `yum install` command. For example, to install the Apache web server, you would run the following command:

```
yum install httpd
```

You can also install multiple packages at once by separating them with a space. For example, to install Apache and PHP, you would run the following command:

```
yum install httpd php
```

To update your system, you can use the `yum update` command. For example, to update all packages on your system, you would run the following command:

```
yum update
```

### Managing Services

RHEL uses `systemd` to manage services. You can start, stop, restart, and check the status of services using the `systemctl` command. For example, to start the Apache web server, you would run the following command:

```
systemctl start httpd
```

!!! note
    You must run the `systemctl` command as `root` or with `sudo`.

!!! note
    The `systemctl` command does not provide any output if the command is successful. If the command fails, it will provide an error message.

!!! note
    Service names may vary based on the distribution. For example, the Apache web server is named `httpd` on RHEL, but it is named `apache2` on Ubuntu.

To stop the Apache web server, you would run the following command:

```
systemctl stop httpd
```

To restart the Apache web server, you would run the following command:

```
systemctl restart httpd
```


## How to register subscription

NodeSpace offers RHEL as part of the "BYOL" (Bring Your Own License) program. To register your new RHEL system and attach it to your subscription, run the following command:

```
subscription-manager register
```

Provide your Red Hat login and the system will let you know when it is successfully registered.

## Unable to run yum update

If you are unable to run `yum update` and receive the following error:

```
[root@rhel-test ~]# yum update
Loaded plugins: product-id, search-disabled-repos, subscription-manager

This system is not registered with an entitlement server. You can use subscription-manager to register.

There are no enabled repos.
 Run "yum repolist all" to see the repos you have.
 To enable Red Hat Subscription Management repositories:
     subscription-manager repos --enable <repo>
 To enable custom repositories:
     yum-config-manager --enable <repo>
```

You will need to register your system with Red Hat. See the section above for instructions on how to register your system.

## How to version lock a package

- Lock a package to a specific version only, and no later
- Exclude a package from `yum update`
- What is `yum versionlock`?

Install the appropriate package based on your version of RHEL:

For RHEL 6 and 7:
```
yum install yum-plugin-versionlock
```

For RHEL 8 and 9:
```
dnf install python3-dnf-plugin-versionlock
```

The `/etc/yum/pluginconf.d/versionlock.list` will be created on the system.

To lock a package to a specific version, run the following command:

```
yum versionlock <package>
```

For example, to lock the `httpd` package to version `2.4.6-97.el7`, you would run the following command:

```
yum versionlock httpd-2.4.6-97.el7
```

The plugin stores a package list in `/etc/yum/pluginconf.d/versionlock.list`, which you can edit directly. `yum` or `dnf` will normally attempt to update all packages, but the plugin will exclude the packages listed in the versionlock.list file.

The above configuration will not allow yum update or yum upgrade to update any of the `httpd` packages to version greater than what was installed at the time the locking was performed.

See the `yum-versionlock(1)` for a list of all available commands.

To remove a package from the version lock list, run the following command:

```
yum versionlock delete <package>
```

Or to remove all packages from the version lock list, run the following command:

```
yum versionlock clear
```


 