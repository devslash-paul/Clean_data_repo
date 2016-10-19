url <- "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"

if(!dir.exists("data")) dir.create("data")
if(!file.exists("data/ugly.zip")) download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data/ugly.zip")
if(!dir.exists("UCI HAR Dataset")) unzip("data/ugly.zip")

testX <- read.table("UCI HAR Dataset/test/X_test.txt")
testXLabels <- read.table("UCI HAR Dataset/test/y_test.txt")
testXSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
trainX <- read.table("UCI HAR Dataset/train/X_train.txt")
trainXLabels <- read.table("UCI HAR Dataset/train/y_train.txt")
trainXSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")

# We need to grab the english names for the features in the datasets
features <- read.table("UCI HAR Dataset/features.txt", col.names=c("Index", "Name"))

# Then we can make the datasets a little more readable
colnames(testX) <- features$Name
colnames(trainX) <- features$Name

# lets add the labels and subject
testX$Label <- testXLabels$V1
testX$Subject <- testXSubject$V1
trainX$Label <- trainXLabels$V1
trainX$Subject <- trainXSubject$V1

# Lets now add in the user who took that measurement

# Lets now merge them
totalData <- rbind(testX, trainX)

# Now we only want to extract those pieces of data that have to do with the mean and standard deviation
desiredColumns <- grepl("mean", names(totalData)) | 
                  grepl("std", names(totalData)) |
                  grepl("Label", names(totalData)) |
                  grepl("Subject", names(totalData))
meanstdData <- totalData[,desiredColumns]

# Tidy data set with average of each variable for each activity and each subject
tidyData <- aggregate(.~Subject+Label, meanstdData, mean)

# Write the data set
write.csv(tidyData, file="output.csv", row.names=F)