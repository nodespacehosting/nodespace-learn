# How to prepare a Proxmox VE node for management with Ansible

Ansible has been providing a Proxmox module since version 5.6.0. To manage a Proxmox VE node for management with Ansible, you need to prep your Proxmox node(s). 

## Required Python modules

These modules need to be installed on each Proxmox host:

- Proxmoxer
  - With "requests"

This will need to be done from the CLI. Either SSH to your Proxmox host node or access the shell from the web interface as the root user. 

    pip3 install proxmoxer
    pip3 install requests

!!! note 
    If you receive an error that `pip3` is not found, install it with `apt install python3-pip`. It may not be installed on your system by default.

## Recommended additional actions

Additionally, for security, we recommend creating a local ansible user that can use sudo. By default, Debian (and in return, Proxmox) do not come with sudo installed. You will need to install the sudo package.

```
apt install sudo
```

And then create an ansible user. You can call this user whatever you would like, but it should be only used for Ansible to login to the system.

```
adduser ansible
```

!!! note
    Debian (and Proxmox) suggest using `adduser` instead of `useradd` per the man page for `useradd`.

Provide a secure password and also add a SSH key if you do not permit SSH login via passwords (recommended). 

Add the ansible user to the sudo group:

```
usermod -a -G sudo ansible
```

You can now proceed with Ansible setup and configuration.

Additionally, you can choose to also allow this user to manage VMs via the Proxmox API. To do this, login to the Proxmox GUI after creating the user. Go to Datacenter > Users > Add. Add the user that you created. Using our example, the username is ansible. Realm will be Linux PAM. Click on Add. Now you can adjust permissions. Provide significant permissions (recommended to match root unless you will have different users perform different tasks).

## Procedure

You're now ready to configure Proxmox for management through Ansible. Follow the steps outlined here.

### Configure API key

Login to the Proxmox GUI and go to Datacenter > Permissions > API Tokens. Click Add. Select your user. Either check or uncheck privilege separation. This allows you to control what actions are permitted with the API token. In more secure environments, you should separate duties by token. In other environments, you can typically use a single token.

Once the token is generated, copy it and secure it. It will not be shown again and cannot be retrieved after. 

### Create your Ansible management files

Now you can create your inventory and playbooks. For examples, please refer to [Ansible's documentation](https://docs.ansible.com/ansible/latest/collections/community/general/proxmox_module.html) with examples.

### Security Considerations

This guide does not provide any information on how to secure your secrets or passwords. We strongly recommend learning how to use ansible-vault to protect sensitive credentials. 

!!! danger
    Be careful if you decide to store secrets in plain text (or vault passwords) in version control systems. Security is out-of-scope for this article and you are fully responsible for securing your systems.