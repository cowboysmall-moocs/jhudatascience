# Cleaned UCI HAR Dataset



## Introduction

This project contains a script used to clean the UCI HAR Dataset



## Description

The script takes the following steps:

1. checks to see if the required dependencies are present, and installs them if necessary

        if (!require('reshape2')) {

            install.packages('reshape2')
            require('reshape2')
        }

2. creates the output directory if not already created

        if (!file.exists('data')) dir.create('data') 

3. checks to see if the data is present, and if not it downloads the data

        if (!file.exists('./UCI HAR Dataset')) {

            url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
            download.file(url, destfile = './temp_dataset.zip', method = 'curl')
            unzip('./temp_dataset.zip', exdir = '.')
            file.remove('./temp_dataset.zip')
        }

4. merges the training and test sets to create a single dataset

        X_train    <- read.table('./UCI HAR Dataset/train/X_train.txt')
        X_test     <- read.table('./UCI HAR Dataset/test/X_test.txt')
        X_combined <- rbind(X_train, X_test)

        y_train    <- read.table('./UCI HAR Dataset/train/y_train.txt')
        y_test     <- read.table('./UCI HAR Dataset/test/y_test.txt')
        y_combined <- rbind(y_train, y_test)

        subject_train    <- read.table('./UCI HAR Dataset/train/subject_train.txt')
        subject_test     <- read.table('./UCI HAR Dataset/test/subject_test.txt')
        subject_combined <- rbind(subject_train, subject_test)

5. retains only the measurements of relating to mean and standard deviation

        column_names  <- read.table('./UCI HAR Dataset/features.txt')
        relevant_cols <- grep('-mean[[:punct:]]|-std[[:punct:]]', column_names[, 2])
        X_combined    <- X_combined[, relevant_cols]

6. gives meaningful names to the activity names

        activity_labels      <- read.table('./UCI HAR Dataset/activity_labels.txt')
        activity_labels[, 2] <- tolower(gsub('_', '', activity_labels[, 2]))
        y_combined[, 1]      <- activity_labels[y_combined[, 1], 2]

7. ensure the data has appropriate variable names

        names(X_combined)       <- tolower(gsub('[[:punct:]]', '', column_names[relevant_cols, 2]))
        names(y_combined)       <- 'activity'
        names(subject_combined) <- 'subject'

8. write the first tidy dataset out to a file - containing non-sumarized data

        combined <- cbind(subject_combined, y_combined, X_combined)
        write.table(combined, './data/cleaned_data1.txt', row.names = FALSE)

9. create and write the second tidy dataset out to a file (to be submitted) - with summarized data

        long <- melt(table, id.vars = c("subject", "activity"))
        wide <- dcast(long, subject + activity ~ variable, mean)
        write.table(wide, './data/cleaned_data2.txt', row.names = FALSE)



## Execution

To execute the run_analysis function you need to take the following steps:

1. clone the repository

        $ git clone git@github.com:cowboysmall/datascience.git

2. cd into the repository, and continue into the project 

        $ cd datascience/getting-and-cleaning-data/project/

3. start up R, and from within R source and run the script:

        > source('./run_analysis.R')
        > run_analysis()

The run_analysis function can, of course, be run from within RStudio. The only difference 
to the above descriptions is changing the current directory to the project directory. 

