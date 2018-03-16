# Getting and Cleaning Data Course Project

#-----------------1. Merge the training and the test sets to create one data set-------------------#
#Install required packages
if (!"reshape2" %in% installed.packages()) {
  install.packages("reshape2")
}
library("reshape2")

if (!"data.table" %in% installed.packages()) {
  install.packages("data.table")
}
library("data.table")

#Read data from file and store in variables
#Training data
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

#Test data
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

#Other data
feature_names <- read.table("./UCI HAR Dataset/features.txt")
activity_names <- read.table("./UCI HAR Dataset/activity_labels.txt")

#Add Headers
colnames(subject_train) <- c("subject_id")
colnames(subject_test) <- c("subject_id")
colnames(x_train) <- feature_names$V2
colnames(x_test) <- feature_names$V2
colnames(y_train) <- "activity_id"
colnames(y_test) <- "activity_id"

#Merge files
train_combined <- cbind(x_train, y_train, subject_train)
test_combined <- cbind(x_test, y_test, subject_test)
fullset <- rbind(train_combined,test_combined)

#-----------------2. Extract only the measurements on the mean and standard deviation for each measurement.-------------------#
#find columns that have mean() or std()
colstokeep <- grep("mean\\(|std\\(",names(fullset), value = TRUE)
colstokeep <- append(colstokeep,"subject_id")
colstokeep <- append(colstokeep,"activity_id")

#add subject_id and activity_id to array of columns to keep
filteredset <- fullset[,colstokeep]

#-----------------3.Use descriptive activity names to name the activities in the data set. -------------------#
#assign activity values
colnames(activity_names) <- c("activity_id","activity_desc")
#join on activity_id
filteredset <- merge(filteredset,activity_names,key = activity_id)

#-----------------4. Appropriately label the data set with descriptive variable names.-------------------#
#completed this above

#-----------------From the data set in step 4, creates a second, independent tidy data set -------------------#
#-----------------with the average of each variable for each activity and each subject.-------------------#
melted <- melt(filteredset,id.vars = c("subject_id","activity_desc"))
tidy <- dcast(melted, subject_id + activity_desc ~ variable, mean)

write.table(tidy,"./tidy.txt", row.names = FALSE)