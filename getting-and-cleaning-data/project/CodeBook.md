# Code Book For Cleaned UCI HAR Dataset



## Introduction

This project produces a tidy subset of the "Human Activity Recognition Using Smartphones"
dataset, which is available 
[here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).



## Features

From the original documentation:

> The experiments have been carried out with a group of 30 volunteers 
> within an age bracket of 19-48 years. Each person performed six activities 
> (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
> wearing a smartphone (Samsung Galaxy S II) on the waist. 
>
> The features selected for this database come from the 
> accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ
>
> These signals were used to estimate variables of the feature vector for 
> each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and 
> Z directions.
>
> - tBodyAcc-XYZ
> - tGravityAcc-XYZ
> - tBodyAccJerk-XYZ
> - tBodyGyro-XYZ
> - tBodyGyroJerk-XYZ
> - tBodyAccMag
> - tGravityAccMag
> - tBodyAccJerkMag
> - tBodyGyroMag
> - tBodyGyroJerkMag
> - fBodyAcc-XYZ
> - fBodyAccJerk-XYZ
> - fBodyGyro-XYZ
> - fBodyAccMag
> - fBodyAccJerkMag
> - fBodyGyroMag
> - fBodyGyroJerkMag
> 
> The set of variables that were estimated from these signals are: 
> 
> - mean(): Mean value
> - std(): Standard deviation
> - mad(): Median absolute deviation 
> - max(): Largest value in array
> - min(): Smallest value in array
> - sma(): Signal magnitude area
> - energy(): Energy measure. Sum of the squares divided by the number of values. 
> - iqr(): Interquartile range 
> - entropy(): Signal entropy
> - arCoeff(): Autorregresion coefficients with Burg order equal to 4
> - correlation(): correlation coefficient between two signals
> - maxInds(): index of the frequency component with largest magnitude
> - meanFreq(): Weighted average of the frequency components to obtain a mean frequency
> - skewness(): skewness of the frequency domain signal 
> - kurtosis(): kurtosis of the frequency domain signal 
> - bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
> - angle(): Angle between to vectors.


The features selected for the tidy dataset were a subset consisting of the mean and standard 
deviation values. Also, activities were given more meaningful names. Please refer to 
features_info.txt and README.txt for a full description of the original data

The incuded features:

- subject
- activity
- tbodyaccmeanx
- tbodyaccmeany
- tbodyaccmeanz
- tbodyaccstdx
- tbodyaccstdy
- tbodyaccstdz
- tgravityaccmeanx
- tgravityaccmeany
- tgravityaccmeanz
- tgravityaccstdx
- tgravityaccstdy
- tgravityaccstdz
- tbodyaccjerkmeanx
- tbodyaccjerkmeany
- tbodyaccjerkmeanz
- tbodyaccjerkstdx
- tbodyaccjerkstdy
- tbodyaccjerkstdz
- tbodygyromeanx
- tbodygyromeany
- tbodygyromeanz
- tbodygyrostdx
- tbodygyrostdy
- tbodygyrostdz
- tbodygyrojerkmeanx
- tbodygyrojerkmeany
- tbodygyrojerkmeanz
- tbodygyrojerkstdx
- tbodygyrojerkstdy
- tbodygyrojerkstdz
- tbodyaccmagmean
- tbodyaccmagstd
- tgravityaccmagmean
- tgravityaccmagstd
- tbodyaccjerkmagmean
- tbodyaccjerkmagstd
- tbodygyromagmean
- tbodygyromagstd
- tbodygyrojerkmagmean
- tbodygyrojerkmagstd
- fbodyaccmeanx
- fbodyaccmeany
- fbodyaccmeanz
- fbodyaccstdx
- fbodyaccstdy
- fbodyaccstdz
- fbodyaccjerkmeanx
- fbodyaccjerkmeany
- fbodyaccjerkmeanz
- fbodyaccjerkstdx
- fbodyaccjerkstdy
- fbodyaccjerkstdz
- fbodygyromeanx
- fbodygyromeany
- fbodygyromeanz
- fbodygyrostdx
- fbodygyrostdy
- fbodygyrostdz
- fbodyaccmagmean
- fbodyaccmagstd
- fbodybodyaccjerkmagmean
- fbodybodyaccjerkmagstd
- fbodybodygyromagmean
- fbodybodygyromagstd
- fbodybodygyrojerkmagmean
- fbodybodygyrojerkmagstd



## Transformations

The follwoing work was done on the data:

1. only measurement variables relating to mean and standard deviation were retained

2. all punctuation was removed from variable names (such as '()')

3. all variable names were made lowercase

4. more meaningful variable names were added where appropriate

5. the subject identifier was included in the data

6. the activity description was included in place of activity identifier

