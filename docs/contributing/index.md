# Contributing to the Documentation

We welcome contributions from the community! If you find any errors or have any suggestions, please feel free to open an issue or submit a pull request. We appreciate your help in making this site better for everyone! This is our contribution guide. This guide contains information about how to contribute to this site. Please review this guide to learn about our documentation standards, how this site is organized, and how to contribute to this site.

## How This Site is Organized

This site uses mkdoc to generate documentation from markdown files. The file structure is laid out as follows:

```
/.contributing - Contains templates that you can use to get started.
/docs - Contains the documentation files. All of the documentation files are located in this directory.
|- /assets - Contains the assets for the site such as logos (Do not edit these files).
|- /images - Contains images for top-level pages.
|- /stylesheets - Contains the stylesheets for the site (Do not edit these files).
/overrides - Contains overrides for the mkdocs theme (Do not edit these files).
mkdocs.yml - Contains the configuration for the mkdocs site.
```

Content is laid out in the `/docs` directory and each subject has a similar structure:

```
/docs
|- /subject
|-- /topic - Use a directory if the topic has multiple pages.
|-- topic.md - The main page for the topic.
|-- /images - Contains images for the topic.
```

If a subject is further nested, the structure is the same:

```
/docs
|- /subject
|-- /topic
|--- /subtopic - Use a directory if the subtopic has multiple pages.
|---- /images - Contains images for the subtopic.
|--- subtopic.md - The main page for the subtopic.
|--- /images - Contains images for the topic.
|-- topic.md - The main page for the topic.
```

This allows easier documentation as everything is grouped together, including images. This also allows for easier linking between pages as the links are relative to the current page.

## Building the Site

If you want to build the site locally, you can use the following command:

```
mkdocs build
```

This will build the site in the `site` directory. You can then use a web server to serve the site from the `site` directory. If you want to build the site and serve it locally, you can use the following command:

```
mkdocs serve
```

This will build the site and serve it locally at [http://localhost:8000](http://localhost:8000). This is useful for testing your changes before submitting a pull request.  

Make sure you have the `site` directory in your `.gitignore` file. This will prevent you from accidentally committing the built site to the repository.
