Getting-and-cleaning-data
=========================
The run_analysis.R script will:

1. Read the test and train data as data frame
"test/X_test.txt" "test/y_test.txt" "test/subject_test.txt" "train/X_train.txt", "train/y_train.txt" "train/subject_train.txt"
2. Read the activity labels and the 561 features
3. Merge the X_test and X_train into mereged_df
4. Merge the subjects and activity (Y_test/train) columns to the merged_df
5. Extract the mean and std columns from the merged df
6. Computes the average of each variable for each activity and each subject
7. Writes the tidy data to a text and csv file
