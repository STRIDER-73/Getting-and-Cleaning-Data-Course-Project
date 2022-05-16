# Code-Book

The purpose of this project is to demonstrate one's ability to collect, work with, and clean a data set.

## Aim/Goal:

To prepare tidy data that can be used for later analysis.

The script `run_analysis.R` is written to clean the given data set and do some further analysis.

### 1. Downloading the Data-set

Data set downloaded and extracted under the folder called `UCI HAR Data set` and necessary files are copied to the working directory to make the process easier. The Data set can be downloaded from [UCI HAR Data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### 2. Extracting each file to form a Database

-   `Features`\<-`features.txt` 561 obs. of 2 variables

    The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

-   `Activities`\<-`activity_labels` 6 obs. of 2 variables

    List of activities performed when the corresponding measurements were taken and its codes (labels).

-   `Subject_Test` \<- `subject_test.txt` (2947 obs. of 1 variables)

    Contains test data of 9/30 volunteer test subjects being observed.

-   `Subject_Train` \<- `subject_train.txt` (7352 obs. of 1 variables)

    Contains train data of 21/30 volunteer test subjects being observed.

-   `X_Test` \<- `X_test.txt` (2947 obs. of 561 variables)

    Contains recorded features test data.

-   `X_Train` \<- `X_test.txt` (7352 obs. of 561 variables)

    Contains recorded features train data.

-   `Y_Test` \<- `y_test.txt` (2947 obs. of 1 variables)

    Contains test data of activities'code labels.

-   `Y_Train` \<- `y_test.txt` (7352 obs. of 1 variables)

    Contains train data of activities'code labels.

### 3.Merging the Training and Test Data-sets

-   `X`(10299 obs. of 561 variables)

    Created by merging `X_Test` and `X_Train` by using the *rbind()* function.

-   \`Y'(10299 obs. of 1 variables)

    Created by merging `Y_Test` and `Y_Train` by using the *rbind()* function.

-   `Subject`(10299 obs. of 1 variables)

    Created by merging `Subject_Test` and `Subject_Train` by using the *rbind()* function.

-   `Merged_Data`(10299 obs. of 563 variables)

    Created by merging `X`,`Y`,and `Subject` by using the *cbind()* function.

### 4.Extracting the measurements, only on the mean and standard deviation for each measurement

-   `TidyData`(10299 rows, 88 columns)

    Created by sub setting Merged_Data, selecting columns: Subject, Code and the measurements on the mean and standard deviation (std) for each measurement.

### 5.Changing the Code column in `TidyData` into corresponding activity label

### 6.Naming the columns properly by providing Descriptive variables.

-   `Code` column in `TidyData` renamed into `Activity`

-   All `Acc` in column's name replaced by `Accelerometer`

-   All `Gyro` in column's name replaced by `Gyroscope`

-   All `BodyBody` in column's name replaced by `Body`

-   All `Mag` in column's name replaced by `Magnitude`

-   All start with character `f` in column's name replaced by `Frequency`

-   All start with character `t` in column's name replaced by `Time`

### 7. Creating a second, independent tidy data set with the average of each variable for each activity and each subject.

-   `FinalData` (180 rows, 88 columns)

    Created by summarizing TidyData taking the means of each variable for each activity and each subject, after grouped by subject and activity.

-   Export `FinalData` into `FinalData.txt` file.
