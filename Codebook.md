The Codebook
========================================================

This will describe the Tidy Data set in detail along with the process used to create the data. This R code will transform the UCI Data on Human Activity Recognition Using Smartphones into a Tidy Data Set. More information on the data set can be obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and 

## The Raw Data
The raw data set used can be found at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## The Transformation Process

#### Step 1 - Preparation
* Read all of the appropriate data files into R
* Assign easy to understand variables names to each of the data files
* Update the header names for our lookup table data

#### Step 2 - Subset the data
* Create a dataset that contains only the observations that we would like to perform operations on

#### Step 3 - Combine all observations
* Combine the subject information with the activity and observation data for our training set
* Repeat the process for our test data set
* Combine these two data sets into one large data set
* Merge in the Activity Label to provide a proper header name and remove the ID column

#### Step 4 - Reshape the data
* Reshape the data grouping the observations to calculate the mean for each Subject and Activity combinations for all remaining observations

#### Step 5 - Update the Header Values
* Replace the illegible header names with more meaningful English value names

#### Step 6 - Write out the CSV File
* Write out the CSV file to the appropriate working directory

## Study Design 
After retrieving the data from the UCI a process was reviewed for taking a subset of the data including only mean and standard deviation values. It was determined to only take the mean and standard deviation for the measures of the 3-axial and totals thus removing the mean calculation for the angle data definition. 

## Data Variable Descriptions

The following describes the how the data was in its raw state. After the transformation applied above, and changing the variables names as updated in the description below, the mean of each remaining variable was calcuate for each activity and each subject. 

> Data was captured on 3-axial at a constant rate of 50Hz. 

> The features selected for this database come from the accelerometer and gyroscope 3-axial (X, Y, Z) raw signals. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (TimeBodyAcceleration-XYZ and TimeGravityAcceleration-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyAccelerationJerk-XYZ and TimeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (TimeBodyAccellerationMagnitude, TimeGravityAccellerationMagnitude, TimeBodyAccellerationJerkMagnitude, TimeBodyGyroscopeMagnitude, TimeBodyGyroscopeJerkMagnitude). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing FrequencyBodyAcceleration-XYZ, FrequencyBodyAccellerationJerk-XYZ, FrequencyBodyGyroscope-XYZ, FrequencyBodyAccellerationJerkMagnitude, FrequencyBodyGyroscopeMagnitude, FrequencyBodyGyroscopeJerkMagnitude.

> These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> From here, the mean and standard deviation were estimated from the signals. 