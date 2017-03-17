#
# Coursera Getting and Cleaning Data Week 4 Project
#
# Author: bdiocsera
# Date: 03/17/2017
#
# Create tidy dataset from data collected with the accelerometers in the Samsung Galaxy S smartphone
#
# Extract only the mean and standard deviation for each measurement using the convention:
#    - "measurementname".mean. 
#    - "measurementname".std. 
# 
#
# Original data: 
#     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
# Original full file description:
#     http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#
# Assumptions: 
#    - Orignal data is dowloaded and extracted outside of the R script
#    - dplyr is installed
#    - The folder "UCI HAR Dataset" is located in R working directory and has the following content/structure
#
#      ./UCI HAR Dataset/
#
#      ./UCI HAR Dataset/test
#      ./UCI HAR Dataset/test/Inertial Signals
#      ./UCI HAR Dataset/test/subject_test.txt
#      ./UCI HAR Dataset/test/X_test.txt
#      ./UCI HAR Dataset/test/y_test.txt
#
#      ./UCI HAR Dataset/train
#      ./UCI HAR Dataset/train/Inertial Signals
#      ./UCI HAR Dataset/train/subject_train.txt
#      ./UCI HAR Dataset/train/X_train.txt
#      ./UCI HAR Dataset/train/y_train.txt
#
#      ./UCI HAR Dataset/activity_labels.txt
#      ./UCI HAR Dataset/features.txt
#      ./UCI HAR Dataset/features_info.txt
#      ./UCI HAR Dataset/README.txt
#

# Libraries used
library(dplyr)

# Read generic dataset parameters
#################################
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",sep="",col.names=c("activityfactor","activityname"))
features <- read.table("./UCI HAR Dataset/features.txt",sep="") # Read vector561 names
vector561_names <- features$V2 # To appropriately labels the data set with descriptive variable names

# Build test dataset
####################

# Read all test data provided 
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt",sep="",col.names=vector561_names) # 561-vector measurements
test_label <- read.table("./UCI HAR Dataset/test/Y_test.txt",sep="",col.names="activityfactor") # activity factors
test_subjectid <- read.table("./UCI HAR Dataset/test/subject_test.txt",sep="",col.names="subjectid") # test subjects

# Add variable with descriptive activity names
test_label <- merge(test_label,activity_labels,by.x = "activityfactor",by.y = "activityfactor")

# Create test dataset with only the mean and standard deviation for each measurement
test_dataset <- cbind(test_subjectid,test_label,test_data[,c(grep("\\.mean\\.",names(test_data)),grep("\\.std\\.",names(test_data)))])

# Add filename in column per https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html when merging multiple files
test_dataset$data.origin <- rep("UCI HAR Dataset/test/X_test.txt",length(test_dataset[1]))

# Build train dataset
#####################

# Read train dataset
train_data <- read.table("./UCI HAR Dataset/train/X_train.txt",sep="",col.names=vector561_names)
train_label <- read.table("./UCI HAR Dataset/train/Y_train.txt",sep="",col.names="activityfactor")
train_subjectid <- read.table("./UCI HAR Dataset/train/subject_train.txt",sep="",col.names="subjectid") # train subjects

# Add variable with descriptive activity names
train_label <- merge(train_label,activity_labels,by.x = "activityfactor",by.y = "activityfactor")

# Create train dataset with only the mean and standard deviation for each measurement
train_dataset <- cbind(train_subjectid,train_label,train_data[,c(grep("\\.mean\\.",names(train_data)),grep("\\.std\\.",names(train_data)))])

# Add filename in column per https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html when merging multiple files
train_dataset$data.origin <- rep("UCI HAR Dataset/train/X_train.txt",length(train_dataset[1]))

# Merge test and train datasets
###############################
merged_dataset <- rbind(test_dataset,train_dataset)
merged_dataset$activityfactor <- NULL # activityfactor not needed anymore

# Create final tiday dataset and export to file
###############################################
merged_dataset_summary <- merged_dataset %>% group_by(subjectid,activityname,data.origin) %>% summarise_each(funs(mean))
colnames(merged_dataset_summary) <- c("subjectid","activityname","data.origin",paste("Average.", colnames(merged_dataset_summary[4:69]),sep=""))
write.table(merged_dataset_summary,file="UCIHARData_summary_tidy.txt", row.names = FALSE, col.names = FALSE)
