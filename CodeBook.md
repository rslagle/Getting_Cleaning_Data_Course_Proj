# Data Dictionary / CodeBook for courseProjectTidyDataset.txt

Note: See associated README.md for additional information on the data processing that took the original dataset and
produced two intermediate Tidy datasets, and ultimately exported this dataset.

Note: This dataset contains both Test data and Training Data from the Original Dataset

Note: All detailed original variable descriptions are at bottom of this CodeBook under "Documentation from Original Dataset"

## ====================================================
## File courseProjectTidyDataset.txt Dataset Dictionary
## ====================================================

```
activityName
	Activity Name - Text filed describing the Activity during measurements
	Unique Values are:
		LAYING
		SITTING
		STANDING
		WALKING
		WALKING_DOWNSTAIRS
		WALKING_UPSTAIRS

subjectId
	Subject Identification Code - Numeric ID assigned to each subject
	Integer - Range from 1-30

Frequency_Body_Accelerometer_Jerk_mean_X
	Average value of the orginal variable:	fBodyAccJerk-mean()-X
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Accelerometer_Jerk_mean_Y
	Average value of the orginal variable:	fBodyAccJerk-mean()-Y
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Accelerometer_Jerk_mean_Z
	Average value of the orginal variable:	fBodyAccJerk-mean()-Z
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Accelerometer_Jerk_std_X
	Average value of the orginal variable:	fBodyAccJerk-std()-X
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Accelerometer_Jerk_std_Y
	Average value of the orginal variable:	fBodyAccJerk-std()-Y
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Accelerometer_Jerk_std_Z
	Average value of the orginal variable:	fBodyAccJerk-std()-Z
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Accelerometer_Magnitude_mean
	Average value of the orginal variable:	fBodyAccMag-mean()
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Accelerometer_Magnitude_std
	Average value of the orginal variable:	fBodyAccMag-std()
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Accelerometer_mean_X
	Average value of the orginal variable:	fBodyAcc-mean()-X
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Accelerometer_mean_Y
	Average value of the orginal variable:	fBodyAcc-mean()-Y
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Accelerometer_mean_Z
	Average value of the orginal variable:	fBodyAcc-mean()-Z
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Accelerometer_std_X
	Average value of the orginal variable:	fBodyAcc-std()-X
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Accelerometer_std_Y
	Average value of the orginal variable:	fBodyAcc-std()-Y
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Accelerometer_std_Z
	Average value of the orginal variable:	fBodyAcc-std()-Z
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Body_Accelerometer_Jerk_Magnitude_mean
	Average value of the orginal variable:	fBodyBodyAccJerkMag-mean()
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Body_Accelerometer_Jerk_Magnitude_std
	Average value of the orginal variable:	fBodyBodyAccJerkMag-std()
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Body_Gyro_Jerk_Magnitude_mean
	Average value of the orginal variable:	fBodyBodyGyroJerkMag-mean()
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Body_Gyro_Jerk_Magnitude_std
	Average value of the orginal variable:	fBodyBodyGyroJerkMag-std()
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Body_Gyro_Magnitude_mean
	Average value of the orginal variable:	fBodyBodyGyroMag-mean()
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Body_Gyro_Magnitude_std
	Average value of the orginal variable:	fBodyBodyGyroMag-std()
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Gyro_mean_X
	Average value of the orginal variable:	fBodyGyro-mean()-X
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Gyro_mean_Y
	Average value of the orginal variable:	fBodyGyro-mean()-Y
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Gyro_mean_Z
	Average value of the orginal variable:	fBodyGyro-mean()-Z
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Gyro_std_X
	Average value of the orginal variable:	fBodyGyro-std()-X
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Gyro_std_Y
	Average value of the orginal variable:	fBodyGyro-std()-Y
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Frequency_Body_Gyro_std_Z
	Average value of the orginal variable:	fBodyGyro-std()-Z
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Accelerometer_Jerk_Magnitude_mean
	Average value of the orginal variable:	tBodyAccJerkMag-mean()
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Accelerometer_Jerk_Magnitude_std
	Average value of the orginal variable:	tBodyAccJerkMag-std()
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Accelerometer_Jerk_mean_X
	Average value of the orginal variable:	tBodyAccJerk-mean()-X
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Accelerometer_Jerk_mean_Y
	Average value of the orginal variable:	tBodyAccJerk-mean()-Y
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Accelerometer_Jerk_mean_Z
	Average value of the orginal variable:	tBodyAccJerk-mean()-Z
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Accelerometer_Jerk_std_X
	Average value of the orginal variable:	tBodyAccJerk-std()-X
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Accelerometer_Jerk_std_Y
	Average value of the orginal variable:	tBodyAccJerk-std()-Y
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Accelerometer_Jerk_std_Z
	Average value of the orginal variable:	tBodyAccJerk-std()-Z
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Accelerometer_Magnitude_mean
	Average value of the orginal variable:	tBodyAccMag-mean()
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Accelerometer_Magnitude_std
	Average value of the orginal variable:	tBodyAccMag-std()
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Accelerometer_mean_X
	Average value of the orginal variable:	tBodyAcc-mean()-X
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Accelerometer_mean_Y
	Average value of the orginal variable:	tBodyAcc-mean()-Y
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Accelerometer_mean_Z
	Average value of the orginal variable:	tBodyAcc-mean()-Z
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Accelerometer_std_X
	Average value of the orginal variable:	tBodyAcc-std()-X
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Accelerometer_std_Y
	Average value of the orginal variable:	tBodyAcc-std()-Y
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Accelerometer_std_Z
	Average value of the orginal variable:	tBodyAcc-std()-Z
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Gyro_Jerk_Magnitude_mean
	Average value of the orginal variable:	tBodyGyroJerkMag-mean()
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Gyro_Jerk_Magnitude_std
	Average value of the orginal variable:	tBodyGyroJerkMag-std()
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Gyro_Jerk_mean_X
	Average value of the orginal variable:	tBodyGyroJerk-mean()-X
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Gyro_Jerk_mean_Y
	Average value of the orginal variable:	tBodyGyroJerk-mean()-Y
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Gyro_Jerk_mean_Z
	Average value of the orginal variable:	tBodyGyroJerk-mean()-Z
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Gyro_Jerk_std_X
	Average value of the orginal variable:	tBodyGyroJerk-std()-X
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Gyro_Jerk_std_Y
	Average value of the orginal variable:	tBodyGyroJerk-std()-Y
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Gyro_Jerk_std_Z
	Average value of the orginal variable:	tBodyGyroJerk-std()-Z
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Gyro_Magnitude_mean
	Average value of the orginal variable:	tBodyGyroMag-mean()
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Gyro_Magnitude_std
	Average value of the orginal variable:	tBodyGyroMag-std()
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Gyro_mean_X
	Average value of the orginal variable:	tBodyGyro-mean()-X
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Gyro_mean_Y
	Average value of the orginal variable:	tBodyGyro-mean()-Y
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Gyro_mean_Z
	Average value of the orginal variable:	tBodyGyro-mean()-Z
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Gyro_std_X
	Average value of the orginal variable:	tBodyGyro-std()-X
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Gyro_std_Y
	Average value of the orginal variable:	tBodyGyro-std()-Y
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Body_Gyro_std_Z
	Average value of the orginal variable:	tBodyGyro-std()-Z
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Gravity_Accelerometer_Magnitude_mean
	Average value of the orginal variable:	tGravityAccMag-mean()
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Gravity_Accelerometer_Magnitude_std
	Average value of the orginal variable:	tGravityAccMag-std()
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Gravity_Accelerometer_mean_X
	Average value of the orginal variable:	tGravityAcc-mean()-X
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Gravity_Accelerometer_mean_Y
	Average value of the orginal variable:	tGravityAcc-mean()-Y
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Gravity_Accelerometer_mean_Z
	Average value of the orginal variable:	tGravityAcc-mean()-Z
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Gravity_Accelerometer_std_X
	Average value of the orginal variable:	tGravityAcc-std()-X
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Gravity_Accelerometer_std_Y
	Average value of the orginal variable:	tGravityAcc-std()-Y
	Averaged by Activity and Subject ID
	Decimal number [-1,1]

Time_Gravity_Accelerometer_std_Z
	Average value of the orginal variable:	tGravityAcc-std()-Z
	Averaged by Activity and Subject ID
	Decimal number [-1,1]
```

## ===================
## End Data Dictionary
## ===================

## ==================================
## Documentation from Original Dataset
## Feature Selection 
## =================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

## =================================
## End Orginal Dataset Documentation
## =================================