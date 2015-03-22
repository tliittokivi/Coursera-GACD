
# Code Book

## Original data

Original Raw Data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Description how original data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## How data was processed

The following transformations are performed to clean up the data:
* training and the test sets are combined
* Only mean and standard deviation for each measurement are used (features having mean() or std() in feature name)
* Subject and activity columns are added to raw data (using descriptive activity names from activity_labels.txt)
* Feature names are renamed to be more readable and R-friendly using conversion: xFeature-function()-coord -> functionFeatureCoord (e.g. tBodyAcc-std()-Y -> stdBodyAccY)
* Finally, tidy data set is created by grouping data by activity and subject, and calculating mean for each variable for each group

## Tidy data

* There are 30 users having 6 different activities. Data is grouped by subject and activity, so there are 180 (30 * 6) rows in tidy data
* Columns include subject, activity and any column from raw data having mean() or std(), totally 68 columns.
* As with original data, all features in tidy data are normalized and bounded within [-1,1].

Below is full list of columns. See features_info.txt from original data for feature descriptions.
```
subject
activity
meanBodyAccX
meanBodyAccY
meanBodyAccZ
stdBodyAccX
stdBodyAccY
stdBodyAccZ
meanGravityAccX
meanGravityAccY
meanGravityAccZ
stdGravityAccX
stdGravityAccY
stdGravityAccZ
meanBodyAccJerkX
meanBodyAccJerkY
meanBodyAccJerkZ
stdBodyAccJerkX
stdBodyAccJerkY
stdBodyAccJerkZ
meanBodyGyroX
meanBodyGyroY
meanBodyGyroZ
stdBodyGyroX
stdBodyGyroY
stdBodyGyroZ
meanBodyGyroJerkX
meanBodyGyroJerkY
meanBodyGyroJerkZ
stdBodyGyroJerkX
stdBodyGyroJerkY
stdBodyGyroJerkZ
meanBodyAccMag
stdBodyAccMag
meanGravityAccMag
stdGravityAccMag
meanBodyAccJerkMag
stdBodyAccJerkMag
meanBodyGyroMag
stdBodyGyroMag
meanBodyGyroJerkMag
stdBodyGyroJerkMag
meanBodyAccX.1
meanBodyAccY.1
meanBodyAccZ.1
stdBodyAccX.1
stdBodyAccY.1
stdBodyAccZ.1
meanBodyAccJerkX.1
meanBodyAccJerkY.1
meanBodyAccJerkZ.1
stdBodyAccJerkX.1
stdBodyAccJerkY.1
stdBodyAccJerkZ.1
meanBodyGyroX.1
meanBodyGyroY.1
meanBodyGyroZ.1
stdBodyGyroX.1
stdBodyGyroY.1
stdBodyGyroZ.1
meanBodyAccMag.1
stdBodyAccMag.1
meanBodyBodyAccJerkMag
stdBodyBodyAccJerkMag
meanBodyBodyGyroMag
stdBodyBodyGyroMag
meanBodyBodyGyroJerkMag
stdBodyBodyGyroJerkMag
```



