# Contributing to the Documentation

We welcome contributions from the community! If you find any errors or have any suggestions, please feel free to open an issue or submit a pull request. We appreciate your help in making this site better for everyone! This is our contribution guide. This guide contains information about how to contribute to this site. Please review this guide to learn about our documentation standards, how this site is organized, and how to contribute to this site.

## How This Site is Organized

This site uses mkdoc to generate documentation from markdown files. The file structure is laid out as follows:

```
.contributing/ - Contains templates that you can use to get started.
docs/ - Contains the documentation files. All of the documentation files are located in this directory.
├─ assets/ - Contains the assets for the site such as logos (Do not edit these files).
├─ images/ - Contains images for top-level pages.
├─ stylesheets/ - Contains the stylesheets for the site (Do not edit these files).
└─ <subject>/ - Contains the files for the subject.
   ├─ images/ - Contains images for the subject.
   └─ <topic>.md - Contains the documentation for the topic.
overrides - Contains overrides for the mkdocs theme (Do not edit these files).
mkdocs.yml - Contains the configuration for the mkdocs site.
```

Content is laid out in the `docs/` directory and each subject has a similar structure:

```
docs/
└─ subject
   ├─ topic/- Use a directory if the topic has multiple pages.
   ├─ topic.md - The main page for the topic.
   └─ images/ - Contains images for the topic.
   
```

If a subject is further nested, the structure is the same:

```
docs/
└─ subject
   ├─ topic/- Use a directory if the topic has multiple pages.
   │  ├─ subtopic/- Use a directory if the topic has multiple pages.
   │  ├─ subtopic.md - The main page for the subtopic.
   │  └─ images/ - Contains images for the subtopic.
   ├─ topic.md - The main page for the topic.
   └─ images/ - Contains images for the topic.
   
```

This allows easier documentation as everything is grouped together, including images. This also allows for faster documentation writing as if you need to link to an image, you can just use the relative path to the image, same for linking to pages.

## How this Site is Built

This site uses mkdocs to generate documentation from markdown files. The site is built using the mkdocs-material theme. To build this site, you need a few prerequisites:

- Python 3.6 or higher (do not use the system Python on *NIX systems, including macOS)
- mkdocs
- mkdocs-material
- neoteroi-mkdocs
- mkdocs-git-revision-date-localized-plugin
- mkdocs-redirects **(Required soon, not currently implemented)**
- mkdocs-awesome-pages-plugin **(Required soon, not currently implemented)**

Once these requirements are met, you can easily build a local copy of the site for testing and writing documentation.

!!! note
    If you change anything except the documentation files, your pull request will be rejected. This includes the overrides directory, the assets directory, and the stylesheets directory. If you want to change the theme, please open an issue first to discuss the changes. If you are fixing a style issue, please open an issue first to discuss the changes.

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

## Contribution License

Our documentation is licensed under CC-BY-SA 4.0. This means that you can use our documentation as long as you give us credit and share your changes under the same license. You can read more about this license [here](https://creativecommons.org/licenses/by-sa/4.0/). By contributing, you agree to make your contributions available under this license.