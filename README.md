---
title: "README.md"
output: word_document
---
**File Description**  
User reference for this project, entitled *Getting and Cleaning Data Course Project, January 2016*


**Project Description**  
This project is involves preparing raw data collected from the accelerometers of Samsung Galaxy S smartphones for exploratory analysis. The raw data used for this project exist in a number of files and and exhibit characteriscs of untidy data. The purpose of this project is to aggregate and clean the disparate accelerometer data.  

The original data for this project can be obtained at: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
  
  
**Project Instructions**  
    1. Merge the training and test data sets to create one data set.  
    2. Extract only the measurements on the mean and standard deviation for each measurement.  
    3. Use descriptive activity names to name the activities in the data set.  
    4. Appropriately label the data set with descriptive variable names.  
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
  
  
**Project Contents**    
This repo contains three files (in addition to this README). The name and a brief description of each of these three files is included in the following table:

*Item Name*     |     Description  
---------     |     -----------  
*tidy_data.txt*    | A tidy data set that includes the average of a range of observed variables for each activity type and each subject measured within the accelerometer data set  
*run_analysis.R*    | Scripts used to perform the operations listed in the *Project Instructions* section of this document to create the tidy data set  
*CodeBook.md*    | Description of the variables, data, and transformations used to generate the tidy data set

**Using This Project**  
Prior to executing the application found within *run_analysis.R*, ensure that the necessary files are downloaded (from the link provided above) to your working directory. Do not change the file names as they are found at their origin. Executing this application will generate the tidy data set, which will be saved in your working directory.
