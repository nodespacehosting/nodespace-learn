# cPanel Files

![cPanel Files](images/cpanel-files-1.png)

This section contains tools for managing your files. You can upload files, create files, and manage your files. You can also manage you disk usage, backups, directory privacy, and more.

!!! note
    This section displays the third-party backup tool "JetBackup". This may not be available on your account.

## File Manager

The File Manager allows you to manage your files. You can upload files, create files, and edit your files from your web browser. The File Manager is a very powerful tool and can be used to manage your files without the need for a third-party FTP client. It makes it easy to manage your files from anywhere.

![File Manager](images/cpanel-files-manager-1.png)

### Hidden Files

By default, the File Manager does not display hidden files. You can enable hidden files by clicking the "Settings" button in the top right corner of the File Manager and then checking the "Show Hidden Files (dotfiles)" checkbox.

![File Manager Settings](images/cpanel-files-hidden-files-1.png)

As soon as this is enabled, you should see all hidden files in your account, including the `.htaccess` file.

### Edit Files

You can edit files by right clicking on the file and then clicking "Edit". This will open the file in a text editor. You can make changes to the file and then click "Save Changes" to save the file.

![File Manager Edit File](images/cpanel-files-manager-2.png)

Editing the file will open the file in a web-based text editor that is source code aware. This means that it will highlight the syntax of the file and make it easier to edit the file. It will also provide general warnings about potential issues with the file. For example, if you are editing a PHP file and forget to add a semicolon at the end of a line, it will warn you about this. Remember that this is not a full-fledged IDE so the warnings and help will be limited.

### Upload Files

You can upload files by clicking the "Upload" button in the top left corner of the File Manager. This will open a new window where you can drag and drop files to upload them. You can also click the "Select File" button to select files to upload.

![File Manager Upload Files](images/cpanel-files-manager-3.png)

If you are uploading files that might have the same name and you want to overwrite them, don't forget to check the "Overwrite existing files" checkbox. Otherwise the files will be uploaded with a number appended to the end of the file name.

### Create Files and Folders

You can create files and folders by clicking the "New File" or "New Folder" buttons in the top left corner of the File Manager. This will open a new window where you can enter the name of the file or folder. You can also create files by right clicking on a folder and then clicking "New File". You can create folders by right clicking on a folder and then clicking "New Folder".

When you create a file or folder, you will need to provide a name for it. You can also provide a path for the file or folder. If you do not provide a path, the file or folder will be created in the current directory. If you provide a path, the file or folder will be created in the specified directory. You can also provide a file extension for the file. If you do not provide a file extension, the file will be created without a file extension.

### Copy and Move Files and Folders

You can copy and move files and folders by right clicking on the file or folder and then clicking "Copy" or "Move". This will open a new window where you can select the destination directory. You can also copy and move files and folders by dragging and dropping them to the destination directory.

### Rename Files and Folders

You can rename files and folders by right clicking on the file or folder and then clicking "Rename". This will open a new window where you can enter the new name for the file or folder. You can also rename files and folders by clicking the "Rename" button in the top left corner of the File Manager.

### Delete Files and Folders

You can delete files and folders by right clicking on the file or folder and then clicking "Delete". This will open a new window where you can confirm the deletion. You can also delete files and folders by clicking the "Delete" button in the top left corner of the File Manager. When you delete items, they will go to a trash folder. You can restore items from the trash folder or permanently delete them. The trash folder is located at `/.trash`. You also have the option to permanently delete items when you delete them.

!!! warning "Trash items count towards your disk usage"
    Items in the trash folder count towards your disk usage. If you are running out of disk space, you should empty your trash folder.

### Compress Files and Folders

You can compress files and folders by right clicking on the file or folder and then clicking "Compress". This will open a new window where you can select the compression type. You can also compress files and folders by clicking the "Compress" button in the top left corner of the File Manager. When you compress items, they will be compressed into a zip file. You can then download the zip file and extract it on your computer.

### Extract Files and Folders

You can extract files and folders by right clicking on the file or folder and then clicking "Extract". This will open a new window where you can select the extraction type. You can also extract files and folders by clicking the "Extract" button in the top left corner of the File Manager. When you extract items, they will be extracted into a folder with the same name as the zip file. You can then delete the zip file.

### Change Permissions

