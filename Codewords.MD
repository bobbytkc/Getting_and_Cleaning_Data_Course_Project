# Codewords

The content below describes the variables in the output file tidyData.txt. They are the column names in tidyData.txt.
"subject" and "activity" data entries correspond to the subject number and the activity type the subject is engaged in 
while the measurements are performed. The rest contain the mean values of a given data. For eg. 
the data under "tBodyAcc-mean()-X"  corresponds to the mean value of the mean data collected for tBodyAcc, 
in direction of the x-axis. "tBodyAcc" is referred to as the measurement, "-mean()"  and "-X" are options.

The following is a list of measurement data. :

* tBodyAcc
* tGravityAcc
* tBodyAccJerk
* tBodyGyro
* tBodyGyroJerk
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc
* fBodyAccJerk
* fBodyGyro
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

They can be further modified by the following options:
* -XYZ *indicates axial direction of the measurement*
* -mean() *indicates mean value of the signal*
* -meanFreq() *mean weighted average of the frequency components to obtain a mean frequency*
* -std() *standard deviation*


Please see features_info.txt in the file [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) for more information regarding the measurements.
