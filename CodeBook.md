
# CodeBook: Variables and transformation 

Coursera Getting and Cleaning Data Week 4 Project
Create tidy dataset from data collected with the accelerometers in the Samsung Galaxy S smartphone

This code book describes the variables, data, and any transformations performed to clean up the data.

For more information and details about the various variables in the dataset, refer to the original data and dataset description below.

For convinience, the original README file was recopied with this under the file name _original\_dataset\_README_.

**Original data**: 
     <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

**Original dataset description**:
     <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

**Steps performed in this analysis**:

1. The orignal data was manually dowloaded and unzipped independently of the provided R script.

2. _dplyr_ R library was installed (it is loaded by the R script).

3. A folder "UCI HAR Dataset" was created in the R working directory and the original dataset was extracted.
      
4. Read the following generic dataset parameters:

  a. Activity labels from _activity\_labels.txt_to provides relationship between activity factors in the dataset and more descriptive names.
	
  b. All variable names in the dataset from _features.txt_ (refered to as the 561-vector) to provides relationship between dataset columns and more descriptive names.
		
5. Build a "test dataset" by  

  a. Merging activity factors (_Y\_test.txt_), test measurements (_X\_test.txt_), and the subject ID (_subject\_test.txt_).
	
  b. Retaininng only mean and standard deviations of variable names meeting the following regular expression \\.mean\\. and \\.std\\.
	
  c. Add an additional column to store file name from where the data was extracted.

6. Build a "train dataset" by  

  a. Merging activity factors (_Y\_train.txt_), train measurements (_X\_test.txt_), and the subject ID (_subject\_test.txt_).
	
  b. Retaininng only mean and standard deviations of variable names meeting the following regular expression \\.mean\\. and \\.std\\.
	
  c. Add an additional column to store file name from where the data was extracted.

7. Build a "merged dataset" by 

  a. Merging the datasets created in steps 5 and 6
  b. Deleting the activity factor column (i.e., retaining only descriptive names).

8. The "final tidy dataset" was created by

  a. Grouped the"merged dataset" by subject, activity name and origin of data and averaging each column.
  
  b. Renaming variable names by appending a prefix "Average." to previous variable names.
  
  c. A file _UCIHARData\_summary\_tidy.txt_ without colun and row headers.
  
The "final tidy dataset" has the following variable names:

 [1] "subjectid"                           
 [2] "activityname"                       
 [3] "data.origin"                         
 [4] "Average.tBodyAcc.mean...X"          
 [5] "Average.tBodyAcc.mean...Y"           
 [6] "Average.tBodyAcc.mean...Z"          
 [7] "Average.tGravityAcc.mean...X"        
 [8] "Average.tGravityAcc.mean...Y"       
 [9] "Average.tGravityAcc.mean...Z"        
[10] "Average.tBodyAccJerk.mean...X"      
[11] "Average.tBodyAccJerk.mean...Y"       
[12] "Average.tBodyAccJerk.mean...Z"      
[13] "Average.tBodyGyro.mean...X"          
[14] "Average.tBodyGyro.mean...Y"         
[15] "Average.tBodyGyro.mean...Z"          
[16] "Average.tBodyGyroJerk.mean...X"     
[17] "Average.tBodyGyroJerk.mean...Y"      
[18] "Average.tBodyGyroJerk.mean...Z"     
[19] "Average.tBodyAccMag.mean.."          
[20] "Average.tGravityAccMag.mean.."      
[21] "Average.tBodyAccJerkMag.mean.."      
[22] "Average.tBodyGyroMag.mean.."        
[23] "Average.tBodyGyroJerkMag.mean.."     
[24] "Average.fBodyAcc.mean...X"          
[25] "Average.fBodyAcc.mean...Y"           
[26] "Average.fBodyAcc.mean...Z"          
[27] "Average.fBodyAccJerk.mean...X"       
[28] "Average.fBodyAccJerk.mean...Y"      
[29] "Average.fBodyAccJerk.mean...Z"       
[30] "Average.fBodyGyro.mean...X"         
[31] "Average.fBodyGyro.mean...Y"          
[32] "Average.fBodyGyro.mean...Z"         
[33] "Average.fBodyAccMag.mean.."          
[34] "Average.fBodyBodyAccJerkMag.mean.."  
[35] "Average.fBodyBodyGyroMag.mean.."     
[36] "Average.fBodyBodyGyroJerkMag.mean.."  
[37] "Average.tBodyAcc.std...X"            
[38] "Average.tBodyAcc.std...Y"           
[39] "Average.tBodyAcc.std...Z"            
[40] "Average.tGravityAcc.std...X"        
[41] "Average.tGravityAcc.std...Y"         
[42] "Average.tGravityAcc.std...Z"        
[43] "Average.tBodyAccJerk.std...X"        
[44] "Average.tBodyAccJerk.std...Y"       
[45] "Average.tBodyAccJerk.std...Z"        
[46] "Average.tBodyGyro.std...X"          
[47] "Average.tBodyGyro.std...Y"           
[48] "Average.tBodyGyro.std...Z"          
[49] "Average.tBodyGyroJerk.std...X"       
[50] "Average.tBodyGyroJerk.std...Y"      
[51] "Average.tBodyGyroJerk.std...Z"       
[52] "Average.tBodyAccMag.std.."          
[53] "Average.tGravityAccMag.std.."        
[54] "Average.tBodyAccJerkMag.std.."      
[55] "Average.tBodyGyroMag.std.."          
[56] "Average.tBodyGyroJerkMag.std.."     
[57] "Average.fBodyAcc.std...X"            
[58] "Average.fBodyAcc.std...Y"           
[59] "Average.fBodyAcc.std...Z"            
[60] "Average.fBodyAccJerk.std...X"       
[61] "Average.fBodyAccJerk.std...Y"        
[62] "Average.fBodyAccJerk.std...Z"       
[63] "Average.fBodyGyro.std...X"           
[64] "Average.fBodyGyro.std...Y"          
[65] "Average.fBodyGyro.std...Z"           
[66] "Average.fBodyAccMag.std.."          
[67] "Average.fBodyBodyAccJerkMag.std.."   
[68] "Average.fBodyBodyGyroMag.std.."     
[69] "Average.fBodyBodyGyroJerkMag.std.." 