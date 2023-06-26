# Windows Server

![Windows Server](../images/oslogos/windows.png){: align=right style="width: 150px; margin: 0 0 10px 10px;" }

Windows Server is a group of operating systems designed by Microsoft that supports enterprise-level management, data storage, applications, and communications. Previous versions of Windows Server have focused on stability, security, networking, and various improvements to the file system. Other improvements also have included improvements to deployment technologies, as well as increased hardware support.

!!! note "Windows Server is a paid operating system"
    Windows Server is a paid operating system. You can purchase a license from Microsoft or a Microsoft reseller. NodeSpace currently **does not** offer Windows Server licenses.

!!! warning "Bring Your Own License"
    If you have a Windows Server license, you can use it on your NodeSpace server. You will need to provide your own license key. This can be provided during the order process or by opening a support ticket. Otherwise, we will install a trial version of Windows Server which is good for 180 days.

## What versions of Windows Server are available?

| Current Version | Supported Until |
| --------------- | --------------- |
| Windows Server 2022 | October 14, 2031 |
| Windows Server 2019 | January 9, 2029 |

## Using Windows Server

Windows Server is managed through Windows Remote Desktop (RDP). You can connect to your server using the Remote Desktop Connection application on Windows or the Microsoft Remote Desktop application on macOS. You can also use the Remote Desktop Connection application on Linux.

Additionally, PowerShell is available for remote management of your server. You can connect to your server using PowerShell by running the following command:

```
Enter-PSSession -ComputerName <ip address> -Credential <username>
```

!!! note
    You must enable PowerShell remoting on your server before you can connect to it. You can do this by running the following command on your server:

    ```
    Enable-PSRemoting -Force
    ```

!!! danger 
    You should restrict access to PowerShell remoting to only trusted IP addresses. You can do this by running the following command on your server:

    ```
    Set-Item WSMan:\localhost\Client\TrustedHosts -Value <ip address>
    ```

