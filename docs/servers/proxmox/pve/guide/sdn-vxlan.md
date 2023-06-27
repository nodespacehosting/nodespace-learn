# Software Definined Networking - VXLAN

!!! note
    This guide is a work in progress.

## Introduction

VXLAN (Virtual Extensible LAN) is a network overlay technology that encapsulates Layer 2 Ethernet frames within Layer 3 UDP packets to aggregate and tunnel multiple Layer 2 networks across a Layer 3 infrastructure. VXLAN is defined in [RFC 7348](https://tools.ietf.org/html/rfc7348). In Proxmox VE, VXLAN is implemented as part of the [SDN](https://pve.proxmox.com/wiki/SDN) framework. 

!!! warning "Experimental"
    The SDN framework is currently experimental and is not recommended be used in production environments.

VXLAN can span multiple Proxmox VE nodes and can be used to create a single Layer 2 network across multiple nodes. This is useful for creating a single network for virtual machines and containers that can be migrated between nodes without changing IP addresses. You can use this to even create a private network between multiple Proxmox VE nodes that can be used for live migration of virtual machines and containers.

## Prerequisites

* A Proxmox VE cluster with at least two nodes. (Not required - standalone nodes can be used, but configuration is more involved)
* Proxmox VE 7.x or later

## Setup

### Create a new SDN Zone

1. Navigate to Datacenter > SDN > Zones and click Create SDN Zone.
2. Enter a name for the zone and click Create.
3. Click on the new zone and click on the Interfaces tab.
4. Click Create and select VXLAN.
5. Enter a name for the interface and click Create.

