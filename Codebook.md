
## Study design:

### Data Used:
The data for this project was obtained from: 
[University of California Irvine - Human Activity Recognition Using Smartphones Study](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)  
[Study Dataset Archive](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The purpose of this project was to collect and summarize only the Mean and Standard Deviation  
values the were derived for the various measurements of activities in the study and  
group them by participant ID, subject, and activities.

Detailed descriptions of the measurements and activities are in the `features.txt`    
and `activity_labels.txt` files in the "Study Data set Archive".  

Of the 561 variables available in the study 66 were selected that met the  
Mean and Standard Deviation criteria.  
The method used to the 66 variables was to extract variables that contained  
"-mean()" or "-std()" int there names.  
Ex. tBodyAcc-std()-Y.

Each of the 66 variables subset ted will be an average of all observations
for a given subject/activity combination.

The chosen table format is wide.  
180 observations X 68 variables  

## Code Book  

Variables used in the final data set  

#### Subjects:
 Integer - Ranging from 1 - 30  
  designating the 10 participants in the study  
  
#### Activities:
 String - enumeration(6) indicating which activity was being performed  
          for a given observation  
    WALKING  
    WALKING_UPSTAIRS
    WALKING_DOWNSTAIRS  
    SITTING  
    STANDING  
    LAYING  

#### Measurement Varibles (columns 3 - 68 ):
 Numeric - Average of all the observations for  
   the particular Subject Activities combination.
   
   
tBodyAcc-mean()-X  
tBodyAcc-mean()-Y  
tBodyAcc-mean()-Z  
tBodyAcc-std()-X  
tBodyAcc-std()-Y  
tBodyAcc-std()-Z  
tGravityAcc-mean()-X  
tGravityAcc-mean()-Y  
tGravityAcc-mean()-Z  
tGravityAcc-std()-X  
tGravityAcc-std()-Y  
tGravityAcc-std()-Z  
tBodyAccJerk-mean()-X  
tBodyAccJerk-mean()-Y  
tBodyAccJerk-mean()-Z  
tBodyAccJerk-std()-X  
tBodyAccJerk-std()-Y  
tBodyAccJerk-std()-Z  
tBodyGyro-mean()-X  
tBodyGyro-mean()-Y  
tBodyGyro-mean()-Z  
tBodyGyro-std()-X  
tBodyGyro-std()-Y  
tBodyGyro-std()-Z  
tBodyGyroJerk-mean()-X  
tBodyGyroJerk-mean()-Y  
tBodyGyroJerk-mean()-Z  
tBodyGyroJerk-std()-X  
tBodyGyroJerk-std()-Y  
tBodyGyroJerk-std()-Z  
tBodyAccMag-mean()  
tBodyAccMag-std()  
tGravityAccMag-mean()  
tGravityAccMag-std()  
tBodyAccJerkMag-mean()  
tBodyAccJerkMag-std()  
tBodyGyroMag-mean()  
tBodyGyroMag-std()  
tBodyGyroJerkMag-mean()  
tBodyGyroJerkMag-std()  
fBodyAcc-mean()-X  
fBodyAcc-mean()-Y  
fBodyAcc-mean()-Z  
fBodyAcc-std()-X  
fBodyAcc-std()-Y  
fBodyAcc-std()-Z  
fBodyAccJerk-mean()-X  
fBodyAccJerk-mean()-Y  
fBodyAccJerk-mean()-Z  
fBodyAccJerk-std()-X  
fBodyAccJerk-std()-Y  
fBodyAccJerk-std()-Z  
fBodyGyro-mean()-X  
fBodyGyro-mean()-Y  
fBodyGyro-mean()-Z  
fBodyGyro-std()-X  
fBodyGyro-std()-Y  
fBodyGyro-std()-Z  
fBodyAccMag-mean()  
fBodyAccMag-std()  
fBodyBodyAccJerkMag-mean()  
fBodyBodyAccJerkMag-std()  
fBodyBodyGyroMag-mean()  
fBodyBodyGyroMag-std()  
fBodyBodyGyroJerkMag-mean()   
fBodyBodyGyroJerkMag-std()
   
   
  

