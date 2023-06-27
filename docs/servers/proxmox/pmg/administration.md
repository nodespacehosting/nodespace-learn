# Administration Settings

The Administration Settings page allows you to configure various settings for your Proxmox Mail Gateway installation. This page is divided into several sections, each of which is described below.

## Main Server Administration

This dashboard will look familiar if you use Proxmox VE. You will see system graphs for your CPU, RAM, disk, and network usage. You have buttons to access the server console, restart, and shutdown PMG. 

The **services** tab will let you see the status of all services running on your PMG server. You can also start, stop, and restart services from this page.

The **updates** tab will let you see the status of all updates for your PMG server. You can also install updates from this page.

The **repositories** tab will let you see the status of all repositories for your PMG server. You can also add, edit, and delete repositories from this page. If you do not have a PMG subscription, you can disable the `enterprise` repository and enable the `no-subscription` repository. This will allow you to install updates without a subscription.

!!! note
    While PMG is built upon Debian which is a very stable Linux distribution, the `no-subscription` repository is not as stable as the `enterprise` repository. The `no-subscription` repository is updated more frequently and may contain bugs or other issues. We recommend that you only use the `no-subscription` repository if you are comfortable with troubleshooting issues that may arise.

The **syslog** tab will show you all syslog messages in real-time. You can also filter messages by timespan.

The **tasks** tab will show you all tasks that are currently running, and have ran, on your PMG server.

## Spam Quarantine

The Spam Quarantine page allows you to view and manage all spam messages that have been quarantined by PMG. You can view messages by date, sender, recipient, subject, and score. You can also release messages from quarantine, delete messages, and download messages.

## Virus Quarantine

The Virus Quarantine page allows you to view and manage all virus messages that have been quarantined by PMG. You can view messages by date, sender, recipient, subject, and score. You can also release messages from quarantine, delete messages, and download messages.

## Attachment Quarantine

The Attachment Quarantine page allows you to view and manage all messages that have been quarantined by PMG due to attachments. You can view messages by date, sender, recipient, subject, and score. You can also release messages from quarantine, delete messages, and download messages.

## User Whitelist

This will let you manually bypass spam checking for certain domains or email addresses.

## User Blacklist

This will let you manually mark emails from certain domains or email addresses as spam.

## Tracking Center

The Tracking Center page allows you to view and manage all messages that have been tracked by PMG. You can view messages by date, sender, recipient, subject, and score and their assoicated log lines. This is useful to see if a message was delivered or not and why. It is very technical. 

## Queues

The Queues page will show you the current mail queue that PMG is processing. The queue summary will break down domains with queued messages. You can flush the queue, delete all messages, and discard address verification database. 

To see why a message is in the queue, click on the Deferred Mail tab. This will show you a full list of messages. You can view messages by date, sender, recipient, subject, and why the message is being held in the queue. This can help troubleshoot technical problems. You can select a message and view the headers, flush the message, or remove the message.