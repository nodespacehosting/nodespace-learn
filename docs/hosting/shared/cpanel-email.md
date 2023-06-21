# cPanel Email

![cPanel Email](images/cpanel-email-1.png)

The Email section lets you manage all tools related to email with your account.

## Email Accounts

![Email Accounts](images/cpanel-email-2.png)

Email Accounts lets you add, remove, and restrict email accounts from within your account. By default, your account will have a system account. This `<cpanel username>@<domain>` account also doubles as a catchall email account by default. 

!!! note
    We recommend that you disable the catchall account as it can quickly use up your disk space. You can disable the catchall account by clicking on the "Manage" button next to the account and then clicking on the "Disable" button.

### Create Email Account

To create an email account, you will want to click on the Create button. When you create an account, you will be able to select a domain name, set a username, and password. You can also set a quota for the account. The quota is the amount of disk space that the account can use. If you do not set a quota, then the account will be able to use as much disk space as it wants (up to the account's disk space limit).

![Create Email Account](images/cpanel-email-3.png)

In most cases, just selecting a domain name (if you have more than one domain on your account), setting a username, and a password are enough. 

!!! warning
    **Help prevent spam:** select a strong password for your email accounts. Accounts that are hacked are used to send spam and our systems will suspend entire hosting accounts that are found to be sending spam.

If you want to set additional options, select Optional Settings.

![Create Email Account](images/cpanel-email-4.png)

You can set a quota and enable creation of folders for Plus Addressing.

!!! note
    Email accounts use your disk space quota. If your disk space quota is met, users will not be able to send or receive emails.

### Connect Email Accounts

Once you create an email account, you will want to either provide instructions for the user of the email address to connect to it or add it to programs like Microsoft Outlook or Mail on your phone. 

On the email account you want to connect, click the "Connect Devices" button. You will see several options to connect. 

![Connect Email Accounts](images/cpanel-email-6.png)

Clicking on a link will automatically configure the device for the the protocol selected.

### Manual Connection Settings (Most Common)

This section shows you what settings are required to be configured to connect most email clients to the email address. 

![Manual Connection Settings](images/cpanel-email-5.png)

!!! note
    We do not recommend using non-SSL/TLS settings. NodeSpace may disable insecure authentication in the future.

Enter the settings as shown. Your email application should connect.

!!! note
    You may have issues if you're using external DNS such as Cloudflare. The server name may be different than what is shown or require additional configuration. Our support team can assist.

## Forwarders

Email Account Forwarders allow you to create forwarders for either an email address or an entire domain. You can setup the appropriate type for forwarder based on what you are trying to accomplish.

![Forwarders](images/cpanel-email-forwarders-1.png)

Email Account Forwarders let you forward email for an email address on the system to another email address. The email address that you forward to can be external. For example, you can forward bob@example.com to bobsp@example.org. You can also forward bob@example.com to bob_smith@example.com. 

!!! note
    Forwarders do not store email. If you want to store email, you will want to use an email account.

### Create an Email Forwarder

At the top of the page, click on the Add Forwarder.

![Create an Email Forwarder](images/cpanel-email-forwarders-2.png)

Type in the email address to forward and then select the destination. The destination can be an external email address or another email address in your account. The forwarding address does not have to exist on the system either. 

!!! note
    Forwarders can be used if you do not use a catch all address or if you want email for a certain address going to a certain account. Forwarders can be used if a user changes their name or you need to redirect email.

Advanced options allow you to forward to a system account or pipe to a program. 

!!! note
    Piping to a program is an advanced feature. 

### Email Domain Forwarders

Email Domain Forwarders allow you to forward all email for a domain to another domain. For example, you can forward all email for example.com to example.org.

![Email Domain Forwarders](images/cpanel-email-forwarders-3.png)

To create an email domain forwarder, click on the Add Domain Forwarder button.

![Create an Email Domain Forwarder](images/cpanel-email-forwarders-4.png)

Enter the domain you want to forward to. For example, if you want to forward all email addresses to a new domain, enter the new domain name. 

## Email Routing

The Email Routing feature tells the system how to process email for the domain selected. Typically, this setting does not need to be adjusted or changed.

![Email Routing](images/cpanel-email-routing-1.png)

| Routing Setting | Description |
| --------------- | ----------- |
| Automatically Detect Configuration | This setting will automatically detect the best setting for your domain. |
| Local Mail Exchanger | This setting will deliver email locally if the email address exists on the system. If the email address does not exist, the email will be sent to the remote mail exchanger. |
| Backup Mail Exchanger | This setting will deliver email locally if the email address exists on the system. If the email address does not exist, the email will be sent to the remote mail exchanger. |
| Remote Mail Exchanger | This setting will deliver email to the remote mail exchanger. |

### Email Routing With Office 365/Google Workspace

If you're using Office 365, Google Workspace, or another external email provider, you should set the setting to Local Mail Exchanger. 

## Autoresponders

The Autoresponders function allows you to setup an automatic reply on an email address. Typically, this is used for out of office or vacation replies. This can also be used to send a reply that the email was received. Like for example, you can setup an autoresponder for support@example.com that thanks the user for their email and that it has been received and your team will reply to them shortly. 

![Autoresponders](images/cpanel-email-autoresponders-1.png)

### Create an Autoresponder

To create an autoresponder, click on the Add Autoresponder button.

![Create an Autoresponder](images/cpanel-email-autoresponders-2.png)

Enter the email address you want to setup the autoresponder for. You can also select a domain if you have more than one domain on your account.

![Create an Autoresponder](images/cpanel-email-autoresponders-3.png)

Enter the From, Subject, and Body of the autoresponder. You can use the following variables in the body of the autoresponder:

| Variable | Description |
| -------- | ----------- |
| %subject% | The subject of the email. |
| %from% | The email address of the sender. |
| %email% | The email address of the recipient. |
| %date% | The date the email was received. |
| %time% | The time the email was received. |

You can also select the start and stop time for the autoresponder. This is useful if you want to setup an autoresponder for a vacation or out of office.

![Create an Autoresponder](images/cpanel-email-autoresponders-4.png)

## Default Address

The Default Address option works as the catchall address in cPanel. If the system receives an email for your domain and a forwarder or mailbox doesn't exist for the email, then the message will be delivered to the default address. By default, this is your cPanel's username at your primary domain name. You may want to disable this functionality or change the default address to a person or shared mailbox like info@example.com.

![Default Address](images/cpanel-email-default-address-1.png)

This mailbox can easily fill up and is one of the main contributors to running out of disk space in your account. You should check this account or delete email from it often.

!!! warning
    If you choose to forward the default account to a user, they may suddenly receive a lot of spam. Spammers will blast emails to addresses that don't exist.

!!! note
    While it's not recommended to discard the messages sent to the default address, this option can help ensure your account doesn't fill up with spam.

### Change the Default Address

To change the default address, click on the Change button.

![Change the Default Address](images/cpanel-email-default-address-2.png)

Select the option you want to use for the default address. You can also select the Discard option to discard the email.

![Change the Default Address](images/cpanel-email-default-address-3.png)

## Mailing Lists

Mailing Lists on cPanel are not like the traditional distribution lists you may be familiar with. The mailing lists are powered by Mailman, which is a type of list server software. While sending an email to a mailing list address will distribute it to all members, its primary function is to act like a discussion mailing list. Discussion mailing lists predate Internet forums and this is what they are still typically used for. 

### Create a Mailing List

![Mailing Lists](images/cpanel-email-mailing-lists-1.png)

Give your list a name and select a strong password. The list name is the email address of the list. This password is the administrator password for managing the list. Select the access type. Public means that any one is permitted to register and join the list. Private means that they must be admitted by the list administrator.

To post to the list, users send an email to the name you gave the list and the domain, just like a regular email.

### Manage a Mailing List

From the Mailing Lists page, find your existing list under Current Lists and click on Manage. If prompted, this is where you would need to enter the list password you set. 

![Manage a Mailing List](images/cpanel-email-mailing-lists-2.png)

A new browser tab will open and you'll be taken to the administrative interface for the mailing list. This interface contains a lot of different options for the list and allows you to customize a lot of different parts.

![Manage a Mailing List](images/cpanel-email-mailing-lists-3.png)

### Public Mailing List

It's important that if you make any list public, not only can members of the general public subscribe to the list, the messages posted to the list also become public and indexable by search engines. This also includes full email addresses. The following is a screenshot of an example posted to a public list.

![Public Mailing List](images/cpanel-email-mailing-lists-4.png)

!!! warning 
    Mailing list public archives may violate privacy laws such as GDPR. Use with caution.

## Delivery Reports

!!! note
    This is a helpful troubleshooting tool you can use to determine if an email message was delivered or not.

You can enter the recipient's email address and run a report or you can run a report for all emails. Additionally, you can run a report for just blocked and failed emails.

The information in this report can help Technical Support diagnose any issues. You can include information from this report in a ticket to assist with troubleshooting.

This report can be very technical and if you don't understand everything in the report, please open a ticket with technical support.

![Delivery Reports](images/cpanel-email-delivery-report.png)

## Email Filters

Email filters allow you to setup rules for how email is handled. You can setup rules to delete email, forward email, or send an autoresponder. You can also setup rules to move email to a specific folder.

### Global Email Filters

This is an advanced feature that lets you take action on emails based on the rules that you setup here. Global Email Filters apply to all email accounts.

![Global Email Filters](images/cpanel-email-filters-1.png)

You can add multiple rules to a filter as well as different actions such as redirecting the message to another email address, discarding the message, deliver to a folder, etc.

### Email Filters

These work similarly to Global Email Filters except they apply only to the email address they're created under. Functionally, they work the same as Global Email Filters and have the same functionality. 

![Email Filters](images/cpanel-email-filters-2.png)

