---
title: "CodeBook"
author: "mapleset"
date: "July 25, 2015"
output: html_document
---

Description of work
===================
To tidy the original data, the training and test sets were merged into a single data set. From this, only the measurements on the mean and standard deviation for each measurement were selected. Descriptive activity names were then applied to the activities instead of the numbers 1-6.  At this point, the data was grouped by the subject volunteer number and the activity name.  Finally, the column names were cleaned up and the prefix 'GroupMean' applied to the beginning of each variable name, indicating that the value of each row was the mean of each grouping.

Definitions
=================
mean = Mean (average) value of a set of data points
std = Standard deviation
GroupMean = Mean of all samples taken for each grouping of Subject and Activity
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions

Units
=================
- Variable values are normalized and bounded within [-1,1]
- Prior to normalization, the units for acceleration were standard gravity units 'g' and gyro readings in radians/second

Variable names
=================
Subject = The volunteer subject number (1-30)
Activity = The activity being performed by the volunteer during data capture (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

The variables selected come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

GroupMean_tBodyAcc_mean_X
GroupMean_tBodyAcc_mean_Y
GroupMean_tBodyAcc_mean_Z
GroupMean_tBodyAcc_std_X
GroupMean_tBodyAcc_std_Y
GroupMean_tBodyAcc_std_Z
GroupMean_tGravityAcc_mean_X
GroupMean_tGravityAcc_mean_Y
GroupMean_tGravityAcc_mean_Z
GroupMean_tGravityAcc_std_X
GroupMean_tGravityAcc_std_Y
GroupMean_tGravityAcc_std_Z

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

GroupMean_tBodyAccJerk_mean_X
GroupMean_tBodyAccJerk_mean_Y
GroupMean_tBodyAccJerk_mean_Z
GroupMean_tBodyAccJerk_std_X
GroupMean_tBodyAccJerk_std_Y
GroupMean_tBodyAccJerk_std_Z
GroupMean_tBodyGyro_mean_X
GroupMean_tBodyGyro_mean_Y
GroupMean_tBodyGyro_mean_Z
GroupMean_tBodyGyro_std_X
GroupMean_tBodyGyro_std_Y
GroupMean_tBodyGyro_std_Z
GroupMean_tBodyGyroJerk_mean_X
GroupMean_tBodyGyroJerk_mean_Y
GroupMean_tBodyGyroJerk_mean_Z
GroupMean_tBodyGyroJerk_std_X
GroupMean_tBodyGyroJerk_std_Y
GroupMean_tBodyGyroJerk_std_Z
GroupMean_tBodyAccMag_mean
GroupMean_tBodyAccMag_std
GroupMean_tGravityAccMag_mean
GroupMean_tGravityAccMag_std
GroupMean_tBodyAccJerkMag_mean
GroupMean_tBodyAccJerkMag_std
GroupMean_tBodyGyroMag_mean
GroupMean_tBodyGyroMag_std
GroupMean_tBodyGyroJerkMag_mean
GroupMean_tBodyGyroJerkMag_std

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

GroupMean_fBodyAcc_mean_X
GroupMean_fBodyAcc_mean_Y
GroupMean_fBodyAcc_mean_Z
GroupMean_fBodyAcc_std_X
GroupMean_fBodyAcc_std_Y
GroupMean_fBodyAcc_std_Z
GroupMean_fBodyAcc_meanFreq_X
GroupMean_fBodyAcc_meanFreq_Y
GroupMean_fBodyAcc_meanFreq_Z
GroupMean_fBodyAccJerk_mean_X
GroupMean_fBodyAccJerk_mean_Y
GroupMean_fBodyAccJerk_mean_Z
GroupMean_fBodyAccJerk_std_X
GroupMean_fBodyAccJerk_std_Y
GroupMean_fBodyAccJerk_std_Z
GroupMean_fBodyAccJerk_meanFreq_X
GroupMean_fBodyAccJerk_meanFreq_Y
GroupMean_fBodyAccJerk_meanFreq_Z
GroupMean_fBodyGyro_mean_X
GroupMean_fBodyGyro_mean_Y
GroupMean_fBodyGyro_mean_Z
GroupMean_fBodyGyro_std_X
GroupMean_fBodyGyro_std_Y
GroupMean_fBodyGyro_std_Z
GroupMean_fBodyGyro_meanFreq_X
GroupMean_fBodyGyro_meanFreq_Y
GroupMean_fBodyGyro_meanFreq_Z
GroupMean_fBodyAccMag_mean
GroupMean_fBodyAccMag_std
GroupMean_fBodyAccMag_meanFreq
GroupMean_fBodyBodyAccJerkMag_mean
GroupMean_fBodyBodyAccJerkMag_std
GroupMean_fBodyBodyAccJerkMag_meanFreq
GroupMean_fBodyBodyGyroMag_mean
GroupMean_fBodyBodyGyroMag_std
GroupMean_fBodyBodyGyroMag_meanFreq
GroupMean_fBodyBodyGyroJerkMag_mean
GroupMean_fBodyBodyGyroJerkMag_std
GroupMean_fBodyBodyGyroJerkMag_meanFreq


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

GroupMean_angle_tBodyAccMean_gravity
GroupMean_angle_tBodyAccJerkMean__gravityMean
GroupMean_angle_tBodyGyroMean_gravityMean
GroupMean_angle_tBodyGyroJerkMean_gravityMean
GroupMean_angle_X_gravityMean
GroupMean_angle_Y_gravityMean
GroupMean_angle_Z_gravityMean



