
# Explanation of repository files  

Coursera Getting and Cleaning Data Week 4 Project

Create tidy dataset from data collected with the accelerometers in the Samsung Galaxy S smartphone

**Original data**: 
     <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

**Assumptions**: 

- Orignal data is manually dowloaded and unzipped independently of the provided R script.

- _dplyr_ R library is installed.

- A folder "UCI HAR Dataset" is located in R working directory. The folder's content extracted 
from the original data as shown below.

**Folder's content**:

	./UCI HAR Dataset/
	./UCI HAR Dataset/test
	./UCI HAR Dataset/test/Inertial Signals
	./UCI HAR Dataset/test/subject_test.txt
	./UCI HAR Dataset/test/X_test.txt
	./UCI HAR Dataset/test/y_test.txt
	./UCI HAR Dataset/train
	./UCI HAR Dataset/train/Inertial Signals
	./UCI HAR Dataset/train/subject_train.txt
	./UCI HAR Dataset/train/X_train.txt
	./UCI HAR Dataset/train/y_train.txt
	./UCI HAR Dataset/activity_labels.txt
	./UCI HAR Dataset/features.txt
	./UCI HAR Dataset/features_info.txt
	./UCI HAR Dataset/README.txt
      
The R script run\_analysis.R will process the files and generate a tidy dataset named UCIHARData\_summary\_tidy.txt
within the working directory.

This repository contains the following files:

- README.md (this file)
- run_analysis.R (R script)
- UCIHARData_summary_tidy.txt (tiday dataset from assignment)
- CodeBook.md (description of the various steps performed to prodcued tidy dataset)
- original_dataset_README (copy of original dataset README file for convinience)