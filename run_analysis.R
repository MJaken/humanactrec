## Script runs analysis procedure for human activity data gathered from smartphones

library(dplyr)
## Reading test data and adding subject id and activity code to data frame
ytest <- read.table("./raw/test/y_test.txt", col.names = "Activity")
test <- read.table("./raw/test/X_test.txt")
subtestid <- read.table("./raw/test/subject_test.txt", col.names = "ID")
test <- cbind(subtestid, ytest, test)
  
## Reading train data and adding subject id and activity code to data frame
ytrain <- read.table("./raw/train/y_train.txt", col.names = "Activity")
train <- read.table("./raw/train/X_train.txt")
subtrainid <- read.table("./raw/train/subject_train.txt", col.names = "ID")
train <- cbind(subtrainid, ytrain, train)
  
## Merging test and train data in one data frame
data <- rbind(test, train)
  
## Adding description of activity according to activity code in data frame
actlabl <- read.table("./raw/activity_labels.txt", col.names = c("ActivityCode", "Activity"))
actlabl$Activity <- sub("_", " ", tolower(actlabl$Activity))
for(i in 1:nrow(data)) {data[i,2] <- actlabl[data[i,2],2]}

## Adding measurement(column) labels to data frame
vrblnames <- read.table("./raw/features.txt", stringsAsFactors = FALSE)
colnames(data)[3:length(colnames(data))] <- vrblnames[,2]

## Cleaning data, leaving only mean and standart deviation measurements
data <- data[grepl("mean|std|ID|Activity", colnames(data), ignore.case = FALSE)]
data <- data[!grepl("meanFreq", colnames(data), ignore.case = FALSE)]

## Making variable names more readable
colnames(data) <- gsub("-", "", colnames(data))
colnames(data) <- gsub("\\(", "", colnames(data))
colnames(data) <- gsub("\\)", "", colnames(data))
colnames(data) <- gsub("mean", "Mean", colnames(data))
colnames(data) <- gsub("^t", "time", colnames(data))
colnames(data) <- gsub("^f", "freq", colnames(data))
colnames(data) <- gsub("std", "Std", colnames(data))

## Grouping data by subject(id) and activity performed 
## Calculating average of each measurement for each subject and each activity
## Summarizing it
tidyData <- data %>% group_by(ID, Activity) %>% summarize_all(mean)

## Adding "Avg" at the end of variable names, writing result to tidy_data.csv
colnames(tidyData)[-(1:2)] <- paste0(colnames(tidyData)[-(1:2)], "Avg")
write.table(tidyData, "tidy_data.txt")

## Deleting process elements
rm("actlabl", "subtestid", "test", "subtrainid", 
   "train", "vrblnames", "ytest", "ytrain", "i")

