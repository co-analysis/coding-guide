---
title: "Writing packages"
date: 2021-02-05
type: post
summary: "Put multiple functions into a package for greater code reproducibility and improved documentation."
---

# Package recap

At its simplest, an R package is just a folder that contains your functions. In reality, there are some conventions about the structure and content of such a folder that designates it as a 'package'.

Packages are beneficial because they:

* let you store all your functions in one place
* encourage good documentation
* make your code more shareable
* make it easier to test and debug your code
* standardise the form and storage of your code

It also means that your projects can be more succinct because you don't have to keep specifying function code as part of your analytical scripts; you can just attach the package as part of your workflow and have access to all its functions.

You should refer to [the R Packages book by Hadley Wickham and Jenny Bryan](https://r-pkgs.org/) for specific information on package creation and maintenance.

# When to package

If you have several functions that all contribute to a particular workflow or project, and are likely to be reused for other projects, you should consider creating a package.

Typically, you'll know ahead of time if a package is necessary. For example, if you have a periodically-released publication on GOV.UK. You will need functions that read, wrangle and prepare output documents for that specific publication and will want to re-run them in future when the next release is due for publication

You may also start to develop a script-based analysis that eventually has a large number of functions. Storing these in a package can make them easier to manage, with the added benefit of making them more readily available for other analyses.

# Package-making tools

You should use [the {usethis} package](https://usethis.r-lib.org/) to simplify and standardise package construction.

It contains many convenience functions for creating your own package. For example, `create_package()` to generate a folder with the minimal file requirements; `use_r()` to create in the correct location a script file for your functions; `use_testthat()` to set up the structure for tests and `use_test()` to create a test script in the correct location.

# What to include

Running `create_package()` generates a package folder with the minimal required content. There are three parts that you should concern yourself with:

1. In the `DESCRIPTION` file you should complete the metadata for the package name, title and description, as well as the authors' names
1. You should add your functions in R scripts to the `R/` folder (use `use_r()` to generate an empty R script in the correct location), with one script per 'group' of functions (e.g. one containing functions that clean the data, one for plotting functions, etc)
1. Update the `.gitignore` to prevent you from committing certain files to Git (more about this in [the version control section]())

You should add some other files too:

1. Add a README with `use_readme_rmd()`, which is where you explain the purpose of your package, provide some examples, etc
1. Provide an MIT license (as per [the Service Manual](https://www.gov.uk/service-manual/technology/making-source-code-open-and-reusable)) for the code with `use_mit_license()`

# Documentation

## Functions

You should document all your functions. This will allow users to understand how each function works without you needing to explain it. This will make our code more sustainable because the knowledge of how to operate it is stored alongside the functions, rather than in the author's brain.

It is convention to use {roxygen2} to write documentation for the functions in your package. It lets you write special comments in a particular format that is automatically converted to provide user-side documentation. 

In the {roxygen2} documentation you must include the function name and short description; an explanation of each argument via `@param`, their defaults and accepted classes; and at least one `@example` of the functions use (which you can wrap in `\dontrun{}}` if appropriate]).

## README and vignettes

The README is important: it should make it obvious to your colleagues what the package does and how to use it without having to delve any further into the package. It should be structured and written clearly and succinctly. Ideally you'll include any motivations, caveats and links to further materials as necessary. 

For larger packages with a lot of functionality, or with lots of functions that might interact in a workflow, you should add a 'vignette'. A vignette is a standalone document that shows how the package works with practical examples. You can add one with `use_vignette()`.

## Naming

The name of your package should be informative, like how the {cspsdata} package is for handling Civil Service People Survey data. Uppercase and periods are allowed in package names, but you should use all-lowercase where possible. You can use the `available()` function from the available package to help decide if the name is appropriate and to see if there's already a package with that name on CRAN already. You should use a name that doesn't clash with other packages--published or not-- wherever possible.

Function naming is descibed in [the functions section](), but you may wish to add a prefix to functions in a package, which helps with tabbed autocomplete and signals to people reading your code where the function has come from. For example, functions in the {stringr} package start with `str_`, like `str_remove()`.
