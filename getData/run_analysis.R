# Project Getting and Cleaning Data
library("plyr")

##Merges the training and the test sets to create one data set.
# Read the train info
## Read the data of the trains
xtrain <- read.table("dataproject/train/X_train.txt", row.names=NULL)
## Read the activities of the data trains
ytrain <- read.table("dataproject/train/y_train.txt")
## Read the subjects of the data trains
subtrain <- read.table("dataproject/train/subject_train.txt")

# Read the test info
## Read the data of the test
xtest <- read.table("dataproject/test/X_test.txt", row.names=NULL)
## Read the activities of the data test
ytest <- read.table("dataproject/test/y_test.txt")
## Read the subjects of the data test
subtest <- read.table("dataproject/test/subject_test.txt")

# Union the information
data <- rbind(xtrain, xtest)
dataAct <- rbind(ytrain, ytest)
dataSub <- rbind(subtrain, subtest)
nrow(data)




#Extracts only the measurements on the mean and standard deviation for each measurement. 
## Read the features
features <- read.table("dataproject/features.txt")
## look the mean and std columns
cols <- grep("mean\\(|std\\(", features[,2])
## save data with mean and std cols
dataMeanStd <- data[,cols]


# Uses descriptive activity names to name the activities in the data set
## Read the activities
actLab <- read.table("dataproject/activity_labels.txt")
dataAct <- actLab[dataAct[,1],2]

##Appropriately labels the data set with descriptive variable names.
## Rename some columns
names(dataSub) <- "subject"
names(dataAct)[2] <- "activity"
names(dataMeanStd) <- features[cols,2]
## 
tidyData <- data.frame(dataSub, dataAct, dataMeanStd)
names(tidyData)[2] <- "activity"

##Write data
write.table(tidyData, "mergedData.txt", row.name=FALSE) 
object.size(tidyData)


# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
dataGroup <- aggregate(tidyData[3:68], by=list(tidyData$subject, tidyData$activity), FUN=mean)
names(dataGroup)[1] <- "subject"
names(dataGroup)[2] <- "activity"
write.table(dataGroup, "dataMeans.txt", row.name=FALSE)

