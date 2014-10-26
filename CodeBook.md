dataframes read from the data base

- df_xtest UCI HAR Dataset/test/X_test.txt
- df_ytest UCI HAR Dataset/test/y_test.txt
- df_subtest UCI HAR Dataset/test/subject_test.txt

- df_xtrain UCI HAR Dataset/train/X_train.txt

- df_ytrain UCI HAR Dataset/train/y_train.txt
- df_subtrain UCI HAR Dataset/train/subject_train.txt
- features UCI HAR Dataset/features.txt
- activity_names UCI HAR Dataset/activity_labels.txt

dataframes crated from merge

- activity row merge of df_ytest & df_ytrain
- subjects row merge df_subtest & df_subtrain
- merged_df1 row merge df_xtest & df_xtrain
- merged_df col merge subjects,activity,merged_df1
- merged_meanstd mean or std subset from merged_df
- meansdf result of means of each subject for each activity from merged_meanstd
