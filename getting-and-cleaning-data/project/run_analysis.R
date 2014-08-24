library(reshape2)

##
## This script does the following:
## 0 - Downloads the data if it isn't present
## 1 - Merges the training and the test sets to create one data set.
## 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3 - Uses descriptive activity names to name the activities in the data set
## 4 - Appropriately labels the data set with descriptive variable names. 
## 5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

run_analysis <- function() {

    ## Download the data if it isn't present.
    if (!file.exists('data')) dir.create('data') 

    if (!file.exists('./UCI HAR Dataset')) {

        url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
        download.file(url, destfile = './temp_dataset.zip', method = 'curl')
        unzip('./temp_dataset.zip', exdir = '.')
        file.remove('./temp_dataset.zip')
    }



    ## Merge the training and the test sets to create one data set.
    X_train    <- read.table('./UCI HAR Dataset/train/X_train.txt')
    X_test     <- read.table('./UCI HAR Dataset/test/X_test.txt')
    X_combined <- rbind(X_train, X_test)

    y_train    <- read.table('./UCI HAR Dataset/train/y_train.txt')
    y_test     <- read.table('./UCI HAR Dataset/test/y_test.txt')
    y_combined <- rbind(y_train, y_test)

    subject_train    <- read.table('./UCI HAR Dataset/train/subject_train.txt')
    subject_test     <- read.table('./UCI HAR Dataset/test/subject_test.txt')
    subject_combined <- rbind(subject_train, subject_test)



    ## Extract only the measurements on the mean and standard deviation.
    column_names  <- read.table('./UCI HAR Dataset/features.txt')
    relevant_cols <- grep('-mean[[:punct:]]|-std[[:punct:]]', column_names[, 2])
    X_combined    <- X_combined[, relevant_cols]



    ## Use descriptive activity names to name the activities in the data set
    activity_labels      <- read.table('./UCI HAR Dataset/activity_labels.txt')
    activity_labels[, 2] <- tolower(gsub('_', '', activity_labels[, 2]))
    y_combined[, 1]      <- activity_labels[y_combined[, 1], 2]



    ## Appropriately labels the data set with descriptive variable names
    names(X_combined)       <- tolower(gsub('[[:punct:]]', '', column_names[relevant_cols, 2]))
    names(y_combined)       <- 'activity'
    names(subject_combined) <- 'subject'



    ## Create original tidy dataset
    combined <- cbind(subject_combined, y_combined, X_combined)
    write.table(combined, './data/cleaned_data1.txt', row.names = FALSE)



    ## Create a second, independent tidy data set with the average of each variable for each activity and each subject.
    long <- melt(table, id.vars = c("subject", "activity"))
    wide <- dcast(long, subject + activity ~ variable, mean)
    write.table(wide, './data/cleaned_data2.txt', row.names = FALSE)
}
