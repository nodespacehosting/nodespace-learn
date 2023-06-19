# CloudLinux

![CloudLinux](../images/oslogos/cloudlinux.png){: align=right style="width: 150px; margin: 0 0 10px 10px;" }

CloudLinux is a Linux distribution based on Red Hat Enterprise Linux (RHEL). It uses the OpenVZ kernel and the rpm package manager. CloudLinux was designed to address the unique needs of web hosts, providing greater control over the amount of resources that are used by each website.

!!! note
    CloudLinux requires an active subscription to use. You can purchase a CloudLinux license from [our client area](https://my.nodespace.com).

## What versions of CloudLinux are available?

| Current Version | Supported Until |
| --------------- | --------------- |
| CloudLinux 7    | June 30, 2024   |
| CloudLinux 8    | June 30, 2029   |
| CloudLinux 9    | June 30, 2031   |

## Using CloudLinux

CloudLinux is identical to AlmaLinux (Rocky Linux, CentOS, etc.), with the exception of the `cagefs` and `lve` packages. These packages are used to manage the resources that are used by each website. Please see our [AlmaLinux](almalinux.md) guide for more information on using CloudLinux.

## Installing CloudLinux

CloudLinux can be installed from an AlmaLinux or CentOS installation using the following commands:

```
wget https://repo.cloudlinux.com/cloudlinux/sources/cln/cldeploy
sh cldeploy -k <activation key>
```

!!! note
    You must replace `<activation key>` with your activation key. You can find your activation key in [our client area](https://my.nodespace.com).

!!! warning "CentOS 7 Deprecation"
    While CloudLinux does provide extended security support for EOL operating systems such as CentOS 6, software vendors such as cPanel and Plesk do not support EOL operating systems. You will need to use CloudLinux 8 instead.

## Uninstalling CloudLinux

If you no longer wish to keep an active CloudLinux subscription, you can downgrade to AlmaLinux by running the following commands:

```
wget -O cldeploy https://repo.cloudlinux.com/cloudlinux/sources/cln/cldeploy
sh cldeploy -c
```

At this point the system will be converted to AlmaLinux. You can then remove the CloudLinux kernel by running the following command:

```
rpm -e --nodeps $(rpm -qa | grep kernel | grep lve)
```

To install the AlmaLinux kernel, you can run the following command:

```
dnf install kernel
```

Now when you reboot your server, you will be convrted back to AlmaLinux.

!!! warning
    While the downgrade process is generally safe, we recommend that you take a backup of your server before proceeding. When you downgrade, you will also remove the PHP Selector and any other CloudLinux specific software.



    