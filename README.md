Getting-and-cleaning-data
=========================
The run_analysis.R script will

Read the test and train data as data frame
"test/X_test.txt" "test/y_test.txt" "test/subject_test.txt" "train/X_train.txt", "train/y_train.txt" "train/subject_train.txt"

Read the activity labels and the 561 features
Merge the X_test and X_train into mereged_df
Merge the subjects and activity (Y_test/train) columns to the merged_df
Extract the mean and std columns from the merged df
Computes the average of each variable for each activity and each subject
Writes the tidy data to a text and csv file
