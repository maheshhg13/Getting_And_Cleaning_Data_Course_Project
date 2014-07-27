Source of the original data:
  
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .

The attached R script (run_analysis.R) performs the various operations using files mentioned:

* x_train.txt and x_test.txt: these files contain data for 561 measurements.
* y_train.txt and y_test.txt: these files contain activity_codes for each set of measurements. Activity codes have six levels:
* subject_test and subject_train: these files contain contains the subject ids for each measurement. It identifies each subject for whom measurements were recorded.
* activity_labels: this file contains description for each activity code:

1 WALKING

2 WALKING_UPSTAIRS

3 WALKING_DOWNSTAIRS

4 SITTING

5 STANDING

6 LAYING


* features: this file contains names for 561 features. each feature corresponds to one variable in x_train/x_test.

The attached R script (run_analysis.R) performs the following to clean up the data:

* 1. Creates a independent test set and training set by vertically merging subject and activity_codes with rest of the data.
* 2. Merges test and training sets
* 3. Extracts only the measurements on the mean and standard deviation for each measurement.
* 4. Generating meaningful activity name from activity codes using activity_labels.txt
* 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* 6. The result is saved as Final_Tidy_Set.txt in CourseProjectCleaningData directory which is expected to be in working directory.

NOTE: This script assumes a directory named CourseProjectCleaningData is present in current working directory. If CourseProjectCleaningData is present, the script assumes all the required files will be present in the directory.