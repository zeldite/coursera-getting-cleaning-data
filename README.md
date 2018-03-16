# coursera-getting-cleaning-data


## Getting and Cleaning Data Course Project

The goal of the class project was to manipulate readily made Samsung data to create a tidy dataset. 


**Requirements**

You should create one R script called ```run_analysis.R``` that does the following:


* Merges the training and the test sets to create one data set.

* Extracts only the measurements on the mean and standard deviation for each measurement.

* Uses descriptive activity names to name the activities in the data set

* Appropriately labels the data set with descriptive variable names.

* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


**How to use this**
1. Download the ```run_analysis.R``` and  [source data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Unzip source data
3. Put ```UCI HAR Dataset``` folder into the same folder as the ```run_analysis.R```
4. Execute the R script, ```run_analysis.R```,  in R Studio 

**The output of the R script is a ```tidy.txt```**

You can read more about the data and the analysis in the ```CodeBook.md``` .

**Notes**

```run_analysis.R``` downloads automatically a few dependent packages: ```reshape2``` and ```data.table```