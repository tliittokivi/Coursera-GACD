# required libs
library(dplyr)


# function that analyzes raw data in given directory and creates tidy data 
run_analysis <- function(dir) {
    
    # help function to apply dir to filename 
    getfile <- function(fname) { paste(dir, fname, sep="") }
    
    # help function to get raw data of one type, which is either "test" or "train"
    getRawData <- function(type, colNames, colFilter) {
        
        # get all raw data
        setFile <- paste(type, "/X_", type, ".txt", sep="")
        raw <- read.table(getfile(setFile), header=FALSE, col.names=colNames)
        
        # Extract only columns that are needed
        raw <- raw[, colFilter]
        
        # get activity data, and add it as new column to raw data
        activityFile <- paste(type, "/Y_", type, ".txt", sep="")
        activities <- read.table(getfile(activityFile), header=FALSE, col.names="activity")
        # replace activity numbers with descriptive activity names
        activity.labels <- read.table(getfile("activity_labels.txt"), sep=" ", header=FALSE)        
        activities <- sapply(activities, function(it) { activity.labels[it,2] })
        raw <- cbind(activities, raw)    
    
        # get subject data, and add it as new column to raw data
        subjectFile <- paste(type, "/subject_", type, ".txt", sep="")
        subjects <- read.table(getfile(subjectFile), header=FALSE, col.names="subject")
        raw <- cbind(subjects, raw)    
    }
    
    # get feature names 
    features <- read.table(getfile("features.txt"), sep=" ", header=FALSE)
    features <- as.character(features[,2])
    
    # before we make feature names more user friendly, store what columns should be included
    # (anything using std or mean function)
    colFilter <- grep("std\\(\\)|mean\\(\\)", features)
    
    # Make feature names bit more readable using conversion: xFeature-function()-coord -> functionFeatureCoord
    # Some examples:
    #  tBodyAcc-mean()-Z -> meanBodyAccZ  meanBodyAccZ
    #  tBodyAcc-std()-Y -> stdBodyAccY
    #  fBodyAccMag-min() -> minBodyAccMag
    colNames <- sub(".(.*)-(.*)\\(\\)-(?:-(.*))?", "\\2\\1\\3", features)
    
    # get test and training set raw data
    rawTestSet <- getRawData("test", colNames, colFilter)  
    rawTrainingSet <- getRawData("train", colNames, colFilter) 
    
    # combine sets
    rawSet <- rbind(rawTestSet, rawTrainingSet)
    
    # finally use dplyr function chain to group by subject/activity and get mean of each variable
    result <- tbl_df(rawSet) %>%
    group_by(subject, activity) %>%
    summarise_each(funs(mean))
}

