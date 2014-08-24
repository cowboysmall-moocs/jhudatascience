# Code Book for cleaned UCI HAR Dataset

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

The features selected for the tidy dataset were a subset consisting of the mean and standard 
deviation values. Also, activities were given more meaningful names. Please refer to 
features_info.txt and README.txt for a full description of the original data

The incuded features:

- "subject"
- "activity"
- "tbodyaccmeanx"
- "tbodyaccmeany"
- "tbodyaccmeanz"
- "tbodyaccstdx"
- "tbodyaccstdy"
- "tbodyaccstdz"
- "tgravityaccmeanx"
- "tgravityaccmeany"
- "tgravityaccmeanz"
- "tgravityaccstdx"
- "tgravityaccstdy"
- "tgravityaccstdz"
- "tbodyaccjerkmeanx"
- "tbodyaccjerkmeany"
- "tbodyaccjerkmeanz"
- "tbodyaccjerkstdx"
- "tbodyaccjerkstdy"
- "tbodyaccjerkstdz"
- "tbodygyromeanx"
- "tbodygyromeany"
- "tbodygyromeanz"
- "tbodygyrostdx"
- "tbodygyrostdy"
- "tbodygyrostdz"
- "tbodygyrojerkmeanx"
- "tbodygyrojerkmeany"
- "tbodygyrojerkmeanz"
- "tbodygyrojerkstdx"
- "tbodygyrojerkstdy"
- "tbodygyrojerkstdz"
- "tbodyaccmagmean"
- "tbodyaccmagstd"
- "tgravityaccmagmean"
- "tgravityaccmagstd"
- "tbodyaccjerkmagmean"
- "tbodyaccjerkmagstd"
- "tbodygyromagmean"
- "tbodygyromagstd"
- "tbodygyrojerkmagmean"
- "tbodygyrojerkmagstd"
- "fbodyaccmeanx"
- "fbodyaccmeany"
- "fbodyaccmeanz"
- "fbodyaccstdx"
- "fbodyaccstdy"
- "fbodyaccstdz"
- "fbodyaccjerkmeanx"
- "fbodyaccjerkmeany"
- "fbodyaccjerkmeanz"
- "fbodyaccjerkstdx"
- "fbodyaccjerkstdy"
- "fbodyaccjerkstdz"
- "fbodygyromeanx"
- "fbodygyromeany"
- "fbodygyromeanz"
- "fbodygyrostdx"
- "fbodygyrostdy"
- "fbodygyrostdz"
- "fbodyaccmagmean"
- "fbodyaccmagstd"
- "fbodybodyaccjerkmagmean"
- "fbodybodyaccjerkmagstd"
- "fbodybodygyromagmean"
- "fbodybodygyromagstd"
- "fbodybodygyrojerkmagmean"
- "fbodybodygyrojerkmagstd"

