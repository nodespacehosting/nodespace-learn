# MySQL on Shared Hosting

MySQL is a relational database management system (RDBMS) that uses Structured Query Language (SQL). It is the most popular database system used on the web. It is used by many popular applications such as WordPress, Joomla, Drupal, and Magento. MySQL is available on all of our shared hosting plans. This section will cover how to manage MySQL databases on our shared hosting plans. If you are looking for information on how to manage MySQL databases on our dedicated or virtual servers, please see the [MySQL on Servers](../../../servers/software/mysql/index.md) section.

## Creating a MySQL Database

To create a MySQL database, you will need to log into your [cPanel](../cpanel-accessing.md) account. Once logged in, click on the **MySQL Databases** icon under the **Databases** section. [Read More](../cpanel-databases.md).

## Managing MySQL Databases

To manage your MySQL databases, you will need to log into your [cPanel](../cpanel-accessing.md) account. Once logged in, click on the **phpMyAdmin** icon under the **Databases** section. phpMyAdmin is a web-based application that allows you to manage your MySQL databases. This tool will allow you to create, edit, and delete databases, tables, and fields. It's also a great tool for importing and exporting databases. [Read about using phpMyAdmin](phpmyadmin.md).

### Remote MySQL Management

You can manage your MySQL databases remotely using a MySQL client such as [MySQL Workbench](https://www.mysql.com/products/workbench/), [Sequel Pro](https://www.sequelpro.com/), [HeidiSQL](https://www.heidisql.com/), or [dbeaver](https://debeaver.io). To connect to your database remotely, you will need to setup a [Remote MySQL Connection](remote-mysql-connections.md).

## MySQL Database Backups

You can backup your MySQL databases using the **Backup Wizard** in cPanel. [Read about backing up your MySQL databases](../cpanel-files.md#mysql-database-backup). You can also use the **phpMyAdmin** tool to export your databases. [Read about using phpMyAdmin](phpmyadmin.md). 