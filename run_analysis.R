ProcessSamsungData <- function() {
	# ================================================
	message("Note: The Samsung data, including the test and train subdirectories should be in the working directory")
	
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
	
	# find features that are means and stddevs (see features_info.txt)
	meanCols    <- grep("mean|Mean", features)
	stdCols     <- grep("std()"    , features)
	meanStdCols <- sort(c(meanCols,stdCols))
	
	# extract only mean and stddevs columns
	meansStds <- combined[,meanStdCols]
	
	# add first col with activity label descriptive name
	meansStds <- cbind(actLabelNames[combinedActLabels], meansStds)
	colnames(meansStds)[1] <- "activity"
	
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

	# define result variables in the parent.frame of the function
	meansStds  <<- meansStds
	actSubjAvg <<- actSubjAvg
}

# process samsung data
ProcessSamsungData()


# binary - also save levels:
# save(actSubjAvg, file="act_subj_avg.RData")
# load("act_subj_avg.RData")

# text:
# write.table(actSubjAvg, file="act_subj_avg.txt")
# actSubjAvg <- read.table("act_subj_avg.txt")
