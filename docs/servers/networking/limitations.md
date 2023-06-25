# Network Limitations

!!! note
    Please neep in mind that we have some limitations on our network. Please read this article carefully before you start using our services. We do not have these limitations to annoy you, but to protect our network and our customers from abuse. If you have any questions, please contact our support team.

## Servers

### Incoming Connections

We do not block any incoming connections to your virtual server. You can run any service you would like on your virtual server. We do not block any ports on our network. Please keep in mind that you are responsible for securing your virtual server. We recommend that you use a firewall to block any unwanted incoming connections. We may place inbound filters on your virtual server if we detect abuse.

!!! question "Can I run a mail server?"
    Yes, we do not restrict inbound port `25` on our network.

### Outgoing Connections

We do not block any outgoing connections from your virtual server. You can run any service you would like on your virtual server. We may place outbound filters on your virtual server if we detect abuse such as spamming or port scanning.

### IP Spoofing

We do not allow IP spoofing on our network. If we detect IP spoofing on your virtual server, we will suspend your virtual server and notify you via email. We may also place outbound filters on your virtual server if we detect IP spoofing. We have protections in place to prevent IP spoofing on our network. If you need to use IP spoofing for a legitimate reason, please contact our support team. If you are using IP spoofing for malicious purposes, we will suspend your virtual server and notify you via email. Attempting to circumvent our IP spoofing protections will result in immediate termination of your account.

## Outbound Email

We utilize a SMTP proxy on our network within our Lenoir, North Carolina data center. This proxy is used to prevent abuse on our network. It is transparent so it will intercept all outbound SMTP traffic on port `25`.

!!! warning "TLS Support"
    Our SMTP proxy does not support TLS. If you need to send outbound email over TLS, you will need to use an alternate port such as `587` or use a SMTP relay service. 

!!! note
    We are working to add TLS support to our SMTP proxy. We do not have an ETA at this time. **We cannot exempt your network from our SMTP proxy.**

