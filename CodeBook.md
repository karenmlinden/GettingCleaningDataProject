#Getting and Cleaning Data Project Code Book 

Source of the original data:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

1.	Set Directory 
2.	Loads library plyr
2.	Creates Final folder
3.	Load feature table from features.txt 
4.  Loads and appends train dataset using X_train.txt, y_train.txt, subject_train.txt. subject_train.txt contains the ids. y_train.txt contains the activity labels. x_train.txt contains the data using the feature data
5.  Loads and appends train dataset using x_test.txt, y_test.txt, subject_test.txt. subject_test.txt contains the ids. y_test.txt contains the activity labels. x_test.txt contains the data using the feature data
7.	Appends train and test data
8.	Order the data using id
9.	Load activity labels table from activity_labels.txt
10.	Add the activity labels and use them
12.	Extracts columns mean,std into Finalset1
13.	Saves Finalset1 into Final/Finalset1.csv
14.	Uses plur to calculate mean on activity for each id
15.	add _mean to all data columns
16. Saves Finalset2 into Final/Finalset2.csv


