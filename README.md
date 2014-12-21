tidydata
========

Getting and Cleaning Data Course Project

The run_analysis.R script reads in the X_train, y_train and subject_train datasets and merges them into one training dataset. Similarly the testing dataset is created and finally the training and testing datasets are merged into one dataset having 10299 observations of 563 variables.

Then from this merged dataset only the variables having the mean and standard deviations of a variable are selected and this dataset is called the select data frame. The select data frame is then merged with the activity labels to replace the activity numbers with more descriptive activity names.

Finally with the help of the 'dplyr' library a tidy data set with the average of each variable for each activity and each subject is created and outputted to a .txt file using the write.table() command. In the final tidy data set we have 180 rows consisting of the means of 30 subjects for each of the 6 activity types.