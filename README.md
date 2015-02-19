# README for Getting_and_Cleaning_Data_Course_Project
Script written for Coursera Course - Getting and Cleaning Data

This repository contains an R script. The purpose of this script to clean up and create tidy data collected from the accelerometers from the Samsung Galaxy S smartphone. It is part of the course requirement of the module Getting and Cleaning Data taught by Johns Hopkins University on Coursera.

The data is from the following zip file: [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A description of the experiment this data comes from exists in the following url: [Experiment](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

See Codewords.MD for more details regarding the variables.

## Summary of the script

The script does the following:

* Downloads the zip file to the working directory if it doesn't find it there already. Alternatively, download the zip file above and place it in your working directory to skip this.
* Unzips the data into the folder "./data"
* Reads the test and training data sets into R
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Writes the tidied data into "./tidyData.txt" in your working directory.

