# Documentation Standards

In order to maintain a consistent look and feel across our documentation, we have created this document to outline our standards. This document is a work in progress and will be updated as needed.

## Table of Contents

- [Documentation Standards](#documentation-standards)
  - [Table of Contents](#table-of-contents)
  - [File Structure](#file-structure)
  - [Front Matter](#front-matter)
  - [Page Content](#page-content)
  - [Code Blocks](#code-blocks)
  - [Images](#images)
  - [Links](#links)
  - [Tables](#tables)
  - [Notes](#notes)
  - [Warnings](#warnings)
  - [Tips](#tips)
  - [Important](#important)
  - [Questions](#questions)
  - [Contributing](#contributing)
  - [License](#license)

## File Structure

The file structure for the documentation is as follows:

```
.contributing/ - Contains templates that you can use to get started.
docs/ - Contains the documentation files. All of the documentation files are located in this directory.
├─ assets/ - Contains the assets for the site such as logos (Do not edit these files).
└─ images/ - Contains images for top-level pages.
stylesheets/ - Contains the stylesheets for the site (Do not edit these files).
overrides/ - Contains overrides for the mkdocs theme (Do not edit these files).
mkdocs.yml - Contains the configuration for the mkdocs site.
```

Content is laid out in the `/docs` directory and each subject has a similar structure:

```
docs/
├─ subject/
├── topic/ - Use a directory if the topic has multiple pages.
├── topic.md - The main page for the topic.
└─ images - Contains images for the topic.
```

If a subject is further nested, the structure is the same, but with an additional level:

```
docs/
├─ subject/
├─ topic/
├─── subtopic/ - Use a directory if the subtopic has multiple pages.
├──── /images - Contains images for the subtopic.
├─── subtopic.md - The main page for the subtopic.
|--- /images - Contains images for the topic.
|-- topic.md - The main page for the topic.
```

You can continue to nest topics as needed, but try to keep the nesting to a minimum. It is recommended that you do not nest more than 3 levels deep. This is because the URL structure will begin to get very long and it will be difficult to navigate the site. For example, a page nested 3 levels deep would have a URL similar to the following:

```
https://learn.nodespace.com/subject/topic/subtopic/subsubtopic
```

## Front Matter

mkdocs does not support front matter, but we have created a workaround. The workaround is to use a markdown table at the top of the page. The table should have the following format:

```markdown
| Title | Description |
| ----- | ----------- |
| Title of the Page | A short description of the page. |
```

The table should be followed by a blank line and then the page content. The table will be hidden on the rendered page, but it will be used to populate the page title and description in the `<head>` section of the page.

## Page Content

The page content should be written in markdown. The markdown should be formatted using the following guidelines:

- Use H1 for the page title.
- Use H2 for the main sections of the page.
- Use H3-H6 for sub-sections of the page.

