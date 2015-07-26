# Written 7/2015 mapleset
##
# This R script does the following
# 1. Reads and merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the
#    average of each variable for each activity and each subject.
##


## the setwd() function should be called before this function
## the working directory should contain the unzipped folder UCI HAR Dataset containing the Samsung data
## it should also contain the file "varnames_edited.txt" that is found in the github repository
## (along with this script, a readme file, and a codebook describing the variables)

run_analysis <- function() {
  library(dplyr)
  
  # save working dir
  wd <- getwd()
  
  setwd("UCI HAR Dataset")
  
  # read the descriptive data files
  act_lbl <- read.table("activity_labels.txt", header=0)
  features <- read.table("features.txt", header=0)
  
  names(act_lbl)[1]<-paste("Activity")
  names(act_lbl)[2]<-paste("Activity Type")
  
  varNames <- features[,2]
  varNums <- features[,1]
  
  # read the test files
  setwd(wd)
  setwd("UCI HAR Dataset\\test")
  
  y_test <- read.table("y_test.txt", header=0)
  x_test <- read.table("x_test.txt", header=0)
  sub_test <- read.table("subject_test.txt", header=0)
  
  # read the training files
  setwd(wd)
  setwd("UCI HAR Dataset\\train")
  
  y_train <- read.table("y_train.txt", header=0)
  x_train <- read.table("x_train.txt", header=0)
  sub_train <- read.table("subject_train.txt", header=0)
  
  setwd(wd)
  
  colnames(x_test) <- varNames
  
  x_test <- data.frame(y_test, x_test)
  names(x_test)[1]<-paste("Activity")
  x_test <- data.frame(sub_test, x_test)
  names(x_test)[1]<-paste("Subject")
  
  colnames(x_train) <- varNames
  
  x_train <- data.frame(y_train, x_train)
  names(x_train)[1]<-paste("Activity")
  x_train <- data.frame(sub_train, x_train)
  names(x_train)[1]<-paste("Subject")
  
  ##
  # combine the test and training sets to create a full tidy dataset
  ##
  merged_df <- rbind(x_test, x_train) %>%
               arrange(Subject,Activity)
  
  
  # join/merge the activity labels 'WALKING' to the merged set by Activity, which is the activity number
  merged_df <- merge(act_lbl, merged_df, by ="Activity") %>% 
               arrange(Subject,Activity) %>%
               select(matches('Subject|Activity Type|mean|std'))
  
  # rename col1 from Activity Type to Activity
  names(merged_df)[1]<-paste("Activity")
  
  # write the dataframe to disk as the full tidy dataset
  write.table(merged_df, "merged_mean_std_only_dataset.csv", col.names=TRUE, sep=",", row.names = FALSE, eol = "\n")
  
  ##
  # Now, create the summarized dataset
  ##
  
  # calculate the mean of each subject/activity/column
  ave_of_means_stdev <- merged_df %>%
    arrange(Subject,Activity) %>%
    group_by(Subject,Activity) %>%
    summarise_each(funs(mean))
  
  # add the prefix "GroupMean" to each column name
  colnames(ave_of_means_stdev) <- paste("GroupMean", colnames(ave_of_means_stdev), sep = "_")
  # now must rename columns 1,2 to remove the groupmean prefix
  colnames(ave_of_means_stdev)[1]<-paste("Subject")
  colnames(ave_of_means_stdev)[2]<-paste("Activity")
  
  # write the column names to use for the code book (must cleanup names manually first)
  hdrNames <- colnames(ave_of_means_stdev)
  write(hdrNames, "varnames.txt", sep="\n")
  
  # read the edited/cleaned up variable names
  hdrNames <- readLines("varnames_edited.txt")
  # set these as the column names
  colnames(ave_of_means_stdev) <- hdrNames
  
  # write the dataframe to disk as the summarized tidy dataset
  write.table(ave_of_means_stdev, "means_wide_form_tidy_data_set.txt", col.names=TRUE, sep=",", row.names = FALSE, eol = "\n")
  
  # read the file back to make sure it saved correctly
  #group_means <- read.csv("means_wide_form_tidy_data_set.txt", header = TRUE)
  
  ave_of_means_stdev
}


