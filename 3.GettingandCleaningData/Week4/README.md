The raw data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The explanation of the experiment of that raw data and the explanation is here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


The objective of this README si to explain how to obtain the "mean_by_subject_activities.txt" data set and explain what it contains. 

First, you must download the data sets from the first link. This contains all of the data set separated into a train and test data sets. Then you should run the script "run_analysis.R". This scripts binds the test data set with the subjects variables and with the activities variables. Then it binds both test and train data set to have a single compact data set. 

Then it selects the variables of interest. In this case we are interested only on the time signals from body registered under the accelerometer. So, we select the mean and standard deviation of the 3 axis coordinates of these registry (x, y and z).

Finally, to create the data set, we collapse these variables by subject and activity and produce the mean of each variables under these grouping variables (subject and activity). This way we have the mean of : the mean and standard deviation of the 3 axis coordinates of these registry (x, y and z) by subject and activity. 