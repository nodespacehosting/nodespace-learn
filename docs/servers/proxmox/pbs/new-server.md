# Configure New Proxmox Backup Server

This guide will walk you through the initial configuration of a new Proxmox Backup Server (PBS) installation. This guide assumes you have already installed PBS and have access to the web interface.

## Configuring Proxmox Backup Server

### 1. Configure Storage

The first step is to configure the storage for your backups. This can be done by clicking on the `Administration` node in the tree on the left side of the web interface. Then click on `Storage \ Disks` tab. You should see your storage drives listed here. 

!!! warning "ZFS is not compatible with RAID"
    If you are using ZFS, you should not use any RAID configuration. ZFS is designed to handle the redundancy and will not work properly if you use RAID. Your storage server may have a RAID controller and it may have been configured to use RAID. Please contact support if you would like to have the RAID configuration removed or modified. **Some RAID controllers do not have an option to disable RAID or place the controller in HBA mode.** If this is the case, support will notify you. You can still use ZFS with RAID, but it is not recommended. 

Find the drive you would like to use for backup storage and go to `Administration` > `Storage \ Disks` > `Directory`. Click the `Add` button. You will be prompted to enter a name for the storage and where it is located on the disk. Enter a name and click `Add`. Check the box to create a data store and this will also provision the first data store on the disk.

To do this from the CLI, run the following as `root`:

```bash
proxmox-backup-manager disk fs create store1 --disk sdd --filesystem ext4 --add-datastore true
```

!!! note
    This example uses the disk `sdd`. You will need to replace this with the disk you would like to use.

### 2. Configure Data Store

!!! note
    If you created a data store when you created the storage, you can skip this step. Refer to this step if you need to create additional data stores.

Next, you will need to create a data store. This is where your backups will be stored. Click on the `Datastore` tab. Then click the `Add` button. You will be prompted to enter a name for the data store and the physical mount point. Enter a name and click `Add`. 

!!! note
    If you're not sure of the physical mount point, refer to the `Storage \ Disks` tab and `Directories`. The physical mount point will be listed there. Promox will mount the data disk by default at `/mnt/datastore/`. 

To do this from the CLI, run the following as `root`:

```bash
proxmox-backup-manager datastore create store1 --path /mnt/datastore/store1
```

### 3. Configure Backup User

!!! note
    Optional, but highly recommended. Otherwise, you will need to use the `root` user to manage backups and this is a bad idea for security reasons.

Next, you will need to create a backup user. This user will be used to manage backups. Click on the `Configuration` node in the menu. Then click the `Access Control` tab. Click the `Add` button. You will be prompted to enter a username and password as well as other details about the user. Enter a username and password and click `Add`.

```bash
proxmox-backup-manager user create john@pbs --email john@example.com
proxmox-backup-manager user update john@pbs --password "MyPassword"
proxmox-backup-manager user update john@pbs --firstname John --lastname Smith
proxmox-backup-manager user update john@pbs --comment "An example user."
```

!!! warning
    Created users do not have any permissions by default. You will need to assign permissions to the user. Refer to the next step for more information.

### 4. Access Control Permissions

Next, you will need to assign permissions to the user. Proxmox Backup Server uses a role- and path-based permission management system. An entry in the permissions table allows a user, group or token to take on a specific role when accessing an 'object' or 'path'. This means that such an access rule can be represented as a triple of '(path, user, role)', '(path, group, role)' or '(path, token, role)', with the role containing a set of allowed actions, and the path representing the target of these actions.

To assign a role to a user, go to `Configuration` > `Access Control` > `Permissions`. Click the `Add` button. You will be prompted to select either a user or API tocken. Select user and then select the user you created in the previous step. For the path, select the data store you created in the previous step. Then select the role you would like to assign to the user. Click `Add`.

At minimum, in order to backup and restore VMs, you will need to assign the `Datastore.Admin` role to the user. This will allow the user to manage backups and restore VMs. Currently, there is no way to create a custom role.

### 5. Configure Backup Storage on PVE Node

Next, you will need to configure backups on your Proxmox VE node(s). Login to your Proxmox VE node and click on the `Datacenter` node in the tree on the left side of the web interface. Then click on the `Storage` tab. Click the `Add` button and select the option `Proxmox Backup Server`. Enter an ID for the storage (this is just a name for the storage on the node) and the IP address or hostname of your Proxmox Backup Server. Enter the username and password for the backup user you created in the previous step, or the `root@pam` user if you did not create a backup user. You are also required to enter the name of the data store. Click `Add`.

!!! note
    You do not need to enter the full path of the data store. Just enter the name of the data store. For example, if your data store is located at `/mnt/datastore/store1`, you would just enter `store1`.

!!! warning
    If you are using a self-signed certificate, you will need to add the fingerprint of the certificate. You can find the fingerprint by logging into your Proxmox Backup Server web GUI and clicking on the `Configuration` node in the menu. Then click on the `Certificates` tab. Click on the certificate you are using and copy the fingerprint. Paste the fingerprint into the `Fingerprint` field on your Proxmox VE node.

    **If you use a certificate issued by a trusted CA such as Let's Encrypt, you do not need to enter the fingerprint.**

Repeat this step for each Proxmox VE node you would like to backup.

!!! note
    You can backup Proxmox VE nodes at other data centers or that are behind NAT.

## Extra Configuration

### Let's Encrypt

You can configure your Proxmox Backup Server to use a Let's Encrypt certificate. Login to the Proxmox Backup Server Web GUI and go to `Configuration` > `Certificates`. Click on `ACME Accounts` and configure your Let's Encrypt account. Optionally configure a challenge plugin such as Cloudflare if your DNS is hosted there.

!!! note
    The challenge plugin is optional. If you do not use a challenge plugin, you will need to manually add the DNS record to your DNS provider. Since NodeSpace provides PBS on a public IP, you can use the HTTP challenge.

Switch back to the `Certificates` tab and click `Add` under the ACME section. Select your challenge type. Make sure you've added a DNS record that points to your PBS server's IP and you can use the HTTP challenge. Enter the domain you would like to use for your PBS server. Click `Add`. Then click on the `Order Certificates Now` button and Proxmox will automatically submit the order with Let's Encrypt. Once the certificate is issued, it will be automatically installed and configured.