## Download the files to working directory and unzip
filename <- "getdata_dataset.zip"
if (!file.exists(filename)){
  URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(URL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

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
activity_labels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
features <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)

##Step 1: Merge the training and the test sets to create one data set and label columns
#Merge training data
training_data <- cbind(cbind(X_train, Y_Train), subject_train)
#Merge test data
test_data <- cbind(cbind(X_test, Y_Train), subject_test)
#Combine trainging and test data
complete_data <- rbind(training_data, test_data)
#Label Columns
data_labels <- rbind(rbind(features, c(562, "subject")), c(563, "activity"))[,2]
names(complete_data) <- data_labels

##Step 2: Extract only the measurements on the mean and standard deviation for each measurement
Mean_SD <- complete_data[,grepl("mean|std|subject|activity", names(sensor_data))]

##Step 3: Use descriptive activity names to name the activities in the data set
colnames(complete_data) <- c(features$V2, "Activity", "Subject")
colnames(complete_data) <- tolower(colnames(complete_data))
