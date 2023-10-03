# Installing VyOS

This guide will walk you through installing VyOS on a physical machine or virtual machine. 

## Requirements

The following are the minimum requirements for VyOS:

- 512MB RAM (1GB recommended)
- 1 CPU core (2 cores recommended)
- 2 GB storage (8GB recommended)

Keep in mind that these are the minimum requirements. If you plan to use VyOS in a production environment, you should use a machine with more resources and take into consideration that you may need additional resources based on your use case (e.g. having multiple BGP full tables, running multiple VPNs, etc.).

## Downloading VyOS

VyOS is distributed in a different manner than what you may be used to. In order to download the current LTS release, you need to have an active subscription. Otherwise, you will need to download the rolling release, which is a nightly build of the current development branch, build it yourself, or use a third-party build. Alternatively, VyOS makes the previous LTS release available for free.

Download links are available here: https://support.vyos.io/en/support/solutions/103000152091

## Installing VyOS

### Installing on Proxmox VE

VyOS can be installed on Proxmox VE using the ISO installer. The following steps will walk you through installing VyOS on Proxmox VE:

1. Download the VyOS ISO and upload it to your Proxmox VE server.
2. Create a new VM and assign it the resources you need. You can always change these later if needed. Select the VyOS ISO as the CD-ROM image to install from.
3. In your hardware tab, don't forget to add a second network interface. This will be used for your private network. You can also add additional interfaces if needed.
4. While in the hardware tab, we suggest adding a serial port to your VM. This will allow you to connect to the VyOS console from Proxmox's console directly or over SSH. While this is not required, it is very helpful to have in case you need to troubleshoot networking issues.
5. Boot the VM from the ISO. VyOS will boot into a LiveCD environment. Login with the username `vyos` and the password `vyos`. While you can use this mode to test VyOS or use it as a temporary router, you will need to install it to your VM's disk in order to use it permanently. To do this, run the following command:

    ```bash
    install image
    ```

    This will start the installer. Follow the prompts to install VyOS to your VM's disk. Once the installation is complete, you can reboot the VM and it will boot into your newly installed VyOS system. 
    
6. You can login with the username `vyos` and the password you set during the installation. You can now configure VyOS as needed.

### Installing on a physical machine

VyOS can be installed on a physical machine using the ISO installer just like on Proxmox VE. 

!!! note
    NodeSpace does not provide support for installing VyOS on a physical machine except for advanced hosting customers. If you need help installing VyOS on a physical machine, please contact us to discuss your options.

## Next Steps

At this point, VyOS is installed and you can start configuring it. If you need help configuring VyOS, please see our [VyOS Quick Start Configuration Guide](/guides/vyos/quick-start-config.md).

## Additional Resources

- [VyOS Documentation](https://docs.vyos.io/en/latest/)
- [VyOS Forums](https://forum.vyos.io/)