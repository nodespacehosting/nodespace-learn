# OpenVZ VPS from sshVM

![sshVM](images/sshvm_logo.png)

[sshVM](https://www.sshvm.com) is NodeSpace's brand for hosting basic OpenVZ VPS servers. Since these containers are unmanaged, we do not offer support for them. If you need support, please consider ordering a [KVM VPS](https://www.nodespace.com/servers/vps/).

## Overview

NodeSpace offers OpenVZ VPS hosting through our [sshVM](https://www.sshvm.com) brand. OpenVZ is a container-based virtualization platform similar to LXC. OpenVZ is a lightweight virtualization platform that offers great performance and stability. 

## Features

::cards:: cols=3

- title: Powered by OpenVZ
  content: Our VPSs are powered by OpenVZ
  image: ../../images/oslogos/openvz.png

- title: Linux Templates
  content: A variety of Linux templates are available for automated installation.
  image: ../../images/oslogos/linux.png

- title: Technical Support
  content: We include basic technical support with our OpenVZ VPSs. 
  image: ../../images/technical-support.png

::/cards::

!!! note "Linux Only"
    OpenVZ is a Linux-only virtualization platform. If you need Windows, please consider ordering a [KVM VPS](https://www.nodespace.com/servers/vps/). Additionally, since OpenVZ is a container-based virtualization platform, you cannot load your own kernel. If you need to load your own kernel, please consider ordering a [KVM VPS](https://www.nodespace.com/servers/vps/).

## Plans

For a current list of our OpenVZ plans and pricing, please see our [OpenVZ plans](https://www.sshvm.com/openvz/) page. We offer a number of plans with varying amounts of RAM, CPU, and disk space. Plans are available in Kansas City, MO and Chicago, IL.

## Operating Systems

A variety of Linux templates are available for automated installation. The current available templates are listed below:

::cards:: cols=3

- title: CentOS 7
  content: CentOS 7
  image: ../../images/oslogos/centos.png

- title: CentOS 8
  content: CentOS 8 
  image: ../../images/oslogos/centos.png

- title: OpenSUSE 13.2
  content: OpenSUSE 13.2
  image: ../../images/oslogos/opensuse.png

- title: Debian 9
  content: Debian 9
  image: ../../images/oslogos/debian.png

- title: Debian 10
  content: Debian 10
  image: ../../images/oslogos/debian.png

- title: Ubuntu 16.04
  content: Ubuntu 16.04
  image: ../../images/oslogos/ubuntu.png

- title: Ubuntu 18.04
  content: Ubuntu 18.04
  image: ../../images/oslogos/ubuntu.png

- title: Ubuntu 20.04
  content: Ubuntu 20.04
  image: ../../images/oslogos/ubuntu.png

- title: AlmaLinux 9
  content: AlmaLinux 9
  image: ../../images/oslogos/almalinux.png

- title: AlmaLinux 8
  content: AlmaLinux 8
  image: ../../images/oslogos/almalinux.png

::/cards::

## Technical Support

!!! warning "Unmanaged Services"
    OpenVZ VPSs are unmanaged services. We do not offer support for OpenVZ VPSs beyond installation of the container template, provisioning IPs, and basic network functionality. If you need full support, please consider ordering a [KVM VPS](https://www.nodespace.com/servers/vps/).

### TUN/TAP

TUN/TAP is available on all OpenVZ VPSs. If you need to enable TUN/TAP, please open a support ticket. You can also enable TUN/TAP during the order process.

### IPv6

IPv6 is available on all OpenVZ VPSs. If you need IPv6, please open a support ticket.

### Additional IP Addresses

Additional IP addresses are available on all OpenVZ VPSs. Additional IP addresses are available with justification. If you need additional IP addresses, please open a support ticket.

### RDNS (Reverse DNS)

Currently there is no self-service RDNS (Reverse DNS) available for OpenVZ VPSs. If you need RDNS, please open a support ticket. Please make sure you have forward DNS setup for the IP address before requesting RDNS. Please see our [RDNS documentation](../../networking/public.md#rdns-reverse-dns) for more information as this policy applies to all of our services.

## Control Panel

We offer a basic control panel for managing your OpenVZ VPS. You can access the control panel at [https://cp.sshvm.com](https://cp.sshvm.com). You can login to the control panel using your email address and password. If you do not know your password, you can reset it by clicking the "Forgot Password" link on the login page or by logging in to the [sshVM client area](https://secure.sshvm.com/clientarea.php) and accessing your service.

The control panel allows you to perform the following actions:

- Start & Stop your VPS
- Reboot your VPS
- Reinstall your VPS or change the template
- View your VPS's resource usage
- View your VPS's network usage
- View your VPS's running processes
- Access the VNC console for your VPS

