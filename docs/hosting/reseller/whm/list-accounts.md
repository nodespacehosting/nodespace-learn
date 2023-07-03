# List Accounts

## Overview

You can view a list of all cPanel accounts on your reseller hosting account. You can also view the account's username, domain name, IP address, and more. You can also search for a specific account and even make simple changes to the account such as changing the account's password.

## Search for an Account

You can search for a specific account by entering the account's username, domain name, or IP address in the **Search** box. You can also click on the **Advanced Search** link to search for an account by its owner's name or email address. You can also search for accounts that are suspended or have exceeded their resource limits. You can also search for accounts that are using a specific package.

## Account Information

This section lists detailed information about each account under your reseller account. You can perform the following actions on each account:

* Click the plus icon to view the available actions for the associated account. 
* Click a domain name in the Domain column to navigate to that site.
* Click the cPanel icon to log in to the associated cPanel account.
* Click the IP address in the IP Address column to view the contents of the user’s home directory in a new browser tab.
* Click the email address in the Contact Email column to send an email to the account’s owner.
* Click the account’s assigned package (for example, default) in the Package column to open the Edit a Package interface (WHM » Home » Packages » Edit a Package). 
!!! note
    A red warning icon and Unknown appear in the Package column if the account does **not** have an assigned package.

## Actions

When you expand the information for an account, you can perform the following additional actions:

* Change Password — To change an account’s password, enter the desired password, select the desired options, and click Change.
    * Select the Synchronize MySQL password with account password checkbox if you want to use the same password for the user’s MySQL® account. 
    * Select the Enable Digest Authentication checkbox to enable Digest Authentication support.
* Change Contact Email — To change the contact email address for the account, enter a new address in the text box and click Change. 
!!! note
    The Reset Password feature uses this email address to verify the account user’s identity. If you do not set the contact email address, the user cannot use the Reset Password feature.
* Suspend Account – To suspend an account, enter a reason in the text box and click Suspend. 
!!! warning "Suspended accounts count toward your account limits"
    Suspended accounts count toward your account limits. For example, if you have a limit of 10 accounts, and you suspend 2 accounts, you can still only create 8 accounts without being charged for additional account(s).

* Account Suspended — Suspended accounts appear with the following information:
    * Reason — Displays the reason for account suspension, if the WHM user who suspended the account entered a reason.
    * Suspended — The date and time of the suspension.
    * Suspension Locked — Displays whether a system administrator has locked the suspension. Only the `root` user or users with `root`-privileges can unsuspend a locked account.
    * Unsuspend — To unsuspend an account, click Unsuspend.
* Change Quota — Click Change Quota to navigate to WHM’s Quota Modification interface (WHM » Home » Account Functions » Quota Modification). You can use this interface to change the maximum amount of disk space that the account can use on your server. 
!!! warning
    When you change a quota, we recommend that you first examine the contents of the account to ensure that the account does not already exceed the quota. If this is the case, we recommend that you request the owner of the account to remove files to comply with the new disk quota.

* Change Plan — Click Change Plan to navigate to WHM’s Upgrade/Downgrade an Account interface (WHM » Home » Account Functions » Upgrade/Downgrade an Account), where you can change the account’s package.
* Modify Account — Click Modify Account to navigate to WHM’s Modify an Account interface (WHM » Home » Account Functions » Modify an Account), where you can make changes to the account.

## Upgrade Opportunities 

| Example            | Description           | Recommended Action |
|--------------------|-----------------------|--------------------|
| <ul><li>This account exceeded its bandwidth quota last month.</li><li>This account has reached its disk quota.</li></ul> | This cPanel account recently exceeded its bandwidth limits or disk usage limits. | Consider upgrading the cPanel account’s hosting plan. |
| <ul><li>This account has used X% of its bandwidth quota for this month.</li><li>This account has used X% of its disk quota.</li></ul> | This cPanel account recently used most of its bandwidth limits or disk usage limits. | Consider upgrading the cPanel account’s hosting plan. |
| <ul><li>This account has reached the fixed block count 5120000.</li><li>This account has used X% of the block count 5120000.</li> | This cPanel account has recently used a high amount of disk space. | Consider upgrading from a shared hosting plan to a virtual private server (VPS) hosting plan. For more information about VPS hosting plans, contact [our sales team](https://my.nodespace.com/submitticket.php) and learn about our [VPS hosting](../../../servers/vps/index.md).