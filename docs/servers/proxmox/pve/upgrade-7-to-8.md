# Upgrade Proxmox VE 7 to 8

This guide will walk you through the process of upgrading your Proxmox VE 7 installation to Proxmox VE 8. This guide assumes you have a working Proxmox VE 7 installation and are able to access the web interface. If you are unable to access the web interface, please contact support for assistance.

!!! warning
    While this process is generally safe, it is always recommended to take a backup of your data before performing any upgrades. NodeSpace is not responsible for any data loss that may occur during this process.

## Step 1: Update Proxmox VE 7

Before upgrading to Proxmox VE 8, you must first update your Proxmox VE 7 installation to the latest version. To do this, log in to the web interface and navigate to **Updates** in the left sidebar. Click the **Check** button to check for updates. If any updates are available, click the **Download** button to download them. Once the updates have been downloaded, click the **Install Updates** button to install them. Once the updates have been installed, you will be prompted to reboot your server. Click the **Reboot** button to reboot your server.

You can also use the console to update your Proxmox VE 7 installation. To do this, log in to the console and run the following commands:

```bash
apt update
apt dist-upgrade
```

## Step 2: Run the Proxmox VE 8 Upgrade Check Script

Once your Proxmox VE 7 installation has been updated, you can run the Proxmox VE 8 upgrade check script to check if your system is ready to be upgraded to Proxmox VE 8. To do this, log in to the console and run the following command:

```bash
pve7to8
```

If your system is ready to be upgraded to Proxmox VE 8, you will see no blockers in the check output. If your system is not ready to be upgraded to Proxmox VE 8, you will see one or more blockers in the check output. If you see any blockers in the check output, you will need to resolve them before proceeding with the upgrade. If you are unsure how to resolve a blocker, please contact support for assistance.

## Step 3: Upgrade to Proxmox VE 8

!!! warning "Stop all VMs and containers before upgrading"
    Before upgrading to Proxmox VE 8, you should stop all VMs and containers for consistency. 

Once your Proxmox VE 7 installation has been updated and you have resolved any blockers, you can upgrade to Proxmox VE 8. To do this, you must first switch the Debian Bullseye repos to Debian Bookworm repos. To do this, log in to the console and run the following commands:

```bash
sed -i 's/bullseye/bookworm/g' /etc/apt/sources.list
sed -i 's/bullseye/bookworm/g' /etc/apt/sources.list.d/pve-enterprise.list
```

If you're using any other repos, make sure you update them as well.

Next, you must update your system to Debian Bookworm. To do this, log in to the console and run the following commands:

```bash
apt update
apt dist-upgrade
```

This process will take a while and you may be asked if you want to keep your current version of a configuration file or install the package maintainer's version. If you are asked this question, you can select to retain your version, but view the file to double check. 

If you're asked about `/etc/lvm/lvm.conf`, you should select to install the package mantainer's version. 

Once the process is complete, you should then run the `pve7to8` check again to make sure everything was upgraded. You should receive only two warnings after an upgrade. These warnings typically just mean that the server needs to be rebooted. If you receive any other warnings, please contact support for assistance.

## References

- [Proxmox VE 8 Upgrade Notes](https://pve.proxmox.com/wiki/Upgrade_from_7_to_8)