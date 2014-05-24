### Readme file for run_analysis.R

This file explains the run_analysis.R file.

The file contains a single function, "ProcessSamsungData", which receives no parameters, and generates two "tidy data" tables in the parent frame (the frame in which the function was called):
 
 - meansStds  - For each observation (total 10299 observation - both training and test sets) - all mean and standard deviation measurements (total 86 measurements types)
 - actSubjAvg - the average of each these 86 measurement types - for each activity (total 6 activities) and for each subject (total 30 subjects). 

Description of these 86 measurements is given in the CodeBook.md file.

The function is executed automatically when executing 
```r
source('run_analysis.R')
```
from within R

The function assumes that the sumsung data files (including the 'train' and 'test' subfolders) are located in the current working directory.

The rest of this file explains how the ProcessSamsungData function works.

```r
ProcessSamsungData <- function() {
```

First, 8 input files are read:

Training set:

 - "test/y_test.txt" (read into "testActLabels") - each row (2947 rows) identifies the activity type, for each window sample (integer: 1-6)
 - "test/subject_test.txt" (read into "testSubjLabels") - each row (2947 rows) identifies the subject who performed the activity, for each window sample (integer: 2,4,9,10,12,13,18,20,24)
 - "test/X_test.txt" (read into "test") - each row (2974 rows) represents one subject involved in one activity type (identified in the two files described above) in one window sample, each column (561 columns) contains the measured value for one measurement type - for the given activity and subject (numerical)
 
Test set:

 - "train/y_train.txt" (read into "trainActLabels") - each row (7352 rows) identifies the activity type, for each window sample (integer: 1-6)
 - "train/subject_train.txt" (read into "trainSubjLabels") - each row (7352 rows) identifies the subject who performed the activity, for each window sample (integer: 1,3,5-8,11,14-17,19,21-23,25-30)
 - "train/X_train.txt" (read into "train") - each row (7352 rows) represents one subject involved in one activity type (identified in the two files described above) in one window sample, each column (561 columns) contains the measured value for one measurement type - for the given activity and subject (numerical)
 
Descriptive names:

 - "activity_labels.txt" (read into "actLabelTable") - contains the names of the 6 activity types (col.1: Seq.no, col.2: activity name)
 - "features.txt" (the secoonds column is read into "features") - contains the names of the 561 measurement types (features) (col.1: Seq.no, col.2: measurement name)

In addition, we generate "actLabelNames" - a factor for the activity labels descriptive names

```r
	# ================================================
	message("reading test data set")
	test <- read.table("test//X_test.txt")
	
	message("reading activity labels for the test data set")
	testActLabels <- read.table("test//y_test.txt")
	
	message("reading subject labels for test data set")
	testSubjLabels <- read.table("test//subject_test.txt")
	
	message("reading train data set")
	train <- read.table("train//X_train.txt")
	
	message("reading activity labels for the train data set")
	trainActLabels <- read.table("train//y_train.txt")
	
	message("reading subject labels for the test data set")
	trainSubjLabels <- read.table("train//subject_train.txt")
	
	message("read activity labels descriptive names")
	actLabelTable <- read.table("activity_labels.txt")
	actLabelNames <- factor(actLabelTable[,1], labels=actLabelTable[,2])
	
	message("read feature names")
	features <- read.table("features.txt")[,2]
```
Next,

 - we combine the test and train measurements into one list, named "combined"
 - we combine the test and train activity labels into one integer vector, named "combinedActLabels"
 - we combine the test and train subject labels into one integer vector, named "combinedSubjLabels"
 - we set the column names of "combined" the the names of the features (measurement types)

```r
	# ================================================
	message("calculating meansStds")
	
	# combine test and train data sets
	combined <- rbind(test, train)
	
	# combine test and train activity labels
	combinedActLabels <- rbind(testActLabels, trainActLabels)[,1]
	
	# combine test and train subject labels
	combinedSubjLabels <- rbind(testSubjLabels, trainSubjLabels)[,1]
	
	# set column names to feature names
	colnames(combined) <- features
```
We now extract only the features that represents means and standard deviations.

 - Means are features that contains "mean" or "Mean" in their names (see features_info.txt)
 - Standard deviations are features that contains "std()" in their names (see features_info.txt)
 
