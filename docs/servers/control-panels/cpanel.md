# cPanel

![cPanel](images/CPanel-PNG.png){ align=right style="width: 150px; margin: 0 0 10px 10px;" }

cPanel is a web hosting control panel that allows you to manage web hosting accounts. This documentation is not designed to be comprehensive, but rather to provide a quick overview of the basics to get you started. It is designed to be used as a reference, not a tutorial. For more information, please refer to the [cPanel documentation](https://docs.cpanel.net/).

## Getting Started

To get started with cPanel, you will need to license and install cPanel on your server. 

!!! note
    You can purchase a cPanel license from NodeSpace either during the order process or at a later time. If you purchase a cPanel license from NodeSpace, we will install cPanel for you. If you purchase a cPanel license from another provider, you will need to install cPanel yourself.

### Licensing cPanel

cPanel licensing is based on whether or not the server is a physical server or a virtual server. Additionally, cPanel licensing is based on the number of accounts on the server.

!!! note "cPanel Pricing is Subject to Change"
    cPanel pricing is subject to change at any time. The pricing listed below is current as of the time of this writing. For the most up-to-date pricing, please refer to the [cPanel pricing page](https://cpanel.net/pricing/). If you purchase a cPanel license from NodeSpace, you will be billed at the current rate.

#### Physical Servers

| Number of Accounts | Monthly Price |
| ------------------ | ------------- |
| Up to 100          | $53.99        |
| 101+ (Bulk)        | $0.36/account |

!!! note "Licensed Accounts"
    Physical dedicated server licenses include 100 accounts by default. Additional accounts are automatically added to your license at a rate of $0.36/account/month.

!!! note "Billing Term"
    cPanel billing is based on a calendar month, with the billing date starting on the 1st. If you order cPanel from NodeSpace, your cPanel license will be billed monthly aligned with your server billing date. If you buy a cPanel license directly from cPanel, your license will be billed monthly on the 1st and your initial invoice will be prorated based on the number of days remaining in the month.

!!! question "What are bulk accounts?"
    cPanel calls additional accounts "bulk" accounts. Bulk accounts are accounts that are not included in the base license. For example, if you have a physical dedicated server with 150 accounts, you would pay $53.99 for the first 100 accounts and $0.36/account for the remaining 50 accounts. If the number of accounts on your server changes, your license will be automatically adjusted to reflect the new number of accounts.

#### Virtual Servers

cPanel licensing for virtual servers is more flexible than dedicated servers. This is because virtual servers are more flexible and may not be able to support as many accounts as a dedicated server. cPanel licensing for virtual servers is based on the number of accounts on the server.

| Number of Accounts | Monthly Price |
| ------------------ | ------------- |
| 1                  | $16.00        |
| Up to 5            | $25.00        |
| Up to 30           | $36.00        |
| Up to 100          | $54.00        |
| 101+ (Bulk)        | $0.36/account |

!!! note "Virtual Server (Cloud) Licenses"
    Virtual server licenses are tiered based on 1, 5, 30, and 100 accounts. For example, if you have 1 account and wish to add a second account, you need to upgrade from the Cloud Solo license to the Cloud Admin license (which includes 5 accounts). If you have 5 accounts and wish to add 2 additional accounts, you need to upgrade from Cloud Admin to Cloud Pro (which includes 30 accounts). Bulk pricing only applies to Premier and after the initial 100 accounts.

!!! note "Billing Term"
    cPanel billing is based on a calendar month, with the billing date starting on the 1st. If you order cPanel from NodeSpace, your cPanel license will be billed monthly aligned with your server billing date. If you buy a cPanel license directly from cPanel, your license will be billed monthly on the 1st and your initial invoice will be prorated based on the number of days remaining in the month.

!!! question "What are bulk accounts?"
    cPanel calls additional accounts "bulk" accounts. Bulk accounts are accounts that are not included in the base license. For example, if you have a physical dedicated server with 150 accounts, you would pay $53.99 for the first 100 accounts and $0.36/account for the remaining 50 accounts. If the number of accounts on your server changes, your license will be automatically adjusted to reflect the new number of accounts.