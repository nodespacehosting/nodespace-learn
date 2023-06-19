# OpenVZ

![OpenVZ](../images/oslogos/openvz.png){: align=right style="width: 150px; margin: 0 0 10px 10px;" }

OpenVZ is an operating system-level virtualization technology based on the Linux kernel and operating system. OpenVZ allows a physical server to run multiple isolated operating system instances, called containers, virtual private servers (VPSs), or virtual environments (VEs). OpenVZ is similar to Solaris Containers and LXC.

!!! note
    OpenVZ uses a shared kernel, which means that all containers will use the same kernel as the host node. This means that you cannot run a different kernel version in a container than the host node. This also means that you cannot run any operating system other than Linux in a container. If you want to run a different kernel version or a different operating system, you should use [Proxmox VE](proxmox.md) or KVM on [AlmaLinux](almalinux.md) (or another Linux distro) instead.

## What versions of OpenVZ are available?

| Current Version | Supported Until |
| --------------- | --------------- |
| OpenVZ 7        | June 30, 2024   |

## Using OpenVZ

OpenVZ uses the `yum` package manager to install software and updates. You can install software using the `yum install` command. For example, to install the Apache web server, you would run the following command:

```
yum install httpd
```

!!! note
    You must run the `yum` command as `root` or with `sudo`.

You can also install multiple packages at once by separating them with a space. For example, to install Apache and PHP, you would run the following command:

```
yum install httpd php
```

To update your system, you can use the `yum update` command. For example, to update all packages on your system, you would run the following command:

```
yum update
```

### Managing Services

OpenVZ uses the `systemctl` command to manage services. To start a service, you would run the following command:

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

## OpenVZ Templates

OpenVZ templates are pre-built operating system images that can be used to create new containers. For a complete list of available OpenVZ templates, please see the [OpenVZ Templates](https://openvz.org/Download/template/precreated) page.

## How to use OpenVZ Templates

To create a new container using an OpenVZ template, you would run the following command:

```
vzctl create <CTID> --ostemplate <TEMPLATE>
```

To start a container, you would run the following command:

```
vzctl start <CTID>
```

To stop a container, you would run the following command:

```
vzctl stop <CTID>
```

To restart a container, you would run the following command:
    
```
vzctl restart <CTID>
```

To enter a container, you would run the following command:
    
```
vzctl enter <CTID>
```


## OpenVZ Commands

The following commands are available for managing OpenVZ containers:

| Command | Description |
| ------- | ----------- |
| `vzctl create <CTID> --ostemplate <TEMPLATE>` | Creates a new container using an OpenVZ template |
| `vzctl start <CTID>` | Starts a container |
| `vzctl stop <CTID>` | Stops a container |
| `vzctl restart <CTID>` | Restarts a container |
| `vzctl enter <CTID>` | Enters a container |
| `vzctl destroy <CTID>` | Destroys a container |
| `vzlist` | Lists all containers |
| `vzlist <CTID>` | Lists a specific container |
| `vzlist -a` | Lists all containers, including stopped containers |
| `vzlist -o <COLUMN>` | Lists all containers, showing only the specified column |
| `vzlist -o <COLUMN> <CTID>` | Lists a specific container, showing only the specified column |
| `vzlist -a -o <COLUMN>` | Lists all containers, including stopped containers, showing only the specified column |
| `vzctl exec <CTID> <COMMAND>` | Executes a command in a container |
| `vzctl set <CTID> --ipadd <IP> --save` | Sets the IP address of a container |
| `vzctl set <CTID> --hostname <HOSTNAME> --save` | Sets the hostname of a container |
| `vzctl set <CTID> --nameserver <NAMESERVER> --save` | Sets the nameserver of a container |
| `vzctl set <CTID> --userpasswd <USERNAME>:<PASSWORD> --save` | Sets the password of a user in a container |
| `vzctl set <CTID> --onboot yes --save` | Sets a container to start on boot |
| `vzctl set <CTID> --onboot no --save` | Sets a container to not start on boot |
| `vzctl set <CTID> --cpus <CPUS> --save` | Sets the number of CPUs of a container |
| `vzctl set <CTID> --cpulimit <CPULIMIT> --save` | Sets the CPU limit of a container |
| `vzctl set <CTID> --cpus <CPUS> --cpulimit <CPULIMIT> --save` | Sets the number of CPUs and the CPU limit of a container |
| `vzctl set <CTID> --ram <RAM> --save` | Sets the RAM of a container |
| `vzctl set <CTID> --swap <SWAP> --save` | Sets the swap of a container |
| `vzctl set <CTID> --ram <RAM> --swap <SWAP> --save` | Sets the RAM and the swap of a container |
| `vzctl set <CTID> --diskspace <DISKSPACE> --save` | Sets the disk space of a container |

