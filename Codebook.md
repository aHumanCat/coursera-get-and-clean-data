
## Study design:

### Data Used:
The data for this project was obtanied from: 
[University of California Irvine - Human Activity Recognition Using Smartphones Study](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)  
[Study Dataset Archive](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The purpose of this project was to collect and summerize only the Mean and Standard Deviation  
values the were derived for the various mesasurements of activities in the study and  
group them by participant ID, subject, and activities.

Detailed descriptions of the measurements and activities are in the `features.txt`    
and `activity_labels.txt` files in the "Study Dataset Archive".  

Of the 561 variables available in the study 66 were selected that met the  
Mean and Standard Deviation criteria.  
The method used to the 66 varibles was to extract variables that contained  
"-mean()" or "-std()" int there names.  
Ex. tBodyAcc-std()-Y.

The end dataset format will be of the following layout

| Subjects      | Activities    |  tBodyAcc-std()-Y  |  65 More   |  
| :------------:|:-------------:| :----------------: |: ---------:|  
| 1             |  Walking      | 0.2773308          | xxxxxxxxxx |  

   
  

