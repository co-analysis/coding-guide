---
title: "Writing code for analysis"
date: 2021-01-22
type: post
summary: "Our approach to writing good code"
weight: 100
---

Everyone will write code their own way, and some languages are more prescriptive than others about their approach and conventions. This page sets out some common conventions that are our recommended approach to writing code for analysis. This page is not a complete style guide, instead we recommend the [Tidyverse style guide](https://style.tidyverse.org/files.html) for R and the appropriate [Google style guide](https://google.github.io/styleguide/) for all other languages.

## Readability and white space
The most important thing about writing good code is ensuring that your code can be easily read by others (including your future self). Others should be able to read your scripts without too much effort and to be able to follow the flow of the code. Remember that "white space is free", just because you can nest or chain functions and write a complex piece of analysis in a few short, dense lines of code does not mean that you should. Most languages allow you to split code over multiple lines, take advantage of this.

Two good rules of thumb are, if you're doing something 'new' then use a new line, and you should avoid any single line of code being longer than 80 characters long. In R, if you use a pipe operator (`%>%` or `|>`) then this is a good indicator that you should use a new line. 

```r
# Bad
new_df <- df %>% filter(location=="Manchester") %>% mutate(over_50=if_else(age>50,"50+","0-50"),under_30=if_else(age<30,"0-30","30+"))

# Good
new_df <- df %>%
  filter(location == "Manchester") %>%
  mutate(
      over_50 = if_else(age > 50, "50+", "0-50"),
      under_30 = if_else(age < 30, "0-30", "30+")
  )
```

## Naming variables and functions
Any objects (variables or functions) that you create should use `snake_case`, i.e. use an underscore (`_`) to separate words within a name. Conventions in some languages, and/or pre-existing code, might use `camelCase` or `BigCamelCase`, these can be used to preserve consistency. Dot separation (`dot.separation`) is not recommended and should be avoided, even with working with legacy code.

Names should be short and meaningful, variables/data object names should be nouns while function names should be verbs. Avoid numbers unless they have a specific contextual meaning (e.g. a year), you should also be careful about using single letters.

```r
# Bad
departments_agencies_and_organisations
my_age_selection()

# Good
orgs
select_age()
```

## Piping and chaining
Some languages have built-in support for, or have been extended to support, ["piping"](https://en.wikipedia.org/wiki/Pipeline_(Unix)) while other languages (particularly object-orientated) support ["chaining"](https://en.wikipedia.org/wiki/Method_chaining). Both of these are ways to pass the output of one function/method to another.

In general, we recommend piping/chaining over repeatedly modifying a variable/object or creating separate intermediate variables/objects for each functions. However, you should ensure that any pipeline or chain is understandable to an external reader of your code. It can be useful both to break your pipeline/chain and output an intermediate variable/object at an appropriate point to enable error checking and to assist external readers/reviewers of your code.

Piping/chaining is preferred over [nesting](https://en.wikipedia.org/wiki/Nesting_(computing)) as it enhances legibility.

```r
# Bad
summarise(mutate(select(df, x, y), z = x * y), mean_z = mean(z))

# Good
df %>%
  select(x, y) %>%
  mutate(z = x * y) %>%
  summarise(mean_z = mean(z))
```

## Writing code comments
Our guidance on documentation(LINK NEEDED) details how to formally document your coding projects, for example header metadata in scripts and documenting functions. Informal documentation within scripts is also important, others (including your future self) benefit from you decorating your scripts with short, simple, regular comments that help explain what each block code is trying to achieve. This makes it easy for others to either (a) pick up/re-use your work at a future point, and (b) check and review your code.

```r
# Select Manchester staff and add age flags
new_df <- df %>%
  filter(location == "Manchester") %>%
  mutate(
      over_50 = if_else(age > 50, "50+", "0-50"),
      under_30 = if_else(age < 30, "0-30", "30+")
  )
```

## Separate your output code
It is recommended that you separate data wrangling (selecting, filtering, transforming data) from any function calls that output the results of the data (e.g. plotting or formatting a table). This ensures that the two processes (wrangling and output) are distinct and separate. This ensures it is clear what aspects of your code are about manipulating the data and which are for outputting your analysis. In R, this also helps avoid common mistakes arising from the `{ggplot2}` package using a plus (`+`) as it's mechanism for piping/chaining functions rather than the pipe operator (`%>%`).

```r
# Bad
df %>%
  select(year, height, weight) %>%
  mutate(bmi = weight / height^2) %>%
  ggplot(aes(x = year, y = bmi)) +
  geom_point() +
  geom_smooth()

# Good
plot_df <- df %>%
  select(year, height, weight) %>%
  mutate(bmi = weight / height^2)

ggplot(plot_df, aes(x = year, y = bmi)) +
  geom_point() +
  geom_smooth()
```

More detailed guidance about code for output is provided in the [output style]({{< relref "output/_index.md" >}}) section.
