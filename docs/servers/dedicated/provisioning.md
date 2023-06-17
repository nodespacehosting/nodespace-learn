# Server Provisioning Process

## Introduction

This will guide you through the provisioning process for a new dedicated server. This process is the same for both managed and unmanaged dedicated servers. The only difference is that managed dedicated servers include full management and support from our team of experts, while unmanaged dedicated servers include basic management and support from our team of experts.

## 1. Order a Dedicated Server

The first step is to order a dedicated server. You can do this by visiting our [dedicated servers page](https://www.nodespace.com/servers/dedicated) and selecting the server you would like to order. You can also contact our sales team and we will be happy to assist you.

## 2. Pay Your Invoice

Once you have ordered your dedicated server, you will receive an invoice for the first month's service. Our services are billed in advance, so you will need to pay this invoice before we can provision your server. You can pay your invoice by logging into the [NodeSpace Client Portal](https://my.nodespace.com) and clicking on the invoice. You can pay your invoice using a credit card or PayPal.

!!! note
    Even though your invoice starts on the day you order your server, should your server not be provisioned until a later date, your invoice will be prorated to reflect the actual date of provisioning. For example, if you order your server on the 12th of the month, but your server is not provisioned until the 13th of the month, your billing cycle will start on the 13th and run through the 12th of the following month.

## 3. Provisioning Process Begins

Once you have paid your invoice, our provisioning process will begin. This process can take up to 24 hours to complete. During this time, we will be setting up your server and installing the operating system and control panel you selected when you ordered your server. Once this process is complete, we will send you an email with your server's login information.

### 3.1. Provisioning Time

The provisioning process can take up to 24 hours to complete. This time is dependent on a number of factors, including the operating system and control panel you selected when you ordered your server. 

!!! question "Why are servers not instantly deployed?"
    While we have the resources and capability to instantly deploy servers, we have found that this process removes a very critical element from the process: **quality control**. By manually provisioning each server, we are able to ensure that each server is configured correctly and that all of the necessary software is installed. This process also allows us to ensure that each server is configured to our standards and that each server is configured to meet your needs. It also allows us to ensure that all components are working properly and that there are no issues with the server that could cause downtime later on.

## 4. Server is Ready

Once your server is ready, we will send you an email with your server's login information and how to access your server. You can then log into your server and begin using it.

!!! danger "Change your root password!"
    While we make every effort to ensure our emails are sent with TLS encryption, this is not always possible and email is, by its nature, insecure. You should change the root password immediately. You can do this by logging into your server and running the following command:
    
    ```bash
    passwd
    ```
    
    You will then be prompted to enter your current password and then your new password. You should choose a strong password that is at least 8 characters long and contains a combination of letters, numbers, and special characters. You should also avoid using dictionary words or common phrases. You should also avoid using the same password for multiple servers or services.

!!! tip
    If you are using a control panel, such as cPanel or Plesk, you can change your root password from within the control panel.

!!! note
    If your server is managed, you will find a secondary admin account on the server called `datacadmin` or `nodespace`. This account is used by our team of experts to manage your server. You should not use this account. Please do not change the password, disable, delete, or otherwise modify this account. Doing so may result in our team being unable to manage and monitor your server.