# getting-and-cleaning-data

The function run_analysis first reads in the feature.txt
file and stores those names into a variable names.

Then it reads in the datasets of the test group:
X_test.txt, y_test.txt and subject_test.txt 
and names the X_test.txt according to the feature names.

Then all columns are selected with mean() inside of the
columnname and then all with std() inside of the columname
and std inside of the columnname.

The those two data files are merged to dat1. First all mean()s and then all std()s,

Then the three datasets are combined by cbind to one dataset,
named test. The first variable is subjects_test.txt the second y_test.txt and the third dat1.   
Then the first two columns are named "subject" and "activty".

Then all steps above are executed with the train data. The resulting file is named train.

The the test and train data are combined to one datafile by
rbind().

Then the numeric values of activities are transformed into the appropriate activity names.

Then the data are transformed from a wide into a long dataset with two grouping variables subject and activity.

Then a second data.frame data2 is produced where the mean of each possible subject x activity x measure is calculated.

This data.frame is then saved under data.txt in the
current directory.





