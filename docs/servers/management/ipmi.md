# IPMI Guide

!!! note
    IPMI is the generic name. On Dell servers, it's called iDRAC and on HPE servers it's called iLO. This guide will use the term IPMI. Additionally, we use more Supermicro servers than any other brand, so this guide will focus on Supermicro IPMI.

## What is IPMI?

IPMI stands for Intelligent Platform Management Interface. It is a standardized interface for managing servers. It is typically used for out-of-band management of servers, allowing you to control the server even if it is powered off or unresponsive. IPMI lets you control your server as if you were sitting in front of it. You can view the console, power the server on and off, and even mount ISOs to install a new operating system.

## How do I access IPMI?

You can access IPMI by logging into the [server management platform](index.md) and clicking the "Console" button for your server.

!!! note
    Although VPS servers also have a "console" button, this will launch the VPS console, not the IPMI console. VPS servers do not have IPMI.

## How can I load a new operating system?

You can load a new operating system by mounting an ISO. You can do this by clicking the "Virtual Media" button in the IPMI console. You can then select an ISO to mount from our library. At this current time, there is no way to upload your own ISOs, but we are working on adding this feature. We have ISOs for most major operating systems, including Windows Server, CentOS, Ubuntu, Debian, and more.

!!! note
    If you don't see the ISO you need, please contact support and we can add it for you.

When you manually install an operating system from ISO, you will have to make some tweaks to the operating system in order to get it to work properly. This includes manually setting your network settings. If you do an automated installation, this will be done for you.

# IPMI FAQ

## Can I access IPMI outside of the server management platform?

*Currently, IPMI is restricted to our IPMI management platform. We are working on adding a better VPN solution to allow you to be able to access IPMI from anywhere.*

## Can I upload my own ISOs?

*Currently, you cannot upload your own ISOs. We are working on adding this feature.*

## Can I use IPMI to install an operating system on a VPS?

*No, VPS servers do not have IPMI. You can use the VPS console to install an operating system on a VPS.*

## Do I need to download anything to use IPMI?

*No, IPMI is a web-based interface. You do not need to download anything to use it.*