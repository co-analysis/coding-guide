# Cabinet Office Analysis & Insight: Analytical Coding Guide

This repo provides the Cabinet Office Analysis & Insight team's guide for coding in analytical projects - our Analytical Coding Guide (ACG).

The guide is currently undergoing a major redesign, as such all previous work has been deleted. Previous content can be found in the `archive` branch (for now).

This work is Crown Copyright (C) 2020, and published under the [Open Government Licence 3.0](OGLv3.md).

The guide is built using [Hugo](https://gohugo.io), a static site builder, with the [`govuk-hugo`](https://github.com/co-analysis/govuk-hugo) theme for applying the GOV.UK Design System to the site.

## Contributing


### Pages

New pages should be created as markdown (.md) files in the relevant `content/` subfolder.

Pages should have the following YAML front matter:

```yaml
---
title: "Code review"
date: 2021-01-22
type: post
summary: "Summary goes here"
---
```

Page summaries are recommended as they are used to provide a summary on the section index pages.

### Sections

New sections can be created as a sub-folder of the `content/` directory. It is recommended that each section has an `_index.md` file. This allows you to set the section title (which is used to sort items in the navigation side bar), you can also provide content for the index page itself. The `listpages` argument in the YAML front-matter determines whether the page list is shown.

```yaml
---
title: "1. Workflow"
date: 2021-01-22
listpages: true
---
```


### Use with R

`govuk-hugo` is not compatible with the `{blogdown}` rendering functions, instead a custom function is used to render Rmarkdown documents. See the [`govuk-hugo-demo` repo](https://github.com/co-analysis/govuk-hugo-demo) for more details.