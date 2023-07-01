# Private Networking

NodeSpace offers private networking on most of our dedicated and virtual servers. Private networking allows you to create a private network between your servers. This private network is isolated from the public internet and is only accessible from your servers. You are given a VLAN with a private IP address subnet that additional servers can be added to.

!!! note
    IPv6 is not available on private networks currently.

## Backend Services

NodeSpace offers a number of backend services that are available on private networks. For example, we offer DNS, NTP, Windows Update, Linux update mirrors, and more.

These services are available on the following IPs and domains:

| Service | IP Address | Domain |
| ------- | ---------- | ------ |
| DNS     | 10.200.15.200   | intlnrdns1.service.nodespace.com    |
| DNS 2   | 10.200.16.200   | intlnrdns2.service.nodespace.com    |
| NTP     | 10.200.15.200 10.200.16.200   | time.service.nodespace.com |
| Windows Update | 10.X.X.X | windowsupdate.service.nodespace.com |
| AlmaLinux Update | 10.X.X.X | almalinux.service.nodespace.com |
| Ubuntu Update | 10.X.X.X | ubuntu.service.nodespace.com |
| CentOS Update | 10.X.X.X | centos.service.nodespace.com |
| Debian Update | 10.X.X.X | debian.service.nodespace.com |
| Rocky Linux Update | 10.X.X.X | rocky.service.nodespace.com |
| Fedora Update | 10.X.X.X | fedora.service.nodespace.com |
| OpenSUSE Update | 10.X.X.X | opensuse.service.nodespace.com |
| EPEL | 10.X.X.X | epel.service.nodespace.com |

!!! note
    Some services may not be available in all data center locations.

## Private IP Addresses

By default, clients are issued a /29 subnet with 5 usable IP addresses. If you need additional IP addresses or a larger subnet, one can be issued upon request.
