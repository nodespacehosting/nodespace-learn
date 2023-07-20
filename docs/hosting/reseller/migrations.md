# Migrating Accounts to Your Account

You may have clients that have accounts with other hosting providers that you would like to migrate to your account. This guide will walk you through the process of migrating accounts from other hosting providers to your account.

!!! warning "Migrations are offered as a courtesy service and are not guaranteed"
    NodeSpace offers account migrations as a courtesy service. We will do our best to migrate your accounts, but we cannot guarantee that we will be able to migrate your accounts or that they will be migrated error-free. We will not be held liable for any issues that arise from the migration process. We strongly recommend that you have a backup of your account(s) before migrating them to your account and have a "Plan C" in case the migration does not go as planned or we are unable to migrate.

    **Migrations, especially large accounts and manual migrations, can take hours and sometimes days.** We will do our best to migrate your accounts as quickly as possible, but we cannot guarantee that we will be able to migrate your accounts at a specific time or that the migration will be completed within a specific time frame. We will let you know if we are unable to accommodate your requested migration date or if there are any issues with the migration.

## Pre-Migration Checklist

Before you begin the migration process, you should make sure that you have the following information:

- The domain name(s) of the account(s) you are migrating
- The username(s) and password(s) of the account(s) you are migrating
- The IP address(es) of the account(s) you are migrating or the server hostname(s) the account(s) are on
- The control panel software the account(s) are using (cPanel, Plesk, etc.)
- Specific versions of software the account(s) are using (PHP, MySQL, etc.)
- The amount of disk space and bandwidth the account(s) are using

At this point, you should also make sure that your account has enough disk space and bandwidth to accommodate the account(s) you are migrating as well as available cPanel accounts. If you need to upgrade your account, you can do so from the [NodeSpace Client Area](https://my.nodespace.com). Remember that we utilize soft quotas, so while you may still be able to have accounts transferred, you may incur overages. 

!!! note
    You should give your clients a heads up that you will be migrating their accounts. This will help prevent any confusion or issues with their email or website, especially during the DNS propagation period. During the migration, websites should be placed in maintenance mode or read-only mode to prevent any data loss.

### Contact NodeSpace Support

Once you have gathered the information above, you should contact NodeSpace support to let us know that you will be migrating accounts to your account. Please let us know your proposed migration date and the accounts you will be migrating along with their associated details. You should also give us a heads up about any specifics that we should be aware of, such as custom software or configurations like if a site needs PHP 7.4 instead of PHP 8.2. Our servers default to PHP 8.1 so there may be issues if you are migrating a site that requires an older version of PHP.

!!! warning "Account Migration Times"
    Account migrations are performed on a first-come, first-served basis. We will do our best to accommodate your requested migration date and time, but we cannot guarantee that we will be able to migrate your accounts at a specific time. We will let you know if we are unable to accommodate your requested migration date or if there are any issues with the migration.

Please also let us know if the account being migrated uses a control panel other than cPanel. We can migrate accounts from other control panels, but we will need to know the control panel software and version. In some cases, we may not be able to migrate accounts from other control panels directly and must perform a manual migration. Manual migrations take longer and we only migrate websites and databases. We do not migrate email accounts or settings from other control panels.

## Migrating Accounts

Once you have contacted NodeSpace support and we have confirmed that we can migrate your accounts, we will begin the migration process. The migration process will vary depending on the control panel software the account is using.

The easiest accounts for us to manage are those on other cPanel servers. We can migrate accounts from other cPanel servers directly and the process is fairly quick. cPanel migrations can also be done "online" (meaning the website doesn't necessarily need to be placed in maintenance mode though we still recommend it) and we can migrate email accounts and settings as well.

!!! warning "Database Migration Issues"
    We have seen issues with database migrations from cPanel to cPanel where the database is not migrated properly. This is usually due to the database being corrupted or having a large number of data. If cPanel cannot migrate the database, it will place a copy of the raw database in the migrated user account. You will need to manually import the database into the new account. If you are unable to import the database, you may need to repair the database or contact the developer of the software that uses the database for assistance. **We do not provide DBA services.**

It is also fairly easy for us to migrate Plesk accounts to cPanel without many issues. The process is similar to cPanel-to-cPanel, but there are some differences in Plesk accounts and cPanel accounts. Plesk accounts are migrated on a best-effort basis.

If you're using another control panel or even no control panel, we can still migrate your accounts but we will need to perform a manual migration. 

!!! warning "Common Migration Issues"
    Unfortunately, not every migration goes smoothly. If the other hosting provider is running security software such as CSF, it can trigger and block our server from being able to access the account. In some cases, we have to perform a full cPanel backup and then migrate using the backup. This can take longer and it will not update DNS records automatically. 

    We have also seen issues when trying to migrate from MariaDB to MySQL (which our servers currently run). In some cases, we can migrate the database through a cPanel backup and restore, but sometimes it doesn't work. In these cases, you (or your client) will need to talk with the software vendor or hire DBA services. **We do not provide DBA services.**

    Email issues are another common pitfall. Email servers are used to seeing the domain at one IP but then they see mail coming from another. If you had to manually update your DNS, make sure you update your SPF records to include the new IP address. If you're using a third-party email provider, you will need to update your MX records to point to the new IP address.

### Manual Migration Tips

**It may be easier to export/import the website.** If the only data in the account is a WordPress website, for example, it might be easier to use a plugin such as [All-in-One WP Migration](https://wordpress.org/plugins/all-in-one-wp-migration/) to export the website and then import it into the new account. This will allow you to migrate the website including the database. We strongly recommend using this method, especially for WordPress websites, as it will be much easier than trying to manually migrate the website and database in our experience.

**Clean up the account.** It might be best to clean up the account - remove old backup files, archives, logs, etc. that are no longer needed and are consuming disk space. Same thing with the database. This will make the migration process faster and easier.

**Migrate email by downloading it to your computer.** If you are migrating email accounts, you can download the email to your computer using an email client such as Outlook or Thunderbird. This will allow you to migrate the email by saving the email to a file. When the new email account is setup in cPanel, you can then connect Outlook or Thunderbird, then drag and drop the email from the exported file to the new email account. **Keep in mind with manual migrations we do not migrate email.**

## Post-Migration Checklist

Once the migration is complete, you should make sure that everything is working properly. You should also make sure that your clients are able to access their websites and email. 

!!! note "cPanel-to-cPanel Migrations"
    During a cPanel-to-cPanel migration, cPanel will update the DNS records for the domain(s) being migrated to point to the new server. This will cause the website and email to stop working on the old server and start working on the new server. However, DNS changes can take up to 24 hours to fully propagate. During this time, some users may still see the old website and email while others will see the new website and email. This is normal and will resolve itself once DNS propagation is complete.

This is when differences between servers arise such as PHP versions, missing PHP modules, etc. If you notice blank web pages, broken pages, error messages, etc., please review the `error_log` file in the account's `var/logs` directory (or sometimes the web application's `logs` directory). This will usually provide some insight into what is causing the issue. If you are unable to resolve the issue, please contact NodeSpace support for assistance.

!!! tip
    If you're seeing PHP deprecated warnings or errors, you can try using an older PHP version.

**If the migration did not go smoothly or there were issues, please first accept our sincere apologies. We do our best to make sure that migrations go smoothly, but sometimes there are issues that are out of our control.** If you are having issues with the migration, please contact NodeSpace support for assistance. We will do our best to resolve the issue as quickly as possible.