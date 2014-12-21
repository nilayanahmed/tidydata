## read the X_train dataset
X_train <- read.delim2("./train/X_train.txt", header = F, sep = "")
## read the features names from the features.txt file
features <- read.delim2("./features.txt", header = F, sep = "")
## name the variables with the names of the features
colnames(X_train) <- features$V2
## read the y_train dataset showing the activity type
y_train <- read.delim2("./train/y_train.txt", header = F, sep = "")
## read the subject_train dataset showing the volunteer number
subject_train <- read.delim2("./train/subject_train.txt", header = F, sep = "")
train_merged <- X_train

## merge the datasets
train_merged <- cbind(y_train,train_merged)
train_merged <- cbind(subject_train,train_merged)

## rename the columns after binding
colnames(train_merged)[1] <- "volunteer_No"
colnames(train_merged)[2] <- "activity_No"


## repeat above steps for the testing datasets
X_test <- read.delim2("./test/X_test.txt", header = F, sep = "")
colnames(X_test) <- features$V2
y_test <- read.delim2("./test/y_test.txt", header = F, sep = "")
subject_test <- read.delim2("./test/subject_test.txt", header = F, sep = "")
test_merged <- X_test
test_merged <- cbind(y_test, test_merged)
test_merged <- cbind(subject_test, test_merged)
colnames(test_merged)[1] <- "volunteer_No"
colnames(test_merged)[2] <- "activity_No"

##merge the training and testing datasets into one dataset
merged <- rbind(train_merged, test_merged)

## select the columns with means and std.deviations only
select <- merged[, grep(c("mean|std|volunteer_No|activity_No"), colnames(merged) , value = T),]

## read in the dataset with the activity labels
activity_labels <- read.delim2("./activity_labels.txt", header = F, sep = "")

##merge the selected dataset with the activity labels 
labelled_data <- merge(select, activity_labels, by.x = "activity_No", by.y = "V1")

## reorder the activity column
sudo <- labelled_data[,c(1,82,2,3:81)]
## rename the acitvity column
colnames(sudo)[2] <- "activity"

## convert columns to numeric type from factors
sudo[,4:82] <- lapply(sudo[,4:82], function(x) as.numeric(as.character(x)))

## import dplyr library
library("dplyr")

## generate means for all groups of volunteer and activity
op <- sudo[] %>% group_by(volunteer_No, activity) %>% summarise_each(funs(mean))

## rename the columns by prefixing MEAN to the column names
colnames(op)[4:82] <- paste("MEAN", colnames(op)[4:82], sep = "_")

## write the op data frame out to a txt file 
write.table(op, "output.txt", row.names = F)
