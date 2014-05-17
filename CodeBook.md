### General

This document describes the structure of the tidy data frame that can be produced either by:
- loading     - Loading the act_subj_avg.txt text file in R using read.table
- generating  - Executing the run_analysis.R script generates a data frame named actSubjAvg

The run_analysis.R script is explained in the README.md file

The data frame has 180 observations (rows) and 88 variables (columns)

### Observations

Each observation represent one volunteers and one activity.
There is a total of 30 volunteers and 6 activities.

### Variables

 1 - activity
    the activity in with the subject was engaged
    values : 1: WALKING, 2: WALKING_UPSTAIRS, 3: WALKING_DOWNSTAIRS, 4: SITTING, 5: STANDING, 6: LAYING
             (defined as a factor with labels)
    note: labels order may change is saved as a text file 
          (That's how R saves text files. Save as RData to overcome this problem)
 
 2 - subject
    volunteers number
    values: 1-30


Columns 3-88 contain the mean over all measurements (training data and test data) for the given activity (column 1) and subject (column 2)

Only variables which represent means and standard deviation are included (see README.txt)

The averaged variables are 
  
 3 - mean(tBodyAcc-mean()-X)                    - the mean of tBodyAcc-mean()-X                    over all measurements for the given activity (column 1) and subject (column 2)         
 4 - mean(tBodyAcc-mean()-Y)                    - the mean of tBodyAcc-mean()-Y                    over all measurements for the given activity (column 1) and subject (column 2)         
 5 - mean(tBodyAcc-mean()-Z)                    - the mean of tBodyAcc-mean()-Z                    over all measurements for the given activity (column 1) and subject (column 2)         
 6 - mean(tBodyAcc-std()-X)                     - the mean of tBodyAcc-std()-X                     over all measurements for the given activity (column 1) and subject (column 2)         
 7 - mean(tBodyAcc-std()-Y)                     - the mean of tBodyAcc-std()-Y                     over all measurements for the given activity (column 1) and subject (column 2)         
 8 - mean(tBodyAcc-std()-Z)                     - the mean of tBodyAcc-std()-Z                     over all measurements for the given activity (column 1) and subject (column 2)         
 9 - mean(tGravityAcc-mean()-X)                 - the mean of tGravityAcc-mean()-X                 over all measurements for the given activity (column 1) and subject (column 2)         
 10 - mean(tGravityAcc-mean()-Y)                 - the mean of tGravityAcc-mean()-Y                 over all measurements for the given activity (column 1) and subject (column 2)         
 11 - mean(tGravityAcc-mean()-Z)                 - the mean of tGravityAcc-mean()-Z                 over all measurements for the given activity (column 1) and subject (column 2)         
 12 - mean(tGravityAcc-std()-X)                  - the mean of tGravityAcc-std()-X                  over all measurements for the given activity (column 1) and subject (column 2)         
 13 - mean(tGravityAcc-std()-Y)                  - the mean of tGravityAcc-std()-Y                  over all measurements for the given activity (column 1) and subject (column 2)         
 14 - mean(tGravityAcc-std()-Z)                  - the mean of tGravityAcc-std()-Z                  over all measurements for the given activity (column 1) and subject (column 2)         
 15 - mean(tBodyAccJerk-mean()-X)                - the mean of tBodyAccJerk-mean()-X                over all measurements for the given activity (column 1) and subject (column 2)         
 16 - mean(tBodyAccJerk-mean()-Y)                - the mean of tBodyAccJerk-mean()-Y                over all measurements for the given activity (column 1) and subject (column 2)         
 17 - mean(tBodyAccJerk-mean()-Z)                - the mean of tBodyAccJerk-mean()-Z                over all measurements for the given activity (column 1) and subject (column 2)         
 18 - mean(tBodyAccJerk-std()-X)                 - the mean of tBodyAccJerk-std()-X                 over all measurements for the given activity (column 1) and subject (column 2)         
 19 - mean(tBodyAccJerk-std()-Y)                 - the mean of tBodyAccJerk-std()-Y                 over all measurements for the given activity (column 1) and subject (column 2)         
 20 - mean(tBodyAccJerk-std()-Z)                 - the mean of tBodyAccJerk-std()-Z                 over all measurements for the given activity (column 1) and subject (column 2)         
 21 - mean(tBodyGyro-mean()-X)                   - the mean of tBodyGyro-mean()-X                   over all measurements for the given activity (column 1) and subject (column 2)         
 22 - mean(tBodyGyro-mean()-Y)                   - the mean of tBodyGyro-mean()-Y                   over all measurements for the given activity (column 1) and subject (column 2)         
 23 - mean(tBodyGyro-mean()-Z)                   - the mean of tBodyGyro-mean()-Z                   over all measurements for the given activity (column 1) and subject (column 2)         
 24 - mean(tBodyGyro-std()-X)                    - the mean of tBodyGyro-std()-X                    over all measurements for the given activity (column 1) and subject (column 2)         
 25 - mean(tBodyGyro-std()-Y)                    - the mean of tBodyGyro-std()-Y                    over all measurements for the given activity (column 1) and subject (column 2)         
 26 - mean(tBodyGyro-std()-Z)                    - the mean of tBodyGyro-std()-Z                    over all measurements for the given activity (column 1) and subject (column 2)         
 27 - mean(tBodyGyroJerk-mean()-X)               - the mean of tBodyGyroJerk-mean()-X               over all measurements for the given activity (column 1) and subject (column 2)         
 28 - mean(tBodyGyroJerk-mean()-Y)               - the mean of tBodyGyroJerk-mean()-Y               over all measurements for the given activity (column 1) and subject (column 2)         
 29 - mean(tBodyGyroJerk-mean()-Z)               - the mean of tBodyGyroJerk-mean()-Z               over all measurements for the given activity (column 1) and subject (column 2)         
 30 - mean(tBodyGyroJerk-std()-X)                - the mean of tBodyGyroJerk-std()-X                over all measurements for the given activity (column 1) and subject (column 2)         
 31 - mean(tBodyGyroJerk-std()-Y)                - the mean of tBodyGyroJerk-std()-Y                over all measurements for the given activity (column 1) and subject (column 2)         
 32 - mean(tBodyGyroJerk-std()-Z)                - the mean of tBodyGyroJerk-std()-Z                over all measurements for the given activity (column 1) and subject (column 2)         
 33 - mean(tBodyAccMag-mean())                   - the mean of tBodyAccMag-mean()                   over all measurements for the given activity (column 1) and subject (column 2)         
 34 - mean(tBodyAccMag-std())                    - the mean of tBodyAccMag-std()                    over all measurements for the given activity (column 1) and subject (column 2)         
 35 - mean(tGravityAccMag-mean())                - the mean of tGravityAccMag-mean()                over all measurements for the given activity (column 1) and subject (column 2)         
 36 - mean(tGravityAccMag-std())                 - the mean of tGravityAccMag-std()                 over all measurements for the given activity (column 1) and subject (column 2)         
 37 - mean(tBodyAccJerkMag-mean())               - the mean of tBodyAccJerkMag-mean()               over all measurements for the given activity (column 1) and subject (column 2)         
 38 - mean(tBodyAccJerkMag-std())                - the mean of tBodyAccJerkMag-std()                over all measurements for the given activity (column 1) and subject (column 2)         
 39 - mean(tBodyGyroMag-mean())                  - the mean of tBodyGyroMag-mean()                  over all measurements for the given activity (column 1) and subject (column 2)         
 40 - mean(tBodyGyroMag-std())                   - the mean of tBodyGyroMag-std()                   over all measurements for the given activity (column 1) and subject (column 2)         
 41 - mean(tBodyGyroJerkMag-mean())              - the mean of tBodyGyroJerkMag-mean()              over all measurements for the given activity (column 1) and subject (column 2)         
 42 - mean(tBodyGyroJerkMag-std())               - the mean of tBodyGyroJerkMag-std()               over all measurements for the given activity (column 1) and subject (column 2)         
 43 - mean(fBodyAcc-mean()-X)                    - the mean of fBodyAcc-mean()-X                    over all measurements for the given activity (column 1) and subject (column 2)         
 44 - mean(fBodyAcc-mean()-Y)                    - the mean of fBodyAcc-mean()-Y                    over all measurements for the given activity (column 1) and subject (column 2)         
 45 - mean(fBodyAcc-mean()-Z)                    - the mean of fBodyAcc-mean()-Z                    over all measurements for the given activity (column 1) and subject (column 2)         
 46 - mean(fBodyAcc-std()-X)                     - the mean of fBodyAcc-std()-X                     over all measurements for the given activity (column 1) and subject (column 2)         
 47 - mean(fBodyAcc-std()-Y)                     - the mean of fBodyAcc-std()-Y                     over all measurements for the given activity (column 1) and subject (column 2)         
 48 - mean(fBodyAcc-std()-Z)                     - the mean of fBodyAcc-std()-Z                     over all measurements for the given activity (column 1) and subject (column 2)         
 49 - mean(fBodyAcc-meanFreq()-X)                - the mean of fBodyAcc-meanFreq()-X                over all measurements for the given activity (column 1) and subject (column 2)         
 50 - mean(fBodyAcc-meanFreq()-Y)                - the mean of fBodyAcc-meanFreq()-Y                over all measurements for the given activity (column 1) and subject (column 2)         
 51 - mean(fBodyAcc-meanFreq()-Z)                - the mean of fBodyAcc-meanFreq()-Z                over all measurements for the given activity (column 1) and subject (column 2)         
 52 - mean(fBodyAccJerk-mean()-X)                - the mean of fBodyAccJerk-mean()-X                over all measurements for the given activity (column 1) and subject (column 2)         
 53 - mean(fBodyAccJerk-mean()-Y)                - the mean of fBodyAccJerk-mean()-Y                over all measurements for the given activity (column 1) and subject (column 2)         
 54 - mean(fBodyAccJerk-mean()-Z)                - the mean of fBodyAccJerk-mean()-Z                over all measurements for the given activity (column 1) and subject (column 2)         
 55 - mean(fBodyAccJerk-std()-X)                 - the mean of fBodyAccJerk-std()-X                 over all measurements for the given activity (column 1) and subject (column 2)         
 56 - mean(fBodyAccJerk-std()-Y)                 - the mean of fBodyAccJerk-std()-Y                 over all measurements for the given activity (column 1) and subject (column 2)         
 57 - mean(fBodyAccJerk-std()-Z)                 - the mean of fBodyAccJerk-std()-Z                 over all measurements for the given activity (column 1) and subject (column 2)         
 58 - mean(fBodyAccJerk-meanFreq()-X)            - the mean of fBodyAccJerk-meanFreq()-X            over all measurements for the given activity (column 1) and subject (column 2)         
 59 - mean(fBodyAccJerk-meanFreq()-Y)            - the mean of fBodyAccJerk-meanFreq()-Y            over all measurements for the given activity (column 1) and subject (column 2)         
 60 - mean(fBodyAccJerk-meanFreq()-Z)            - the mean of fBodyAccJerk-meanFreq()-Z            over all measurements for the given activity (column 1) and subject (column 2)         
 61 - mean(fBodyGyro-mean()-X)                   - the mean of fBodyGyro-mean()-X                   over all measurements for the given activity (column 1) and subject (column 2)         
 62 - mean(fBodyGyro-mean()-Y)                   - the mean of fBodyGyro-mean()-Y                   over all measurements for the given activity (column 1) and subject (column 2)         
 63 - mean(fBodyGyro-mean()-Z)                   - the mean of fBodyGyro-mean()-Z                   over all measurements for the given activity (column 1) and subject (column 2)         
 64 - mean(fBodyGyro-std()-X)                    - the mean of fBodyGyro-std()-X                    over all measurements for the given activity (column 1) and subject (column 2)         
 65 - mean(fBodyGyro-std()-Y)                    - the mean of fBodyGyro-std()-Y                    over all measurements for the given activity (column 1) and subject (column 2)         
 66 - mean(fBodyGyro-std()-Z)                    - the mean of fBodyGyro-std()-Z                    over all measurements for the given activity (column 1) and subject (column 2)         
 67 - mean(fBodyGyro-meanFreq()-X)               - the mean of fBodyGyro-meanFreq()-X               over all measurements for the given activity (column 1) and subject (column 2)         
 68 - mean(fBodyGyro-meanFreq()-Y)               - the mean of fBodyGyro-meanFreq()-Y               over all measurements for the given activity (column 1) and subject (column 2)         
 69 - mean(fBodyGyro-meanFreq()-Z)               - the mean of fBodyGyro-meanFreq()-Z               over all measurements for the given activity (column 1) and subject (column 2)         
 70 - mean(fBodyAccMag-mean())                   - the mean of fBodyAccMag-mean()                   over all measurements for the given activity (column 1) and subject (column 2)         
 71 - mean(fBodyAccMag-std())                    - the mean of fBodyAccMag-std()                    over all measurements for the given activity (column 1) and subject (column 2)         
 72 - mean(fBodyAccMag-meanFreq())               - the mean of fBodyAccMag-meanFreq()               over all measurements for the given activity (column 1) and subject (column 2)         
 73 - mean(fBodyBodyAccJerkMag-mean())           - the mean of fBodyBodyAccJerkMag-mean()           over all measurements for the given activity (column 1) and subject (column 2)         
 74 - mean(fBodyBodyAccJerkMag-std())            - the mean of fBodyBodyAccJerkMag-std()            over all measurements for the given activity (column 1) and subject (column 2)         
 75 - mean(fBodyBodyAccJerkMag-meanFreq())       - the mean of fBodyBodyAccJerkMag-meanFreq()       over all measurements for the given activity (column 1) and subject (column 2)         
 76 - mean(fBodyBodyGyroMag-mean())              - the mean of fBodyBodyGyroMag-mean()              over all measurements for the given activity (column 1) and subject (column 2)         
 77 - mean(fBodyBodyGyroMag-std())               - the mean of fBodyBodyGyroMag-std()               over all measurements for the given activity (column 1) and subject (column 2)         
 78 - mean(fBodyBodyGyroMag-meanFreq())          - the mean of fBodyBodyGyroMag-meanFreq()          over all measurements for the given activity (column 1) and subject (column 2)         
 79 - mean(fBodyBodyGyroJerkMag-mean())          - the mean of fBodyBodyGyroJerkMag-mean()          over all measurements for the given activity (column 1) and subject (column 2)         
 80 - mean(fBodyBodyGyroJerkMag-std())           - the mean of fBodyBodyGyroJerkMag-std()           over all measurements for the given activity (column 1) and subject (column 2)         
 81 - mean(fBodyBodyGyroJerkMag-meanFreq())      - the mean of fBodyBodyGyroJerkMag-meanFreq()      over all measurements for the given activity (column 1) and subject (column 2)         
 82 - mean(angle(tBodyAccMean,gravity))          - the mean of angle(tBodyAccMean,gravity)          over all measurements for the given activity (column 1) and subject (column 2)         
 83 - mean(angle(tBodyAccJerkMean),gravityMean)) - the mean of angle(tBodyAccJerkMean),gravityMean) over all measurements for the given activity (column 1) and subject (column 2)         
 84 - mean(angle(tBodyGyroMean,gravityMean))     - the mean of angle(tBodyGyroMean,gravityMean)     over all measurements for the given activity (column 1) and subject (column 2)         
 85 - mean(angle(tBodyGyroJerkMean,gravityMean)) - the mean of angle(tBodyGyroJerkMean,gravityMean) over all measurements for the given activity (column 1) and subject (column 2)         
 86 - mean(angle(X,gravityMean))                 - the mean of angle(X,gravityMean)                 over all measurements for the given activity (column 1) and subject (column 2)         
 87 - mean(angle(Y,gravityMean))                 - the mean of angle(Y,gravityMean)                 over all measurements for the given activity (column 1) and subject (column 2)         
 88 - mean(angle(Z,gravityMean))                 - the mean of angle(Z,gravityMean)                 over all measurements for the given activity (column 1) and subject (column 2)         
