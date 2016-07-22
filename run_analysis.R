# R Script to Read processed accelerometer and gyroscope data from Samsung Galaxy 5 smartphone
# Data provided as input for Coursera "Getting and Cleaning Data" course
#
# Set File Input Directory and File Output Directory
# These dataInputDir and dataOutputDir are examples and the user needs to modify each 
# to match the users directory structure for storing the data
# Because it is User specific, and to prevent security issues, these are just an example
#
#dataInputDir <- "C:/R_Programs/Coursera/Getting_and_Cleaning_Data/Course_Project/Data/UCI_HAR_Dataset/"
#dataOutputDir <- "C:/R_Programs/Coursera/Getting_and_Cleaning_Data/Course_Project/Data/"
#
# include required libraries
library(dplyr)
library(tidyr)
#
# Download Data
# These commands were used to download the Zip file from it's source
# They are commented out since they are only run once, but are included here for reference.
#fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#fileDest <- paste(dataInputDir, "data.zip", sep="")
#download.file(fileURL, destfile=fileDest, mode="wb")
#
# The resulting downloaded local Zip file was manually process to extract the data files.
# Since the local machine being used was Windows 10, several files needed to be processed
# by a local editor (MultiEdit) to convert the txt files from Unix(Lf) to Dos (Cr/Lf).
# No other changes were made to the files. 
# Modified files were: 
#   features.txt,activity_lables.txt,subject_test.txt,y_test.txt,subject_train.txt,y_train.txt
#
# Read Data Files
#
# Read Activity_Label File
fileActivity <- paste(dataInputDir, "activity_labels.txt", sep="")
activityData <-read.table(fileActivity, header=FALSE, na.strings="")
#
# Read Features File
fileFeatures <- paste(dataInputDir, "features.txt", sep="")
featuresData <-read.table(fileFeatures, header=FALSE, na.strings="")
#
# Read Test Data
# Read X_test.txt file
fileXTest <- paste(dataInputDir, "test/X_test.txt", sep="")
XTestData <-read.table(fileXTest, header=FALSE, na.strings="")
# Read Y_test.txt file
fileYTest <- paste(dataInputDir, "test/Y_test.txt", sep="")
YTestData <-read.table(fileYTest, header=FALSE, na.strings="")
# Read Subject_test.txt file
fileSubjectTest <- paste(dataInputDir, "test/subject_test.txt", sep="")
subjectTestData <-read.table(fileSubjectTest, header=FALSE, na.strings="")
#
# Read Train Data
# Read X_train.txt file
fileXTrain <- paste(dataInputDir, "train/X_train.txt", sep="")
XTrainData <-read.table(fileXTrain, header=FALSE, na.strings="")
# Read Y_train.txt file
fileYTrain <- paste(dataInputDir, "train/Y_train.txt", sep="")
YTrainData <-read.table(fileYTrain, header=FALSE, na.strings="")
# Read subject_train.txt file
fileSubjectTrain <- paste(dataInputDir, "train/subject_train.txt", sep="")
subjectTrainData <-read.table(fileSubjectTrain, header=FALSE, na.strings="")
# End reading files
#
# Start Processing Code Files
# Rename activityData Columns
names(activityData) <- c("activityId", "activityName")
#
# Process featureData for use as XData Column Names
# The second column of the featuresData contains the Original Column Names for the XTestData and XTrainData
# The result "XDataNames" contains descriptive text and removes special characters.
# These Column labels will be used twice later in the script
names(featuresData) <- c("row_num", "oldName")
XDataNames <- featuresData$oldName
XDataNames <- gsub("\\(",     "",XDataNames)
XDataNames <- gsub("\\)",     "",XDataNames)
XDataNames <- gsub("-",       "_",XDataNames)
XDataNames <- gsub("^t",      "Time_",XDataNames)
XDataNames <- gsub("^f",      "Frequency_",XDataNames)
XDataNames <- gsub("Body",    "Body_",XDataNames)
XDataNames <- gsub("Acc",     "Accelerometer_",XDataNames)
XDataNames <- gsub("Gravity", "Gravity_",XDataNames)
XDataNames <- gsub("Gyro",    "Gyro_",XDataNames)
XDataNames <- gsub("Jerk",    "Jerk_",XDataNames)
XDataNames <- gsub("Mag",     "Magnitude",XDataNames)
XDataNames <- gsub("__",      "_",XDataNames)
featuresData$newName <- XDataNames
# End Processing Code Files
#
#
# Start Processing Test Data
## Course Project Specification # 4 Part 1 of 2 - Rename Test Data Variables to Descriptive Names
# Rename subjectTestData Column
names(subjectTestData) <- "subjectId"
# Rename YTestData Column
names(YTestData) <- "activityId"
# Rename XTestData Columns
## Note: These Names are unique and are a Coded Description fully documented in the CodeBook. 
##       Example:V1 becomes tBodyAcc_mean_X, etc.
names(XTestData) <- XDataNames
# Combine Test Data
# Note added additional column "dataSource" to track which set this data is from.
# This column is not required by the course instructions, but absolutely would be required if further 
# analysis were to compare "test" vs "train". Note that this still produces a "Tidy" dataset.
testData <- cbind(YTestData, "dataSource" = "Test", subjectTestData, XTestData)
# End Process Test Data
#
# Start Processing Train Data
##  Course Project Specification # 4 Part 2 of 2 - Rename Train Data Variables to Descriptive Names
# Rename subjectTrainData Column
names(subjectTrainData) <- "subjectId"
# Rename YTrainData Column
names(YTrainData) <- "activityId"
# Rename XTrainData Columns
names(XTrainData) <- XDataNames
# Combine Train Data
# Note added additional column "dataSource" to track which set this data is from.
# This column is not required by the course instructions, but absolutely would be required if further 
# analysis were to compare "test" vs "train". Note that this still produces a "Tidy" dataset.
trainData <- cbind(YTrainData, "dataSource" = "Train", subjectTrainData, XTrainData)
# End Process Train Data
#
# Create Full Dataset
## Course Project Specification # 1 - Combine Test and Train datasets
fullData <- rbind(testData, trainData)
#
#
# Course Project Specification # 3 - Merge Activity Data with fullData
fullData <- merge(activityData, fullData, by.x="activityId", by.y="activityId")
#
#
# Start Subsetting for just required Variables
## Course Project Specification # 2 - Subset fullData to just "mean" and "std" variables on measurements
# Note: weighted averages on "Freq" where not included in the set of "mean" variables. The "Freq" values
# did not appear to be based on actual "raw measurements" and no Std was presented for the "Freq" values, 
# so we choose to exclude them.  This has been documented as a valid approach in the course notes.
#
# Get XData "mean" columns
XMeanNames<-grep("*mean*", XDataNames, value=TRUE)
# Remove XData "meanFreq" columns - Note the invert=TRUE parameter removes those with "meanFreq"
XMeanNames<-grep("*meanFreq*", XMeanNames, invert=TRUE, value=TRUE)
# Get XData "std" columns
XStdNames<-grep("*std*", XDataNames, value=TRUE)
# 
# Combine "mean" and "std" Column Names
XSubsetNames <- c(XMeanNames, XStdNames)
XSubsetNames <- sort(XSubsetNames)
# Subset fullData to just required Columns
subsetFullData <- fullData[,c("activityName", "subjectId", XSubsetNames)]
# End Subsetting for just required Variables
#
#
## Course Project Specification # 5 - Create dataset of Means by activityName and subjectId
# Group subsetFullData by activityName and subjectId
subsetFullData <- group_by(subsetFullData, activityName, subjectId)
# Create table of Means by activityName and subjectId
subsetMeans <- aggregate(subsetFullData[,3:68], by=list(activityName=subsetFullData$activityName, subsetFullData$subjectId), FUN="mean")
# Rename second variable to "subjectId" because aggregate renamed it to "Group.2"
names(subsetMeans)[2] <- "subjectId"
#
# Write out subsetMeans Names as a CSV file
# This file is used prepare the CodeBook for the dataset
outputFile <- paste(dataOutputDir, "courseProjectCodeBook.csv", sep="")
write.table(featuresData[featuresData$newName %in% XSubsetNames,], sep=",", row.names = FALSE, file=outputFile)

#
# Write out subsetMeans data as a comma delimited txt file
# This is the Project Tidy Data Deliverable
outputFile <- paste(dataOutputDir, "courseProjectTidyDataset.txt", sep="")
write.table(subsetMeans, sep=",", row.names = FALSE, file=outputFile)
#
#
# Notes for reading in data file from David Hood at:
#   https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/ 
# filePath <- "insert local directory of file location"
# fileName <- "courseProjectTidyDataset.txt"
#data <- read.csv(paste(filePath, fileName, sep=""), header = TRUE)
# or
#data <- read.table(paste(filePath, fileName, sep=""), sep=",", header = TRUE)
#View(data)

