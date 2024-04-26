# Fedora

![Fedora Linux](../images/oslogos/fedora.png){: align=right style="width: 150px; margin: 0 0 10px 10px;" }

Fedora is a Linux distribution developed by the community-supported Fedora Project which is sponsored primarily by Red Hat, a subsidiary of IBM, with additional support from other companies. Fedora contains software distributed under various free and open-source licenses and aims to be on the leading edge of free technologies. Fedora is the upstream source of the commercial Red Hat Enterprise Linux distribution.

## What versions of Fedora are available?

| Current Version | Supported Until |
| --------------- | --------------- |
| Fedora 38       | May 14, 2024    |
| Fedora 39       | November 12, 2024 |
| Fedora 40       | May 13, 2025    |

## Using Fedora

Fedora uses the `dnf` package manager to install software and updates. You can install software using the `dnf install` command. For example, to install the Apache web server, you would run the following command:

```
dnf install httpd
```

!!! note
    You must run the `dnf` command as `root` or with `sudo`.

You can also install multiple packages at once by separating them with a space. For example, to install Apache and PHP, you would run the following command:

```
dnf install httpd php
```

To update your system, you can use the `dnf update` command. For example, to update all packages on your system, you would run the following command:

```
dnf update
```

### Managing Services

Fedora uses the `systemctl` command to manage services. To start a service, you would run the following command:

```
systemctl start httpd
```

To stop a service, you would run the following command:

```
systemctl stop httpd
```

To restart a service, you would run the following command:

```
systemctl restart httpd
```

To enable a service to start on boot, you would run the following command:

```
systemctl enable httpd
```

## Next Steps

Now that you have a better understanding of Fedora, you may be interested in learning more about [AlmaLinux](almalinux.md), [Rocky Linux](rocky_linux.md), [Debian](debian.md) or [Ubuntu](ubuntu.md).

## Additional Information

- [Fedora Website](https://getfedora.org/)
- [Fedora Documentation](https://docs.fedoraproject.org/en-US/index.html)
- [Fedora Support](https://fedoraproject.org/wiki/Communicating_and_getting_help)
- [Fedora Forums](https://ask.fedoraproject.org/)
- [Fedora Wiki](https://fedoraproject.org/wiki/Fedora_Project_Wiki)

