---
title: "Installing packages, libraries & extensions"
date: 2021-01-22
type: post
summary: "Advice on how to install software extension such as R packages and Python libraries"
weight: 210
---

One of the main benefits of using open source software such as R or Python in analysis is the wide range of code that has been written to extend their functionality, these typically called packages in R and libraries in Python, we use 'package' as a generic term to refer to both. There are almost 17,000 packages hosted on CRAN, the central package manager for R, while Anaconda hosts over 7,500 Python libraries (a small data science specific subset of the 285,000-plus Python libraries).

When installing a software extension you first port of call should be to use trusted package management services. For R this is [CRAN](https://cloud.r-project.org/), and for Python this is [Conda](https://docs.conda.io/projects/conda/en/latest/). CRAN and Conda have checks that packages must pass in order to be listed and hosted.

Conda is a data science focussed package manager for Python, but there is also a generalised package manager for Python called pip. Pip does not have the same process for checking code before a package is listed and therefore you should be considered using packages from it more cautiously - the vast majority are fine, and all "big name" Python packages are hosted and can be installed via pip.

Sometimes the package you want or need will not be available on CRAN/Conda. With both R and Python there are other ways and sources to install packages. Many R and Python developers openly publish their source code on GitHub. For packages hosted on CRAN/Conda, GitHub will provide the very latest available version of the package with functions that have not yet been included in the 'official' release. Developers of niche packages that might not meet the strict rules of CRAN/Conda will rely solely on GitHub as the means of hosting their package and rely on other means (e.g. Twitter) for communicating its existence. Many government departments also write bespoke packages for to help manage their own work, some of these make it to CRAN (e.g. the fingertipsR package from Public Health England), while others do not (e.g. ShinyGovStyle from the Ministry of Justice).

Just because a package isn't in CRAN/Conda doesn't mean it is bad or unsafe code that shouldn't be used. Similarly, just because something is on CRAN/Conda doesn't mean it should be trusted, if it hasn't been updated for a while there could well be security issues that have been identified since the last code update. The [Sonatype OSS Index](https://ossindex.sonatype.org/) regularly reviews packages published in package libraries for security vulnerabilities. You can use it to find check any CRAN, Conda or PyPI package as well as several other package ecosystems.

Simple steps you can take to assess any package's security include:

- Is the package code hosted in the open on a publicly trusted service such as GitHub, Gitlab, BitBucket, Source Forge?
- Are the author(s), maintainer(s) or publisher(s) known and trusted?
- Are others using the package?
- If hosted on GitHub, do the package developers actively engage with issues and update the package regularly to fix bugs?

You should also consider installing and regularly using one of the following integrations that can programmatically check the OSS Index and API.

- [oysteR](https://sonatype-nexus-community.github.io/oysteR/) for checking and testing R packages
- [Jake](https://github.com/sonatype-nexus-community/jake) for checking and testing Conda packages and environments
- [ossaudit](https://github.com/illikainen/ossaudit) for checking Python packages
