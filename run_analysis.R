## Load data into corresponding objects
# Load training data
X_train <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
Y_train <- read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
subject_train <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
# Load test data
X_test <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
Y_test <- read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
subject_test <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)
#Load features and activity labels
activity_labels <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
features <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)

##Step 1: Merge the training and the test sets to create one data set and label columns
#Label columns of each data set
colnames(activity_labels) = c("activityId","activityType")
colnames(subject_train) = "subjectId"
colnames(X_train) = features[,2]
colnames(Y_train) = "activityId"
colnames(subject_test) = "subjectId"
colnames(X_test) = features[,2]
colnames(Y_test) = "activityId"#Merge training data
training_data <- cbind(X_train, Y_train, subject_train)
#Merge test data
test_data <- cbind(X_test, Y_test, subject_test)
#Combine trainging and test data into a single data set
complete_data <- rbind(training_data, test_data)

##Step 2: Extract only the measurements on the mean and standard deviation for each measurement
column_names <- colnames(complete_data)
wanted_data <- complete_data[,grepl("mean|std|subject|activity", column_names)]

##Step 3: Use descriptive activity names to name the activities in the data set
wanted_data <- merge(wanted_data, activity_labels, by = "activityId", all = TRUE)
column_names <- colnames(wanted_data)

##Step 4: Appropriately label the data set with descriptive activity names
column_names <- gsub("\\()","",column_names)
column_names <- gsub("-mean","Mean",column_names)
column_names <- gsub("-std","StandardDeviation",column_names)
column_names <- gsub("^t","Time",column_names)
column_names <- gsub("^f","Frequency",column_names)
column_names <- gsub("Freq$","Frequency",column_names)
column_names <- gsub("Acc","Acceleration",column_names)
column_names <- gsub("Mag","Magnitude",column_names)
colnames(wanted_data) = column_names

##Step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject
new_table <- wanted_data[,names(wanted_data) != 'activityType']
tidy_data <- aggregate(new_table[,names(new_table) != c('activityId','subjectId')],by=list(activityId=new_table$activityId,subjectId = new_table$subjectId),mean)
tidy_data <- merge(tidy_data,activityType,by='activityId',all.x=TRUE)
tidy_data <- tidy_data[with(tidy_data, order(activityId, subjectId)), ]
write.table(tidy_data, './tidy_data.txt',row.names=FALSE,sep='\t')
