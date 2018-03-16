## Code Book

This will be helpful to understand the data nad how it is used in the project. It also will describes the steps taken to create the end resulting, ```tidy.txt``` dataset.

### Overview

Samsung activity data is the core of what is being used in this project. 

### Explanation of each file
This will only explain files that were used in analaysis; ```UCI HAR Dataset``` contains a ```README.MD``` for other file details.
* ```features.txt```: List of all  features
* ```activity_labels.txt```: Links activity ids and descriptions
* ```train/X_train.txt```: Training data set
* ```train/y_train.txt```: Training labels of the activity_id
* ```train/subject_train.txt```: Contains the subject id of the person who performed the activity for each window sample. Its range is from 1 to 30
* ```test/X_test.txt```: Test data set
* ```test/y_test.txt```: Test labels of the activity_id
* ```test/subject_test.txt```: Contains the subject id of the person who performed the activity for each window sample. Its range is from 1 to 30

### Transformation steps
1. Installed necessary packages, ```reshape2``` and ```data.table```
2. Stored training and testing data into data tables 
3. Added descriptive headers by using the feature and activity data
4. Merged the above datasets
5. Removed activity columns that did not contain the words ```mean()``` or ```std()``` and created a new table.
6. Joined the main table to the activity table to obtain descriptive activity names
7. Consolidated all activities to show the mean of 1 activity per person per row. So each person, should have a row for every type of activity for each features
8. Exported ```tidy.txt``` file of the clean dataset