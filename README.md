# README File

This Git Repo contains data and documentation associated with, and in response to, the Course Project for the Coursera
class titled "Getting and Cleaning Data".

The raw data for this project came from the Human Activity Recognition Using Smartphones Dataset (see Original Dataset README.txt section below) and was downloaded from: 

	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Additional source data information is available at:

	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The Github Repo contains:
	1) An R program script (run_analysis.R) to read the raw data and process the data into the Tidy dataset, and then 
	further process that Tidy dataset into a second Tidy dataset of mean values for each Activity and Subject
	combination.

	2) A markdown file titled "CodeBook.md" that documents the variables in the exported second Tidy dataset.

	3) This README.md file

The second Tidy Dataset of "Means" was exported from R as a csv file (courseProjectTidyDataset.csv), which has been uploaded to the Coursera Web site as part of the course project requirements.  The project requirements did not specify the file format for the exported results, so the csv format was used since it is much easier for the end user to view outside of R.

=============================================
Note: The use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
==============================================

## ======================
## R Program Code Summary
## ======================

Steps
1) Example code to set the Directory Location of the File Download and File Input for reading data.
2) Example code to set the Directory Location of the exporting data Output.
3) Example code for downloading the data from the URL.
4) Note: Steps 1-3 are example only because they require local user directory information
5) Note: Downloaded files were modified to convert Unix(Lf) to Dos(Cr/Lf)
6) Read Activity_Label File
7) Read Features File
8) Read Test Files
9) Read Train Files
10) Rename activityData Columns to "activityId" and "activityName"
11) Process featureData for use as XData Column Names. Modifies the original Feature names to better textual descriptions.
12) Renames Test Data Columns from V1, V2, etc. to Descriptive Names. Course Project Specification # 4 - 1 of 2 
13) Clips together Test Data files
14) Renames Train Data Columns from V1, V2, etc. to Descriptive Names. Course Project Specification # 4 - 2 of 2
15) Clips together Train Data files
16) Appends Test and Train data sets. Course Project Specification # 1
17) Inserts Descriptive Activity Data. Course Project Specification # 3
18) Subsets data to just required Variables (means and stds). Course Project Specification # 2
19) Create a second Tidy dataset of Means by activityName and subjectId. Course Project Specification # 5
20) Exports the second Tidy dataset as a csv to be uploaded to Coursera

## End R Program Code Summary
## ==========================

## ==================================
## Course Project Specification Notes

Note: The R program accomplishes the 5 stated requirements in a non-linier order (i.e., 4, 1, 3, 2, 5).  However, the correct results are achieved and I found this process to provide better control of each step, specifically when subsetting the data to the required "mean" and "std" variables.

Note: Requirement 1 calls for merging the Test and Training datasets.  This is completed after the variable are named (Requirement 4), however this processing order does not affect the final resulting Tidy dataset.

Note: Requirement 2 calls for extracting just variables of mean and standard deviation on measurements.  This is achieved after Requirements 3 and 4 are completed but this processing order does not affect the final resulting Tidy dataset.  Also note that my interpretation of what is meant my "mean" and "std" variables concluded that the "meanFreq" values should not be included in this set.  The thinking behind this was that weighted averages on "Freq" do not appear to be based on actual "raw measurements" and no Std was presented for the "Freq" values, so I choose to exclude them from the final set.  This has been documented as a valid approach in the course notes.

Note: Requirement 3 calls applying descriptive activity names to the activity data.  This is completed after the variable are named (Requirement 4) and before subsetting for just "mean" and "std" (Requirement 2), however this processing order does not affect the final resulting Tidy dataset.

Note: Requirement 4 calls applying descriptive variable names to the data.  For the YData and SubjectData I simply assigned names manually.  For the XData, I achieved this by modifying the Feature data, translating abbreviations to full text and adding underscores for readability.  XData names also had the special charaters "(", ")", and "-" removed for better compatibility with the R Code as well as other database and statistical applications (e.g., Oracle, MySQL, SAS, etc.).  These translations are documented in the CodeBook.md accompanying this README.md

Note: Requirement 5 calls for the creation of a second Tidy dataset of means processed from the first Tidy dataset by the cross combination of activityNames and subjectId.  This requirement is meet by Grouping and Aggregating the first Tidy dataset with Group By activityNames and subjectId.  These data sets are what is being referred to as "wide" datasets, in that they have on row for each activityName, subjectId combination and 66 measurement columns.  These datasets are both Tidy because they have one column for each data factor and measurement value, and one row for each observation or agragated onservation.

==============
R Code Listing
==============

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
 #fileDest <- paste(dataInputDir, "A1_data.zip", sep="")
 #download.file(A1fileURL, destfile=fileData, mode="wb")
 #
 # The resulting downloaded local Zip file was manually process to extract the data files.
 # Since the local machine being used was Windows 10, several files needed to be processed
 # by a local editor (MultiEdit) to convert the txt files from Unix(Lf) to Dos (Cr/Lf).
 # No other chages were made to the files. 
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
 # Write out subsetMeans data as a CSV file
outputFile <- paste(dataOutputDir, "courseProjectTidyDataset.csv", sep="")
write.table(subsetMeans, sep=",", row.names = FALSE, file=outputFile)
 #
 #
 # Notes for reading in data file from David Hood at:
 #   https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/ 
 # filePath <- "insert local directory of file location"
 # fileName <- subsetMeans.csv
 #data <- read.csv(paste(filePath, fileName, sep=""), header = TRUE)
 #View(data)

## ==================
## End R Code Listing
## ==================

## ==================================================================
## Original Dataset README.txt
## ==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

## ===============================
## End Original Dataset README.txt
## ===============================

