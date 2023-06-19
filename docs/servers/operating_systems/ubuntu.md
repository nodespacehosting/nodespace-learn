# Ubuntu

![Ubuntu](../images/oslogos/ubuntu.png){: align=right style="width: 150px; margin: 0 0 10px 10px;" }

Ubuntu is a Linux distribution based on Debian and mostly composed of free and open-source software. Ubuntu is officially released in three editions: Desktop, Server, and Core for Internet of things devices and robots. All the editions can run on the computer alone, or in a virtual machine. Ubuntu is a popular operating system for cloud computing, with support for OpenStack.

## What versions of Ubuntu are available?

| Current Version | Supported Until |
| --------------- | --------------- |
| Ubuntu 18.04    | June 2022       |
| Ubuntu 20.04    | April 2025      |
| Ubuntu 22.04    | April 2027      |

!!! warning
    Ubuntu 18.04 is EOL (End of Life) and will no longer receive updates after June 2022. We recommend upgrading to Ubuntu 20.04 or 22.04. While it is possible to still install Ubuntu 18.04, we do not recommend it.

## Using Ubuntu

Ubuntu uses the `apt` package manager to install software and updates. You can install software using the `apt install` command. For example, to install the Apache web server, you would run the following command:

```
apt install apache2
```

!!! note
    You must run the `apt` command as `root` or with `sudo`. 

You can also install multiple packages at once by separating them with a space. For example, to install Apache and PHP, you would run the following command:

```
apt install apache2 php
```

To update your system, you can use the `apt update` command. For example, to update all packages on your system, you would run the following command:

```
apt update
```

### Managing Services

Ubuntu uses the `systemctl` command to manage services. To start a service, you would run the following command:

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

## Additional Resources

- [Ubuntu Documentation](https://help.ubuntu.com/)
- [Ubuntu Server Guide](https://help.ubuntu.com/lts/serverguide/)
- [Ubuntu Community Help Wiki](https://help.ubuntu.com/community/)
- [Ubuntu Forums](https://ubuntuforums.org/)
- [Ubuntu IRC Support](https://help.ubuntu.com/community/InternetRelayChat)

