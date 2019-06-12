# Cabinet Office Analysis & Insight: Analytical Coding Guide

This repo provides the Cabinet Office Analysis & Insight team's guide for coding in analytical projects - our Analytical Coding Guide (ACG).

It is designed as a [`govdown`](https://ukgovdatascience.github.io/govdown/) flavoured [RMarkdown](http://rmarkdown.rstudio.com) website.

### Pre-requistes
In order to contribute to this repo you will need to install the following R packages to ensure it can build:

* [`govdown`](https://ukgovdatascience.github.io/govdown/)
* [`govstyle`](http://ukgovdatascience.github.io/govstyle/index.html)
* [`kableExtra`](https://cran.r-project.org/package=kableExtra)

#### Pandoc
You will also need `pandoc` version 2 or greater, which is bundled with RStudio. If using the CO standard issue of RStudio then its likely you're using version 1.*. You can check your version of pandoc by running the following code:

``` r
rmarkdown::pandoc_version()
[1] ‘2.3.1’
```

If you have Anaconda installed (this can be installed from the Software Centre), then you can use that to upgrade to pandoc version 2. In addition to upgrading the pandoc version, you'll also need to create a `.Renviron` file - in your main working directory that R/RStudio loads. You will need to change `«PATH TO PANDOC»` to the directory folder that contains the 2.* binary (.exe file on windows) of pandoc.

``` r
# Custom .Renviron file content:

RSTUDIO_PANDOC = «PATH TO PANDOC»

```


### Contributing

1. Clone the repo / pull the latest changes
2. Create a `article/page` branch
3. Make a copy of template.Rmd
4. Rename and edit the file
5. Save the Rmd file
6. Build the web page
7. Commit the change
8. Push the branch
9. Create a pull request to merge the branch
