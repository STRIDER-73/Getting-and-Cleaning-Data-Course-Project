
### The Data Frames are created for each of the given set of data,
### Below code can be uncommented and can be used to read data 
### (Required Files have already been placed in the Working Directory)

### The Following lines may be executed to read all the data.

# library(dplyr)
# Features <- read.table("features.txt", col.names = c("No.","Functions"))
# Activities <- read.table("activity_labels.txt", col.names = c("Code", "Activity"))
# Subject_Test <- read.table("subject_test.txt", col.names = "Subject")
# Subject_Train <- read.table("subject_train.txt", col.names = "Subject")
# X_Test <- read.table("X_test.txt", col.names = Features$Functions)
# X_Train <- read.table("X_train.txt", col.names = Features$Functions)
# Y_Test <- read.table("y_test.txt", col.names = "Code")
# Y_Train <- read.table("y_train.txt", col.names = "Code")

################################################################################
################################################################################

### Step:1
# Merging the training and the test sets to create one data set.

X <- rbind(X_Train, X_Test)     ## Combing the 70% and 30% of the randomly 
                                ## partioned data together (Here,all sensor data
                                ## are binded together (row-wise))

Y <- rbind(Y_Train, Y_Test)     ## (Here which activity the volunteer was 
                                ## performing when the sensor data was
                                ## sampled)


Subject <- rbind(Subject_Train, Subject_Test)   ## Corresponding subject for the 
                                                ## measured data


Merged_Data <- cbind(Subject, Y, X)     ## Merging everything into one table,one
                                        ## complete dataset (column-wise).

### Step:2
#   Extracting,only the mean and std variable for each measurements. 

TidyData <- Merged_Data %>% select(Subject,Code,contains("mean"),contains("std"))
                                        ## Selecting required variables(columns)

### Step:3
#   Using Descriptive activity names to name the activities in the data set

TidyData$Code <- Activities[TidyData$Code,2]


## Step:4
#   Appropriately labeling the data set with descriptive variable names. 

names(TidyData)[2] = "Activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))


## Step:5
#   Creating a second, independent tidy data set with 
#   the average of each variable for each activity and each subject.


FinalData <- TidyData %>%
                         group_by(Subject,Activity) %>%
                         summarise_all(mean)

#   Writing the final data set into a text file.

write.table(FinalData, "FinalData.txt", row.name=FALSE)






