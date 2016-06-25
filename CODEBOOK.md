
Code Book for Course Project
Overview
Source of the original data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Full Description at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Process
The script run_analysis.R performs the following process to clean up the data and create tiny data sets:
	1. Merge the training and test sets to create one data set.
	2. Reads features.txt and uses only the measurements on the mean and standard deviation for each measurement.
	3. Reads activity_labels.txt and applies human readable activity names to name the activities in the data set.
	4. Labels the data set with descriptive names. 
	5. Merges the features with activity labels and subject IDs. The result is saved as tidyoutput1.txt.
	6. The average of each measurement for each activity and each subject is merged to a second data set. The result is saved as tidyoutput2.txt.txt.
Variables
	• tstdata- table contents of test/X_test.txt
	• trndata- table contents of train/X_train.txt
	• X - Measurement data. Combined data set of the two above variables
	• tstSub - table contents of test/subject_test.txt
	• trnSub - table contents of test/subject_train.txt
	• S - Subjects. Combined data set of the two above variables
	• tsty - table contents of test/y_test.txt
	• trny- table contents of train/y_train.txt
	• Y - Data Labels. Combined data set of the two above variables.
	• featuresList - table contents of features.txt
	• features - Names of for data columns derived from featuresList
	• finalcolumns- logical vector of which features to use in tidy data set
	• activities - table contents of activity_labels.txt. Human readable
Output
Tidyoutput1.txt
	• The first 66 columns are measurements.
	• The last 3 column contains subject IDs. Activity No and  Activity Description.
	• Subject IDs are integers between 1 and 30.

Tidyoutput2.txt

	• The first column contains activity names.
	• The second column contains subject IDs.
	• The averages for each of the 66 attributes are in columns 3-68.
