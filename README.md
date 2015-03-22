# Getting and Cleaning Data Course Project

## Using script

- Download and extract data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
- Add function `source('run_analysis.R')`
- Run script using location of dataset (trailing separator is required for path)

Example:
```
> dir <- "/tmp/UCI HAR Dataset/" 
> tidyData <- run_analysis(dir)
> dim(tidyData)
[1] 180  68
```
