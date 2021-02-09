---
title: "Project set-up"
date: 2021-01-22
type: post
weight: 100
summary: "Code-based analysis should be managed as using a standard project set-up"
---

Analytical work in general, but especially those using code, should be managed as a project - a distinct piece of work/analysis that is self-contained.

Projects should be contained in separate, distinct, and well-named folders. They should also follow a standard structure to make it easier for others to navigate, at a minimum your project folder should include:

- If using version control a `.gitignore` file that lists the files/folders that should be excluded, by default the `data/` folder must be excluded as should common data extensions (e.g. `.csv`, `.dta`, `.xls*`, `.sav`, `.rds`).
- A `data/` folder to store any project specific datasets.
- An `output/` folder to store outputs from the analysis.
- A `functions/` folder to store code for bespoke functions you have written, it is customary with R-based coding for this folder to be named `R/` rather than `functions`.
- A `README.md` file that provides an introduction to the project and provides high-level documentation, if there is detailed documentation that needs to be spread over multiple files then you may want to include a `docs/` folder.

```txt
project/
  ├── .gitignore
  ├── data/
  │   ├── YYYY-MM-DD_raw-data1.csv
  │   └── YYYY-MM-DD_raw-data2.csv
  ├── output/
  │   ├── YYYY-MM-DD_output.Rmd
  │   └── YYYY-MM-DD_cleaned-data.csv
  ├── functions/
  │   └── functions.R
  ├── script.R
  └── README.md
```

## Naming files
File names should be short, distinct and easy to understand. Files relating to data or output should start with the date followed by their "name". Spaces should not be used in file names, dates should be separates from the name using an underscore, while spaces in the name should be replaced with dashes.

### Dates
Dates should be in ISO format, as per Cabinet Office guidance on file names, that is the four digit year, two digit month and two digit day, with dashes separating each date component and leading zeros, so the 1st January 2021 becomes `2021-01-01`.

### Functions
Scripts containing functions should not be dated but have sensible names. If you only have a small number of bespoke functions you should create a single `functions.R` file to contain them in your `functions`/`R` directory. However when developing a large project, and/or package, it may make sense to split your functions into multiple scripts, in this case separate them into logical blocks and give them appropriate names (e.g. `import.R` for importing functions, or `output.R` for functions handling output).

### Workflow scripts
For small projects you may have only one script, in this case you should call it `main.R` or `project.R` (where project is the name of your project), as with function scripts they should not be dated. As your project increases in complexity you should consider having separate scripts. If there is a natural flow where you must run one script before another, then number your scripts (e.g. `01_import_and_clean.R`, `02_model.R`, `03_export_files.R`) and write a "runner"/"main" script that calls each of these in turn (e.g. `00_main.R`).

For advice on naming objects in your code, read our guidlines about [writing code]{{< relref "code_style/writing_code.md" >}}

## RStudio projects
R-based code should be stored and managed inside an [RStudio project](https://r4ds.had.co.nz/workflow-projects.html#rstudio-projects). 

RStudio projects are particularly useful because when you launch/switch to an RStudio project the R console's working directory is set to the project folder. This means that when working with multiple scripts you only need to write folder paths that are relative to the project directory, this is particularly helpful when collaborating with others given the potential for [file path issues]({{< relref "technology/file_paths.md">}}).