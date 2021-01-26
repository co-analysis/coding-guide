---
title: "File paths"
date: 2021-01-22
type: post
summary: "Best practice on managing file paths in a mixed Mac/Windows ecosystem"
---

A key benefit of using [project containers]({{< relref "workflow/projects.md">}}) in analysis is to enable cross-team collaboration. However, this can easily become troublesome if you have not thought carefully about file paths. Cabinet Office IT provides both Mac and Windows devices. Most data for analysis is stored on a network file store or in Google Drive. Not only do the way file systems mount vary between operating systems, different individuals may mount at different points in the folder structure or in the case of windows to different drive letters.

## File path problems

Consider the following theoretical folder path:

```txt
FILESTORE/SHARE/ANALYSIS/FOLDER1/DATA
```

Someone on a Mac might mount the `ANALYSIS` folder and their file path to the `DATA` folder:

```txt
/Volumes/ANALYSIS/FOLDER1/DATA
```

Sometimes Macs will re-mount the folder if the network connection is lost giving the following path:

```txt
/Volumes/ANALYSIS-1/FOLDER1/DATA
```

One Windows user might also mount at the `ANALYSIS` folder and allocate this to the `X:` drive, in which case their path to the `DATA` folder is:

```txt
X:\FOLDER1\DATA
```

Another Windows user has mounted `FOLDER1` as the `T:` drive, and so their path is:

```txt
T:\DATA
```

While another Windows user has mounted the `DATA` folder to the `T:` drive, and so their path to the folder is simply:

```txt
T:\
```

## Strategies for managing file paths

You should not use explicit file paths to network drives in your code. These make it hard for others to easily execute your code.

```r
data <- read_csv("X:\PATH\TO\PROJECT\FILE.csv")
data2 <- read_csv("X:\PATH\TO\PROJECT\FILE2.csv")
```

Instead you should use relative paths, by specifying a folder as a variable and referring to that in future lines calling files. This allows others to quickly and easily change the folder reference as needed. You should use the forward-slash, `/`, to denote folder structures since Windows can process both forward-slash and back-slash as the folder delimiter.

```r
folder_path <- "X:/PATH/TO/PROJECT"
data <- read_csv(paste0(folder_path, "/FILE.CSV"))
data2 <- read_csv(paste0(folder_path, "/FILE2.CSV"))
```

Within R you can also use the `file.path()` function to construct file paths:

```r
folder_path <- "X:/PATH/TO/PROJECT"
data <- read_csv(file.path(folder_path, "/FILE.CSV"))
data2 <- read_csv(file.path(folder_path, "/FILE2.CSV"))
```

If using RStudio you can also use interactive file and directory functions to set paths

```r
folder_path <- rstudioapi::selectDirectory()
data <- read_csv(file.path(folder_path, "/FILE.CSV"))

file_path <- rstudioapi::selectFile()
data2 <- read_csv(file_path)
```

## Google Drive files

For security reasons you cannot programmatically access any Cabinet Office files stored in Google Drive via Google's APIs. You can use Google File Stream which maps Google Drive as network drive, however caution should be taken. Usually the best solution for working with files stored in Google Drive is to download them as CSV files and store them locally on your machine. Remember to follow the advice about using a `.gitignore` to ensure you do not accidentally commit data to a remote repository.
