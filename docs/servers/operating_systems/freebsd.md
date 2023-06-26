# FreeBSD

![FreeBSD](../images/oslogos/freebsd.png){: align=right style="width: 150px; margin: 0 0 10px 10px;" }

FreeBSD is a free and open-source Unix-like operating system descended from the Berkeley Software Distribution (BSD), which was based on Research Unix. The first version of FreeBSD was released in 1993. In 2005, FreeBSD was the most popular open-source BSD operating system, accounting for more than three-quarters of all installed simply, permissively licensed BSD systems.

## What versions of FreeBSD are available?

| Current Version | Supported Until |
| --------------- | --------------- |
| FreeBSD 12      | December 31, 2023  |
| FreeBSD 13      | January 31, 2026  |

## Using FreeBSD

FreeBSD uses the `pkg` package manager to install software and updates. You can install software using the `pkg install` command. For example, to install the Apache web server, you would run the following command:

```
pkg install apache24
```

!!! note
    You must run the `pkg` command as `root` or with `sudo`.

You can also install multiple packages at once by separating them with a space. For example, to install Apache and PHP, you would run the following command:

```
pkg install apache24 php74
```

To update your system, you can use the `pkg update` command followed by the `pkg upgrade` command. For example, to update all packages on your system, you would run the following command:

```
pkg update
pkg upgrade
```

### Managing Services

FreeBSD uses the `service` command to manage services. To start a service, you would run the following command:

```
service apache24 start
```

To stop a service, you would run the following command:

```
service apache24 stop
```

To restart a service, you would run the following command:

```
service apache24 restart
```

## Next Steps

Now that you have a better understanding of FreeBSD, you can learn how to [install FreeBSD](/docs/servers/operating_systems/freebsd/installation) on your server.

## Additional Information

* [FreeBSD Homepage](https://www.freebsd.org/)
* [FreeBSD Documentation](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/)
* [FreeBSD Forums](https://forums.freebsd.org/)
* [FreeBSD Wiki](https://wiki.freebsd.org/)
* [FreeBSD Ports](https://www.freebsd.org/ports/)
* [FreeBSD Handbook](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/)
* [FreeBSD Handbook - Installing Applications: Packages and Ports](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/ports.html)

