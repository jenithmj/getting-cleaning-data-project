#Section 1
#Downloading the Data Set from the URL provided in the Coursera Course Link to your working Directory 


if(!file.exists("./data"))
  {
    dir.create("./data")
  
  }
file_url<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(file_url,dest_file="./data/Dataset.zip")



# Unzip the Downloaded  dataSet to /data directory

unzip(zipfile="./data/Dataset.zip",ex_dir="./data")

#Section 2

# Merging the training and the test sets to create one data set.

#Reading the Unzipped files

# Reading the Data present in the Train folder and assigning them to variables

x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Reading Data present in the test Folder and assigning them to variables


x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Reading Data in the feature Text file
features <- read.table('./data/UCI HAR Dataset/features.txt')

#Reading Data from the Activity_labes text file

activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

# Assiging appropriate column names to the imported data sets

colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')


# merge all the Data sets

# Merge the Train data set
mrgtrain <- cbind(y_train, subject_train, x_train)

# Merge the Test data set
mrg_test <- cbind(y_test, subject_test, x_test)

# Merge the Train and Test data set as one whole data set
combinedset <- rbind(mrgtrain, mrg_test)

# Section 3

# Extracting only the measurements on the mean and standard deviation for each measurement

# Read all the column names 
colNames <- colnames(combinedset)

#Create vector for defining ID, mean and standard deviation:
mean_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)

# Making nessesary subset from combinedset:


setForMean_Std <- combinedset[ , mean_std == TRUE]

#Section 4

#  Using descriptive activity names to name the activities in the data set

setWithActivityNames <- merge(setForMean_Std, activityLabels,
                              by='activityId',
                              all.x=TRUE)

#Section 5
# Creating a second, independent tidy data set with the average of each variable for each activity and each subject


#Making a tidy data Set
TidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
TidySet <- TidySet[order(TidySet$subjectId, TidySet$activityId),]

#Export the Tidy Data Set to a text file

write.table(TidySet, "TidySet.txt", row.name=FALSE)









