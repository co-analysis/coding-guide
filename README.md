# Cabinet Office Analysis & Insight: Analytical Coding Guide

This repo provides the Cabinet Office Analysis & Insight team's guide for coding in analytical projects - our Analytical Coding Guide (ACG).

The guide is currently undergoing a major redesign, as such all previous work has been deleted. Previous content can be found in the `archive` branch (for now).

This work is Crown Copyright (C) 2020, and published under the [Open Government Licence 3.0](OGLv3.md).

The guide is built using [Hugo](https://gohugo.io), a static site builder, with the [`govuk-hugo`](https://github.com/co-analysis/govuk-hugo) theme for applying the GOV.UK Design System to the site.

## Use with R

Pages without R code should use simple markdown as per Hugo.

`govuk-hugo` is not compatible with the `{blogdown}` rendering functions, instead a custom function is used to render Rmarkdown documents. To build `.Rmd` files execute the following code:

```r
source("R/render_functions.R")
build_hugo()
```

`build_hugo()` assumes that Rmd files are stored in the folder `R/Rmd/`. `.Rmd` files should have `section` set in their YAML front-matter to set the sub-directory of the content folder that the Rmd file would ordinarily reside in (e.g. `section: workflow` would mean the Rmd would be in the `content/workflow/` file if it were an ordinary markdown file).

For each `.Rmd` file `build_hugo()` calls `render_rmd()` which uses `rmarkdown::html_fragment()` to convert the Rmd to HTML. This HTML relating to the content within the Rmd without any of the header or footer information that is inserted by `rmarkdown::html_document()`. It then appends the YAML front matter to the top of the fragment and writes the fragment HTML into the appropriate content directory.

After rendering the `.Rmd` files, `build_hugo()` runs Hugo's site builder which converts markdown and fragment HTML pages into a full site.
