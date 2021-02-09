---
title: "Writing good functions"
date: 2021-02-05
type: post
summary: "Write simple functions that are easy for you and your colleagues to understand."
---

# Properties of good functions

Each of your functions should:

* perform a single, small task
* be named sensibly
* communicate clearly with the user if required
* fail quickly if there's an error

You can read more about function writing in [the Functions chapter of _R for Data Science_](https://r4ds.had.co.nz/functions.html).

## Be discrete

Design your function to do the smallest possible unit of work. This makes it easier to interpret what its doing; makes it easier to discover and debug errors; and allows you reuse the function more readily across your analyses. For example, you might write functions like `read_data()`, `clean_data()` and `plot_results()`.

You can always write a function that combines other functions, if required. The readability of such a function will benefit from you having written the smaller functions. For example:

```r
run_analysis(data_path) {

  df <- read_data()
  clean_df <- clean_data(df)
  plot_results(clean_df)

}
```

## Naming

The name you give your function should be short but descriptive. You should use the same principles as for naming objects in general, like preferring snake case.

You should, however, try to start function names with a verb, as per [the Tidyverse style guide](https://style.tidyverse.org/functions.html). This signposts to the reader that the function is going to do something with your inputs.

For example, if your function summarises data by year, you could name it `summarise_years()` rather than something less helpful like `years_function()`. The latter indicates that years are involved, but doesn't imply what it's going to do.

## Communication

If appropriate, your function should print messages in the console to communicate with the user about what's happening. You must supply an informative error message if something has gone wrong and it's advisable to provide updates to the user for functions that contain long-running processes.

### On error

It's good practice to check the inputs to a function for any problems, like if the wrong class of object has been provided. The function can then be stopped before it executes, which could save a lot of time.

You should use `if` and `stop()` statements at the start of a function body . In this example, the class of the input to the `data` argument is checked to make sure it's a dataframe. If not, the function stops and prints a message to the console.

```r
clean_data <- function(data) {
  
  if (class(number) != "data.frame") {
    stop("You must supply a data.frame to the 'data' argument.\n")
  }

  data_clean <- data %>%
    select(x, y, z) %>% 
    filter(x == "y") %>% 
    mutate(a = x + y)

  return(data_clean)

}
```

Try to be succinct but informative when writing error messages to the user. It may also be helpful to suggest a fix, where possible. This will make it far easier to debug the problem and fix it. See [the error messages section](https://style.tidyverse.org/error-messages.html) of _The Tidyverse Style Guide_ for inspiration.

### To provide information

It can be helpful to print a message to the user when certain parts of the function are complete. This is a nice convenience for long-running processes, especially. 

You should use the `cat()` function to do this, which prints text to the console. Here's a simple example using our earlier example:

```r
run_analysis(data_path) {

  df <- read_data()
  cat("Finished reading data")
  
  clean_df <- clean_data(df)
  cat("Finished cleaning data")
  
  plot_results(clean_df)
  cat("Finished plotting data")

}
```

Having said this, you don't want to overload the user with information. Keep messages succinct and provide contextual information if relevant, like the current element being iterated over or the time taken.
