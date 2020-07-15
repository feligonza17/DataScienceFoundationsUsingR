# You should create one R script called run_analysis.R that does the following.
# 

#Libraries

library(tidyverse)

# Step 1: Merge data -------------------------------------------------------

#Import data
#Column Names (feature)

vec_names <- as.character(read.table("3.GettingandCleaningData/Week4/UCI HAR Dataset/features.txt", sep="")[,2])  #This extracts the second variable and transforms it to character


#Test Data Set
test_x <- read.table("3.GettingandCleaningData/Week4/UCI HAR Dataset/test/X_test.txt", sep="", col.names = vec_names)
test_y <- read.table("3.GettingandCleaningData/Week4/UCI HAR Dataset/test/y_test.txt")
test_subjects <- read.table("3.GettingandCleaningData/Week4/UCI HAR Dataset/test/subject_test.txt")
#Train Data Set
train_x <- read.table("3.GettingandCleaningData/Week4/UCI HAR Dataset/train/X_train.txt", sep="", col.names = vec_names)
train_y <- read.table("3.GettingandCleaningData/Week4/UCI HAR Dataset/train/y_train.txt")
train_subjects <- read.table("3.GettingandCleaningData/Week4/UCI HAR Dataset/train/subject_train.txt")


colnames(test_y) <- c("activity") #Change Column Names
colnames(test_subjects) <- c("subject") #Change Column Names

#Recode the values from the condition column (using the activity.labels.txt)
test_y$activity <-
  recode(
    test_y$activity,
    "1" = "Walking",
    "2" = "Walking_Upstairs",
    "3" = "Walking_downstairs",
    "4" = "Sitting",
    "5" = "Standing",
    "6" = "Laying"
  )

colnames(train_y) <- c("activity") #Change Column Names
colnames(train_subjects) <- c("subject") #Change Column Names

#Recode the values from the condition column (using the activity.labels.txt)
train_y$activity <-
  recode(
    train_y$activity,
    "1" = "Walking",
    "2" = "Walking_Upstairs",
    "3" = "Walking_downstairs",
    "4" = "Sitting",
    "5" = "Standing",
    "6" = "Laying"
  )

#Create final Data Frame

test_df <- cbind(test_x, test_y, test_subjects) #Column bind all the test data
train_df <- cbind(train_x, train_y, train_subjects) #Column bind all the train data

final_df <- rbind(test_df, train_df) #Final row bind between the last data


# Step 2: Extract measurments on the mean and sd of each measurment --------

final_df_ensayo <- final_df %>% select(activity, subject, contains(c("mean", "std"))) #This selects all of the variables that contain the pattern "mean" or "std. 


# Step 3 and 4: Descriptive Activity Names --------------------------------------

#For simplicity we will only use the time signals from body registered under the accelerometer
final_df_ensayo <-
  final_df_ensayo %>% select(activity, subject, contains(c("tBodyAcc.mean", "tBodyAcc.std"))) #Selects the variables that meet this criteria and the activity and subjetc variable.

colnames(final_df_ensayo) <-
  c(
    "activity",
    "subject",
    "mean_accelerometer_time_body_x_axis",
    "mean_accelerometer_time_body_y_axis",
    "mean_accelerometer_time_body_z_axis",
    "std_accelerometer_time_body_x_axis",
    "std_accelerometer_time_body_y_axis",
    "std_accelerometer_time_body_z_axis"
  )
# Changes the column names to make them more understandable


# Step 5: Tidy Data Set ---------------------------------------------------


tidy_data_mean <- final_df_ensayo %>% group_by(subject, activity) %>% 
  summarise_all(., mean)

write.table(tidy_data, "3.GettingandCleaningData/Week4/mean_by_subject_activities.txt")




