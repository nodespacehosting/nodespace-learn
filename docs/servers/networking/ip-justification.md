# IP Address Justification

## What is IP Address Justification?

IP Address Justification is a process that is required by ARIN (American Registry for Internet Numbers) to ensure that IP addresses are being used in accordance with their policies. This process is, regrettably, time consuming and requires a lot of information. However, it is required by ARIN and must be completed before IP addresses can be assigned to a server.

## Why is IP Address Justification Required?

IP Address Justification is required to ensure that IP addresses are being used in accordance with ARIN's policies. This is to ensure that IP addresses are not being wasted and that they are being used for their intended purpose. Internet citizens like NodeSpace, are having an increasingly difficult time obtaining IP addresses due to the depletion of IPv4 addresses. In order to ensure that IP addresses are available for people who need them, the justification process ensures that IP addresses assigned are being actively used.

## How do I Justify IP Addresses?

We have made an effort to streamline the justification process and make it as easy as possible. You can justify IP addresses by following the steps below:

1. Determine the number of IP addresses you need.
2. Determine how these IP addresses will be used.
3. Provide NodeSpace with the details in the following format (this is an example, please provide your own details):

```
[x.x.x.x] - pve01.example.com (Hypervisor Management IP)
[x.x.x.x] - fw.pve01.example.com (Virtualization Firewall)
[x.x.x.x] - ns1.example.com (Primary Nameserver)
[x.x.x.x] - ns2.example.com (Secondary Nameserver)
[x.x.x.x] - web01.example.com (Web Server)
```
If you don't have an immediate plan for some IPs, you can justify them like this:

```
[x.x.x.x] - pve01.example.com (Hypervisor Management IP)
[x.x.x.x] - fw.pve01.example.com (Virtualization Firewall)
[x.x.x.x] - youremail@example.com (AlmaLinux Web Server - Future Use)
[x.x.x.x] - rproxy01.example.com (Reverse Proxy - Future Use)
```
4. Submit the justification to NodeSpace via a support ticket. If there are any issues with the justification, we will let you know and work with you to resolve them. Once the justification is approved, we will assign the IP addresses to your server. If you need to justify additional IP addresses in the future, you can do so by submitting a new justification. If you cannot immediately justify enough of the requested IP addresses, we will assign you the IP addresses that you can justify and you can submit a new justification for the remaining IP addresses when you are ready.

## Automatic Denial Justification

We will automatically deny any justification for, but not limited to, the following:

- SEO
- SSL (use SNI)
- Web servers (use name-based virtual hosting)
- Email servers (use name-based virtual hosting)
- DNS servers other than the primary and secondary nameservers
- Applications that can use name-based virtual hosting
- Applications that can use multiple ports on the same IP address

We may make exceptions to this policy on a case-by-case basis. If you have a legitimate need for IP addresses for any of the above, please contact us and we will work with you to determine if an exception can be made.

## Additional Information

Please keep in mind that if you are requesting large subnets, you will be required to provide additional information and documentation. We will work with you to determine what information and documentation is required.