# Proxmox Virtual Environment (PVE)

Proxmox Virtual Environment is an open-source server virtualization management platform. It is a Debian-based Linux distribution with a modified Ubuntu LTS kernel and allows deployment and management of virtual machines and containers. It is a web-based management interface for the Proxmox VE hypervisor cluster.

## Admin Guides (PDF)

- [Proxmox VE 6.x](../resources/pve-admin-guide-6.pdf) **Unsupported as of July 2022**
- [Proxmox VE 7.x](../resources/pve-admin-guide-7.pdf)
- [Proxmox VE 8.x](../resources/pve-admin-guide-8.pdf) **Latest Version**

## Helpful Guides

- [How to upgrade Proxmox VE 7.x to 8.x](upgrade-7-to-8.md)

## Setting up ZFS

!!! warning
    ZFS should not be used on top of hardware RAID controllers. On most of our standard systems for Proxmox VE hosting, they come with hardware RAID controllers. We do not recommend setting up or using ZFS on individual Proxmox VE nodes.

You can easily create a ZFS storage pool from within the Proxmox VE GUI. When we provision Proxmox VE systems, additional disks are not provisioned so that you can add them to your system however you would like. 

Select your node under Datacenter and navigate to Disks and then ZFS. From within the ZFS option, click on Create ZFS. You will see available drives which you can select and then give a name to as well as set your requested RAID level, compression, and ashift. Once configured, click on Create. You should then see your ZFS pool show up under your node.

It is strongly advised ZFS should not be used with hardware RAID controllers. The majority of our Proxmox VE server configurations come with hardware RAID controllers. While the disks may appear as individual drives on your system, this is because they are configured as single-drive RAID 0 arrays. If you setup ZFS, you do so at your own risk as it is not a supported configuration. We will be adding several builds with HBAs that you'll be able to use ZFS on.

On models with hardware RAID, we prefer that you use hardware RAID over ZFS for several reasons. 1) It is a supported configuration on enterprise-grade hardware, which we use. 2) Hardware failure is easier to manage in a protected RAID. On RAID 1, 5, and 6, we will hot swap the failed disk which causes no downtime to you. ZFS requires OS-level access in order to remove the drive and may require some downtime. 3) ZFS was designed primarily for commodity drives or "prosumer" drives. We use enterprise-grade SSDs and HDDs in our servers. 

Familiarize yourself with potential and known limitations such as:

* Hardware RAID will limit opportunities for ZFS to perform self healing on checksum failures. When ZFS does RAID-Z or mirroring, a checksum failure on one disk can be corrected by treating the disk containing the sector as bad for the purpose of reconstructing the original information. This cannot be done when a RAID controller handles the redundancy unless a duplicate copy is stored by ZFS in the case that the corruption involving as metadata, the copies flag is set or the RAID array is part of a mirror/raid-z vdev within ZFS.

* Sector size information is not necessarily passed correctly by hardware RAID on RAID 1 and cannot be passed correctly on RAID 5/6. Hardware RAID 1 is more likely to experience read-modify-write overhead from partial sector writes and Hardware RAID 5/6 will almost certainty suffer from partial stripe writes (i.e. the RAID write hole). Using ZFS with the disks directly will allow it to obtain the sector size information reported by the disks to avoid read-modify-write on sectors while ZFS avoids partial stripe writes on RAID-Z by desing from using copy-on-write.

  * There can be sector alignment problems on ZFS when a drive misreports its sector size. Such drives are typically NAND-flash based solid state drives and older SATA drives from the advanced format (4K sector size) transition before Windows XP EoL occurred. This can be manually corrected at vdev creation.

    * It is possible for the RAID header to cause misalignment of sector writes on RAID 1 by starting the array within a sector on an actual drive, such that manual correction of sector alignment at vdev creation does not solve the problem.

Source & additional information: https://openzfs.github.io/openzfs-docs/Performance%20and%20Tuning/Hardware.html#hardware-raid-controllers 