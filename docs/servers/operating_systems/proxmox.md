# Proxmox

![Proxmox Logo](../images/oslogos/proxmox.png){: align=right style="width: 150px; margin: 0 0 10px 10px;" }

Proxmox Virtual Environment (Proxmox VE) is an open-source server virtualization management platform. It is based on Debian Linux, KVM, and LXC. Proxmox VE is a complete open-source platform for enterprise virtualization. With the built-in web interface you can easily manage VMs and containers, software-defined storage and networking, high-availability clustering, and multiple out-of-the-box tools on a single solution. Additionally, we offer [Proxmox Backup Server](proxmox/proxmox-backup-server.md), a backup solution for VMs and containers and [Proxmox Mail Gateway](proxmox/proxmox-mail-gateway.md), an open-source email security solution to protect your mail server.

!!! note
    NodeSpace is no longer installing Proxmox VE 7 on new server builds. We are keeping the media available for current customers, but all new servers will be installed with Proxmox VE 8 going forward.


## What versions of Proxmox are available?

| Current Version | Supported Until |
| --------------- | --------------- |
| Proxmox VE 7    | July 31, 2024   |
| Proxmox VE 8    | TBA             |

!!! note
    We will provide or install Proxmox 7 upon request. Please [contact us](https://my.nodespace.com/submitticket.php) if you would like to use Proxmox VE 7 instead of Proxmox VE 8. Please keep in mind that Proxmox VE 7 is **approaching End Of Life** and will not be receiving any updates or security patches after the EOL date.

## Using Proxmox VE

Proxmox VE uses the `apt` package manager to install software and updates. You can install software using the `apt install` command. For example, to install the Apache web server, you would run the following command:

```
apt install apache2
```

!!! note
    You must run the `apt` command as `root` or with `sudo`.

You can also install multiple packages at once by separating them with a space. For example, to install Apache and PHP, you would run the following command:

```
apt install apache2 php
```

To update your system, you can use the `apt update` command followed by the `apt dist-upgrade` command. For example, to update all packages on your system, you would run the following command:

```
apt update
apt dist-upgrade
```

!!! warning
    Proxmox recommends that you run `apt dist-upgrade` instead of `apt upgrade` to update your system. `apt upgrade` will not install new packages or remove existing packages, while `apt dist-upgrade` will install new packages and remove existing packages if necessary. 


### Managing Services

Proxmox VE uses the `systemctl` command to manage services. To start a service, you would run the following command:

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

Proxmox services should be managed using the `pve` command. For example, to start the Proxmox web interface, you would run the following command:

```
pve start
```

Proxmox also contains wrappers for other services. These services should be managed through the Proxmox wrappers.

Most common Proxmox services can be managed through the Proxmox web interface. You can access the web interface by navigating to `https://<your-server-ip>:8006` in your web browser. You will be prompted to log in with your root credentials.