You can change the permissions of files and folders by right clicking on the file or folder and then clicking "Change Permissions". This will open a new window where you can select the permissions. You can also change the permissions of files and folders by clicking the "Change Permissions" button in the top left corner of the File Manager. When you change the permissions of a file or folder, you can select the permissions for the owner, group, and others. You can also select whether to apply the permissions recursively to all files and folders in the directory.

### View File Details

You can view the details of files and folders by right clicking on the file or folder and then clicking "View". This will open a new window where you can view the details of the file or folder. You can also view the details of files and folders by clicking the "View" button in the top left corner of the File Manager. When you view the details of a file or folder, you can view the file size, permissions, owner, group, and last modified date.

### Search Files and Folders

You can search for files and folders by clicking the "Search" button in the top left corner of the File Manager. This will open a new window where you can enter the search term. You can also search for files and folders by right clicking on the file or folder and then clicking "Search". When you search for files and folders, you can search for files and folders by name, size, permissions, owner, group, and last modified date.

### HTML Editor

You can edit HTML files by right clicking on the file and then clicking "HTML Editor". This will open a new window where you can edit the HTML file. You can also edit HTML files by clicking the "HTML Editor" button in the top left corner of the File Manager. When you edit an HTML file, you can edit the HTML file in a web-based HTML editor. This editor will highlight the syntax of the HTML file and make it easier to edit the file. It will also provide general warnings about potential issues with the file. For example, if you forget to close a tag, it will warn you about this. Remember that this is not a full-fledged IDE so the warnings and help will be limited. This will also give you a WYSIWYG editor to edit the HTML file. This will allow you to see what the HTML file will look like when it is rendered in a browser.

!!! note
    This editor is not a full website builder. It is only meant to be used to edit HTML files.

## Images

The images tool allows you to modify and manage images in your account. You can access the images tool by clicking the "Images" button in the "Files" section of the cPanel home screen.

![Images](images/cpanel-files-images-1.png)

### Thumbnailer

The thumbnailer tool allows you to create thumbnails of images. When you access the tool, you will navigate to a folder where images are stored. Then you can run the Thumbnailer tool to create thumbnail images.

### Scaler

The scaler tool allows you to resize images. When you access the tool, you will navigate to a folder where images are stored. Then you can run the Scaler tool to resize images.

### Converter

The converter tool allows you to convert images to different formats. For example, if you have a bunch of JPG images you wish to convert into PNG, this tool can easily convert them. When you access the tool, you will navigate to a folder where images are stored. Then you can run the Converter tool to convert images.

## Directory Privacy

This tool allows you to set a password to protect certain directories. When you access the tool, you will see a list of directories. You can click on a directory to set a password for it. You can also click on a directory to remove the password for it. When this is enabled, anyone who tries to access the directory will be prompted for a username and password. If they do not enter the correct username and password, they will not be able to access the directory.

## Disk Usage

This tool allows you to view the disk usage of your account. When you access the tool, you will see a list of directories and the amount of disk space they are using. You can click on a directory to view the disk usage of that directory. You can also click on a directory to view the disk usage of all subdirectories of that directory. This is a useful tool for helping you determine what is using up the most disk space in your account.

![Disk Usage](images/cpanel-files-disk-usage-1.png)

## Web Disk

The Web Disk tool allows you to access your account's files as if they were on your computer. When you access the tool, you will see a list of directories. You can click on a directory to view the files in that directory. You can also click on a file to download it. You can also click on a file to edit it. 

You will also need to create a special web disk account to use this feature. By default, your main cPanel account username and password can access the web disk. You should create additional users if others will be using this tool or you want to restrict where they are able to access.

### Connect to Web Disk

Click on the "Configure Client Access" link under Actions next to the web disk account you wish to connect to. This will open a new window where you can download the configuration file. You can then use this file to connect to the web disk.

![Configure Client Access](images/cpanel-files-web-disk-1.png)

cPanel will attempt to detect the operating system you are using and provide you with the appropriate configuration file. If it does not detect your operating system correctly, or you are configuring access for a different system, you can use the drop down link for each appropriate system.

!!! note "macOS 10.14 and later"
    If you are using macOS 10.14 or later, you will need to use the "macOS 10.13 High Sierra" configuration. If you are using an older version, use the appropriate configuration for your version.

## FTP Accounts

