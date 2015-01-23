UCI HAR Dataset Analysis
========================

This repo contains an R script that can be used to download the [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and convert it into a [tidy data set](http://vita.had.co.nz/papers/tidy-data.pdf).

This work was completed as the final project for the [Getting and Cleaning Data](https://www.coursera.org/course/getdata) MOOC, part of Coursera's [Data Science specialization](https://www.coursera.org/specialization/jhudatascience/1) track.

## Requirements

Create a R script that does the following

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Usage

The tidying script is named [run_analysis.R](run_analysis.R).  It can be run by sourcing the file in R, using the following command:



```R
source("run_analysis.R")
```

After a successful run, the resulting tidy data set is loaded into the global environment as `tidy_data` and saved to disk as `tidy_data.txt`. Once the text file has been created, the tidy data set can be loaded back into memory at any time using the following command:

```R
tidy_data <- read.table("tidy_data.txt", header = T)
```

## Codebook

The [codebook](CodeBook.md) available in this repo describes the steps taken by the script in transforming and cleaning the data, and the resulting variables and observations.
