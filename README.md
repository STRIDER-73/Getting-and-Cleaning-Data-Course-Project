# README

## Peer-graded Assignment: Getting and Cleaning Data Course Project

Hii, this is my repository for Getting and Cleaning Data course project.This file contains how to extract the data from `Human Activity recognition dataset` and cleaning it up and using it further for analysis.

### Data-set

The Data set can be downloaded from [UCI HAR Data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Files

-   `CodeBook.md`

    Code book that describes the variables, the data, and any transformations or work that were performed to clean up the data.

-   `run_analysis.R`

    Performs the data preparation and then followed by the 5 steps required as described in the course project's definition:

    1.  Merges the training and the test sets to create one data set.
    2.  Extracts only the measurements on the mean and standard deviation for each measurement.
    3.  Uses descriptive activity names to name the activities in the data set.
    4.  Appropriately labels the data set with descriptive variable names.
    5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

-   `FinalData.txt`

    The exported final data after going through all the sequences described above.
