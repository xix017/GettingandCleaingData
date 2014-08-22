Project of Coursera: Getting and Cleaning Data
======================================================

## Background

This is a project of a Coursera course Getting and Cleaning Data.

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.


## Data Given for this project

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

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 
'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


### Assignment of this project

- Merges the training and the test sets to create one data set.

In this part, since the size of the data set is too large that it takes too long time for the computer to run the "merge" function. Therefore, I use "rbind" to merge these two sets

- Extracts only the measurements on the mean and standard deviation for each measurement.

In this part, the set of variables that were estimated from the signals I consider are:
"mean()" and "std()". "meanFreq()" was not added into the fowllong analysis.

- Uses descriptive activity names to name the activities in the data set.

Names of the activity could be found in the file "activity_labels.txt"

- Appropriately labels the data set with descriptive variable names. 

In this part, after reading the "activity_labels.txt" to get the labels, we can see the first column of the label set was the categorical value of the activities. Therefore, use a loop to compare the values of the features Activity in each row of the dataset we have to the label set, we can transfrom the numerical values in the dataset into the name of the activities. 

- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Use an "aggregate" function we can achieve this easily.
