# OpenSUSE

![OpenSUSE](../images/oslogos/opensuse.png){: align=right style="width: 150px; margin: 0 0 10px 10px;" }

openSUSE is a Linux distribution sponsored by SUSE Software Solutions Germany GmbH and other companies. It is widely used throughout the world. The focus of its development is creating usable open-source tools for software developers and system administrators, while providing a user-friendly desktop and feature-rich server environment.

## What versions of openSUSE are available?

| Current Version | Supported Until |
| --------------- | --------------- |
| openSUSE Leap 15.3 | November 30, 2022 |
| openSUSE Leap 15.2 | November 30, 2021 |
| openSUSE Tumbledweed | Rolling Release |

## Using openSUSE

openSUSE uses the `zypper` package manager to install software and updates. You can install software using the `zypper install` command. For example, to install the Apache web server, you would run the following command:

```
zypper install apache2
```

!!! note
    You must run the `zypper` command as `root` or with `sudo`.

You can also install multiple packages at once by separating them with a space. For example, to install Apache and PHP, you would run the following command:

```
zypper install apache2 php7
```

To update your system, you can use the `zypper update` command. For example, to update all packages on your system, you would run the following command:

```
zypper update
```

### Managing Services

openSUSE uses the `systemctl` command to manage services. To start a service, you would run the following command:

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

## Additional Information

### openSUSE Leap vs Tumbleweed

openSUSE Leap is a regular-release version of openSUSE containing well-tested packages that are integrated into the system. It is a stable release that is updated with maintenance updates and security fixes throughout its lifetime.

openSUSE Tumbleweed is a rolling-release version of openSUSE containing the latest packages that are not yet integrated into the system. It is a development release that is updated with the latest packages as they are released.

### openSUSE vs SUSE Linux Enterprise

openSUSE is a community-developed version of SUSE Linux Enterprise. It is a free and open-source distribution that is supported by the community.

SUSE Linux Enterprise is a commercial version of openSUSE. It is a paid distribution that is supported by SUSE.

## Additional Resources

* [openSUSE Documentation](https://doc.opensuse.org/)
* [openSUSE Wiki](https://en.opensuse.org/Portal:Documentation)
* [openSUSE Forums](https://forums.opensuse.org/)
* [openSUSE Support](https://en.opensuse.org/openSUSE:Support)
* [openSUSE Bug Reports](https://en.opensuse.org/openSUSE:Submitting_bug_reports)
* [openSUSE Mailing Lists](https://en.opensuse.org/openSUSE:Mailing_lists)
* [openSUSE IRC Channels](https://en.opensuse.org/openSUSE:IRC_list)
* [openSUSE News](https://news.opensuse.org/)
* [openSUSE Planet](https://planet.opensuse.org/)
