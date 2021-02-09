---
title: "Why functions?"
date: 2021-02-05
type: post
summary: "You should replace repetitive code with functions to help minimise errors."
---

# Don't repeat yourself

Sometimes you want to apply the same code multiple times to variables in your dataset. You might do this by copy-pasting the code and altering the content slightly each time. 

Let's say you have the People Survey dataset and want to save each organisation's data into a separate file. You might do something like this:

```r
df %>%
  filter(OverallDeptCode == "ACAS") %>%
  write_csv("output/csps-acas-results.csv")

df %>%
  filter(OverallDeptCode == "AGO") %>%
  write_csv("output/csps-ago-results.csv")

df %>%
  filter(OverallDeptCode == "AIB") %>%
  write_csv("output/csps-aib-results.csv")

df %>%
  filter(OverallDeptCode == "ALOB") %>%
  write_csv("output/csps-acas-results.csv")
```

This example code takes an input dataset `df`, filters it for a named governmental organisation, then saves the output as a CSV file to a provided filepath. Over 100 organisations took part, so you'll have to copy the code a lot.

In fact, did you notice that the CSV filepath is wrong in the last line of the example? This error is likely to happen because you have to modify both the `filter()` and `write_csv()` statements for each organisation. It would be better if we only had to do that once.

You should avoid coding in this way. It encourages problems because you might:

* copy-paste something incorrectly
* forget to update the pasted code, or update it incorrectly
* it can be hard to spot small deviations or errors quickly

If your code works, then it works. But you should try to minimise mistakes and make it easier to interpret where possible. That will make your code more stable and reusable, which is particularly important if the code needs to be run again in future, like for a publication.

Functions are an important way of doing this in R.

# Why functions?

You should write your own function instead of writing repetitive code. Read more about the case for functions in [the Functions chapter of _R for Data Science_ by Hadley Wickham](https://r4ds.had.co.nz/functions.html).

Functions are special structures in R that let you:

* write repetitive code just once
* assign an informative name to that code for easier reuse
* eliminate copy-paste errors
* improve the readability of your code
* make testing and debugging easier

R is a function-oriented language, which means almost everything is a function. You'll be familiar with functions that are built into R, like `print()` and `c()`, but we can also make our own.

Rule of thumb: if you need to copy-paste some code more than twice, it should probably be a function. This is especially true when the code is long or complicated.

## Write a function

You should write small functions that do one specific thing. This makes it easier to reuse and debug them. In our example, all the code is doing is saving some filtered data.

So, instead of the repetitive code in the example above, you should write a function that takes the dataset and organisation name as :

```{r}
write_org_file <- function(org) {
  
  df %>% 
    filter(OverallDeptCode == org) %>%
    write_csv(
      paste0("output/csps-", org, "-results.csv")
    )

}
```

For specific advice on function best-practice see [the 'writing good functions'  section]().

You could then use the function like this:

```r
write_org_file("ACAS")
write_org_file("AGO")
write_org_file("AIB")
write_org_file("ALOB")
```

This is better than the original code: the function name tells us what the code does; we only supply the organisation name once; and it's more succinct, which makes it easier to spot any errors. 

On face value, you still have to copy-paste the function call. We can, however, tell R to apply a function over a supplied vector or list of inputs. This makes your code far more succinct and readable

## Iterate the function

You should use the {purrr} package for iteration, particularly the `map()` functions. This is preferred to R's `apply` family of functions, which are inconsistent.

For example, you could use {purrr}'s `walk()` function to supply each organisation to our example function in turn:

```{r}
walk(c("ACAS", "AGO", "AIB", "ALOB"), get_org_mean)
```

This does exactly the same thing as the example in the first code block of this page. In other words, we've written one line of code instead of repeating the same code for every single one of the 100-plus organisations.

# Storing functions

Where should the code for a function go? Small functions that solve a specific problem in your analysis scripts can be written alongside the rest of the code in your script. In the case of writing R Markdown files, you should prefer to store these in chunks at the top of your script, as per [the RMarkdown-Driven Development philosophy](https://emilyriederer.netlify.app/post/rmarkdown-driven-development/).

If your function definition is long and complicated, or if the scale of your analysis is large and made of several separate scripts, you should probably annex the functions into their own R script file(s) and store them in a separate folder (typically called `R/`).

This makes them easier to find, reuse, test and debug. It also makes your analysis scripts easier to read because the function definitions are stored elsewhere.

It can, however, become difficult to manage a large number of functions. This is when you might need to develop your own package. Read more in [the 'writing packages' section]().
