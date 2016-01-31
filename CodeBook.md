---
title: "CodeBook.md"
output: word_document
---
**File Description**    
Description of the data used in this project  

**Data Decription**    
30 volunteers ('subjects'), ages 19-48, performed six activities ('ativity') while wearing a Samsung Galaxy S II smartphone on their waist. The smartphone's embedded accelerometer and gyroscope were used to captured the triaxial linear acceleration and angular velocity of each subject while performaing each activity.   
    1. WALKING   
    2. WALKING_UPSTAIRS  
    3. WALKING_DOWNSTAIRS  
    4. SITTING  
    5. STANDING  
    6. LAYING  

The observations were randomly partitioned by subject into two data sets - training data (70% of subjects) and test data (30% of subjects). 

**Signals and Variables**  

Signal name | Reassigned 'tidy' name | Description  
------------- | ------------- | -----------  
tBodyAcc | TimeBodyAcceleration | 
tGravityAcc | TimeGravityAcceleration | 
tBodyAccJerk | TimeBodyAccelerationJerk | 
tBodyGyro | TimeBodyGyro | 
tBodyGyroJerk | TimeBodyGyroJerk | 
tBodyAccMag | TimeBodyAccelerationMagnitude | 
tGravityAccMag | TimeGravityAccelerationMagnitude | 
tBodyAccJerkMag | TimeBodyAccelerationJerkMagnitude | 
tBodyGyroMag | TimeBodyGyroMagnitude | 
tBodyGyroJerkMag | TimeBodyGyroJerkMagnitude | 
fBodyAcc | FrequencyBodyAcceleration | 
fBodyAccJerk | FrequencyBodyAccelerationJerk | 
fBodyGyro | FrequencyBodyGyro |
fBodyAccMag | FrequencyBodyAccelerationMagnitude | 
fBodyBodyAccJerkMag | FrequencyBodyBodyAccelerationJerkMagnitude | 
fBodyBodyGyroMag | FrequencyBodyBodyGyroMagnitude | 
fBodyBodyGyroJerkMag | FrequencyBodyBodyGyroJerkMagnitude | 

The set of variables that were estimated from these signals are: 

Signal Name | Description  
----------- | -----------  
mean() | Mean value  
std() | Standard deviation  
mad() | Median absolute deviation   
max() | Largest value in array  
min() | Smallest value in array  
sma() | Signal magnitude area  
energy() | Energy measure (Sum of the squares divided by the number of values)  
iqr() | Interquartile range   
entropy() | Signal entropy  
arCoeff() | Autorregresion coefficients with Burg order equal to 4  
correlation() | correlation coefficient between two signals  
maxInds() | index of the frequency component with largest magnitude  
meanFreq() | Weighted average of the frequency components to obtain a mean frequency  
skewness() | skewness of the frequency domain signal  
kurtosis() | kurtosis of the frequency domain signal  
bandsEnergy() | Energy of a frequency interval within the 64 bins of the FFT of each window  
angle() | Angle between to vectors  

A complete description of the data can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

**About this Project**  
A number of steps were performed to produce a tidy data set from the raw data. A summary of these steps is provided below:  

*Step 1: Merge the training and test data sets to create one data set.*  
- Assign column names to test and training observational data (X_test, X_train) using the features provided (features.txt)  
- Assign "subjectID" as column names to subject data (subject_test, subject_train)  
- Assign "activityId" as column names to subject data (Y_test, Y_train)  
- Merge each the six data sets into a single data set   

*Step 2: Extract only the measurements on the mean and standard deviation for each measurement.*  
Subset the aggregated data into an intermediate data set that includes estimated mean or standard deviation of each signal.  

*Step 3: Use descriptive activity names to name the activities in the data set.*  
Merge the data set that includes the six activity lables with the aggregated data set (matching by the primary key "activityId"").  

*Step 4: Appropriately label the data set with descriptive variable names.*  
Modify the default signal and variable names to make the more readable. Specifically by removing parenths and spelling out abbrevitions.  

*Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.*  
Produce a summary data set that includes the numerical value of each observation by activity/subject pair

