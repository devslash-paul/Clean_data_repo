url <- "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"

if(!dir.exists("data")) dir.create("data")
if(!file.exists("data/ugly.zip")) download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data/ugly.zip")
if(!dir.exists("UCI HAR Dataset")) unzip("data/ugly.zip")

testX <- read.table("UCI HAR Dataset/test/X_test.txt")
testXLabels <- read.table("UCI HAR Dataset/test/y_test.txt")
trainX <- read.table("UCI HAR Dataset/train/X_train.txt")
trainXLabels <- read.table("UCI HAR Dataset/train/y_train.txt")