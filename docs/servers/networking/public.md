# Public Networking

## Overview

NodeSpace offers public networking on all of our dedicated and virtual servers. Public networking allows you to create a private network between your servers. This private network is isolated from the public internet and is only accessible from your servers. This allows you to create a secure network between your servers that is not accessible from the public internet.

## Public IP Addresses

NodeSpace offers public IP addresses on all of our dedicated and virtual servers. You can purchase additional IP addresses from the [NodeSpace Client Area](https://my.nodespace.net/cart.php?gid=addons). You can also request additional IP addresses by opening a support ticket. Additional IP addresses are available with justification. IP Address pricing is listed in our client area.

## RDNS (Reverse DNS)

NodeSpace offers RDNS (Reverse DNS) on all of our dedicated and virtual servers. Currently, RDNS is only available for IPv4 addresses and you can request RDNS by opening a support ticket. RDNS is available for all IP addresses that are assigned to your server.

!!! warning "Forward-Confirmed DNS Required"
    In order to setup RDNS, you must have a forward DNS record setup for the IP address. If you do not have forward DNS setup, you will not be able to setup RDNS. This means that if you are requesting us to set `mail.example.com` as the RDNS for `100.64.123.12`, you must have `mail.example.com` setup as an A record for `100.64.123.12`. This is required by the [RFC 1912](https://tools.ietf.org/html/rfc1912) standard and is our policy.