Mean feature numbers are stored in vector "meanCols", and standard deviation feature numbers are stored in vector "stdCols".

We then combine these feature numbers into one sorted vector of feature numbers - "meanStdCols"
 
```r
	# find features that are means and stddevs (see features_info.txt)
	meanCols    <- grep("mean|Mean", features)
	stdCols     <- grep("std()"    , features)
	meanStdCols <- sort(c(meanCols,stdCols))
```
Our next step is to extract only these features from "combined" into a new list named "meansStds" 

We then add a first column to "meansStds" with the factor for the activity labels descriptive names

```r
	# extract only mean and stddevs columns
	meansStds <- combined[,meanStdCols]
	
	# add first col with activity label descriptive name
	meansStds <- cbind(actLabelNames[combinedActLabels], meansStds)
	colnames(meansStds)[1] <- "activity"
```
Next, we want to construct actSubjAvg - the average of each the extracted features - for each activity and for each subject.

Each row in actSubjAvg identifies a pair of activity type and subject, and each column identifies the average value of a feature

 - We first count the number of unique subjects, and store it in the integer variable "noSubjects"
 - For each pair of activity and subject, and for each feature we calculate
   - The sum of the measurements ("sums" - a matrix of doubles)
   - The count of the measurement ("counts" - a matrix of doubles)
 - For each pair of activity and subject, and for each feature we calculate the average "actSubjAvg": dividing "sums" by "counts"

```r
	# ================================================
	message("calculating actSubjAvg")
	
	# create actSubjAvg: 
	# average of each sum/mean variable (1..86) for each activity (1..6) and each subject (1..30)
	# column 1     : activity (val: 1.. 6)
	# column 2     : subject  (val: 1..30)
	# columns 3..88: average of each of the 86 mean/std variables
	# total rows: subjects * activities = 180
	
	noSubjects <- length(unique(combinedSubjLabels)) # no. of subjects
	sums       <- matrix(nrow= length(actLabelNames) * noSubjects, ncol= length(meanStdCols), data= 0)
	counts     <- matrix(nrow= length(actLabelNames) * noSubjects, ncol= length(meanStdCols), data= 0)
	
	for (r in 1:nrow(meansStds)) { # for each test and train case
		activity  <- combinedActLabels [r]
		subject   <- combinedSubjLabels[r]
		matrixRow <- (activity-1) * noSubjects + subject
	
		for (v in 1:length(meanStdCols)) { # for each mean/std variable
			sums  [matrixRow, v] = sums  [matrixRow, v] + meansStds[r, v+1]
			counts[matrixRow, v] = counts[matrixRow, v] + 1
		}
	}
	
	actSubjAvg = sums / counts
```
Next,

 - We convert actSubjAvg from matrix to data frame
 - We insert to leading columns: activity (factor) and subject (integer)
 - We set the column names for columns 1,2: "activity" and "subject"
 - We set the column names for the feature columns to "mean(featureName)"
 - We fill the values in the two new leading columns

```r
	actSubjAvg<- data.frame(actSubjAvg)                   # convert matrix to data frame
	actSubjAvg<- cbind(actLabelNames[1], 0, actSubjAvg)   # insert two leading columns: activity, subject
	
	colnames(actSubjAvg)[1:2] <- c("activity", "subject") # set names for columns 1,2
	for (v in 1: (ncol(meansStds)-1))                     # set names for each mean/std column
		colnames(actSubjAvg)[v+2] = paste("mean(", colnames(meansStds)[v+1], ")", sep="")
	
	for (a in 1: length(actLabelNames)) # activity
		for (s in 1: noSubjects) {      # subject
			actSubjAvg[(a-1) * noSubjects + s, 1] <- actLabelNames[a] # column 1: activity
			actSubjAvg[(a-1) * noSubjects + s, 2] <- s                # column 2: subject
		}
```

We then define the two result variables ("meansStds", "actSubjAvg") in the parent.frame of the function:

```r

	# define result variables in the parent.frame of the function
	meansStds  <<- meansStds
	actSubjAvg <<- actSubjAvg
}
```
and execute the function

```r

# process samsung data
ProcessSamsungData()
```
