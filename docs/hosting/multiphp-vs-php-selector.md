On all of our shared and reseller cPanel hosting plans, you will find two options when it comes to PHP - they both are very similar, but offer major differences.

You should primarily use Select PHP Version ("PHP Selector") as it offers performance improvements and more self-service options. However, newer versions of PHP and PHP modules are not added as quickly. If you need a newer PHP version or module, you should use MultiPHP.

MultiPHP also offers the benefit of being able to run multiple PHP version per domain or directory basis. For example, example.com can run PHP 8.1 while a legacy app installed at example.com/app can run PHP 7.4. PHP Selector does not offer this functionality - you can only run one PHP version per domain or subdomain.

Also, keep in mind when using PHP Selector that if the version in Select PHP Version does not match the ALT-PHP version chosen in MultiPHP it will not work properly.

When you use MultiPHP, you will see two versions of PHP to select from, EA-PHP and ALT-PHP. The EA version is supplied by cPanel and you can adjust these settings using MultiPHP INI Editor. However, if you select an ALT version, supplied by CloudLinux, MultiPHP INI Editor settings will have no effect on it. You will need to edit those settings in Select PHP Version > Options and select the PHP version you're using. From there, you can make changes.

If you have any questions, please contact support and we'll be happy to clarify.