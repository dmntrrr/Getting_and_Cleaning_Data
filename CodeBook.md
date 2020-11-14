---
title: "CodeBook"
author: "DZMITRYI"
date: "11/14/2020"
output: md_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## CodeBook for the project

# Variables description
The experiments have been carried out with a group of 30 volunteers [what represents the variable called SUBJECT] within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) [what represents the variable called ACTIVITY] wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

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

# Description of the process of cleaning up the dataset
First, the library named "DPLYR", in order to be able to perform different types of transformations on the original dataset. Then, the file feature.txt was read by Rstudio in order to get the names of the variables, which were given with the raw dataset, and after that, according to the instructions, only the measurements on the mean and standard deviation for each measurement were exctracted via variable measure. At the same time, the vector act_labels was created, which contains all 6 names of the activities observed during the experiment.
After this, datasets connected with test set were uploaded into Rstudio, with given column names. Secondly, 3 datasets were merged into one, what was the representation of test set. 
The same steps were applied to train set.
Then it was time to merge our test and train sets into one common dataset, which received name DATA. Along with it, numbers, which were indicating activity type were replaced with the actual names and the dataset was sort in ascending order by the variable subject.

# Futher steps
Then, based on the average [MEAN function was applied] of each variable for each activity and each subject, the second dataset was created with the name DATA2.
