# ================================================
message("Note: The Sumsung data, including the test and train subdirectories should be in the working directory")

message("reading test data set")
test <- read.table("test//X_test.txt")

message("reading activity labels for the test data set")
test_act_labels <- read.table("test//y_test.txt")

message("reading subject labels for test data set")
test_subj_labels <- read.table("test//subject_test.txt")

message("reading train data set")
train <- read.table("train//X_train.txt")

message("reading activity labels for the train data set")
train_act_labels <- read.table("train//y_train.txt")

message("reading subject labels for the test data set")
train_subj_labels <- read.table("train//subject_train.txt")

message("read activity labels descriptive names")
act_label_table <- read.table("activity_labels.txt")
act_label_names <- factor(act_label_table[,1], labels=act_label_table[,2])

message("read feature names")
features <- read.table("features.txt")[,2]

# ================================================
message("calculating means_stds")

# combine test and train data sets
combined <- rbind(test, train)

# combine test and train activity labels
combined_act_labels <- rbind(test_act_labels, train_act_labels)[,1]

# combine test and train subject labels
combined_subj_labels <- rbind(test_subj_labels, train_subj_labels)[,1]

# set column names to feature names
colnames(combined) <- features

# find features that are means and stddevs (see features_info.txt)
mean_cols     <- grep("mean|Mean", features)
std_cols      <- grep("std()"    , features)
mean_std_cols <- sort(c(mean_cols,std_cols))

# extract only mean and stddevs columns
means_stds <- combined[,mean_std_cols]

# add first col with activity label descriptive name
means_stds <- cbind(act_label_names[combined_act_labels], means_stds)
colnames(means_stds)[1] <- "activity"

# ================================================
message("calculating act_subj_avg")

# create act_subj_avg: 
# average of each sum/mean variable (1..86) for each activity (1..6) and each subject (1..30)
# column 1     : activity (val: 1.. 6)
# column 2     : subject  (val: 1..30)
# columns 3..88: average of each of the 86 mean/std variables
# total rows: subjects * activities = 180

no_subjects <- length(unique(combined_subj_labels)) # no. of subjects
sums        <- matrix(nrow= length(act_label_names) * no_subjects, ncol= length(mean_std_cols), data= 0)
counts      <- matrix(nrow= length(act_label_names) * no_subjects, ncol= length(mean_std_cols), data= 0)

for (r in 1:nrow(means_stds)) # for each test and train case
{
	activity   <- combined_act_labels [r]
    subject    <- combined_subj_labels[r]
	matrix_row <- (activity-1) * no_subjects + subject

	for (v in 1:length(mean_std_cols)) # for each mean/std variable
	{
		sums  [matrix_row, v] = sums  [matrix_row, v] + means_stds[r, v+1]
		counts[matrix_row, v] = counts[matrix_row, v] + 1
	}
}

act_subj_avg = sums / counts

act_subj_avg<- data.frame(act_subj_avg)                   # convert matrix to data frame
act_subj_avg<- cbind(act_label_names[1], 0, act_subj_avg) # insert two leading columns: activity, subject

colnames(act_subj_avg)[1:2] <- c("activity", "subject")   # set names for columns 1,2
for (v in 1: (ncol(means_stds)-1))                        # set names for each mean/std column
	colnames(act_subj_avg)[v+2] = paste("mean(", colnames(means_stds)[v+1], ")", sep="")

for (a in 1: length(act_label_names)) # activity
	for (s in 1: no_subjects)         # subject
	{
		act_subj_avg[(a-1) * no_subjects + s, 1] <- act_label_names[a] # column 1: activity
		act_subj_avg[(a-1) * no_subjects + s, 2] <- s                  # column 2: subject
	}

# binary - also save levels:
# save(act_subj_avg, file="act_subj_avg.RData")
# load("act_subj_avg.RData")

# text:
# write.table(act_subj_avg, file="act_subj_avg.txt")
# act_subj_avg <- read.table("act_subj_avg.txt")
