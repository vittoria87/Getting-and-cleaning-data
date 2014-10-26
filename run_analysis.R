library("reshape2")
##step 1 : Merge training and test data set to create a single data set
print("Reading test data")
df_xtest<-read.table("test/X_test.txt",header = FALSE)
df_ytest<-read.table("test/y_test.txt",header = FALSE)
df_subtest<-read.table("test/subject_test.txt",header = FALSE)

print("Reading train  data")
df_xtrain<-read.table("train/X_train.txt",header = FALSE)
df_ytrain<-read.table("train/y_train.txt",header = FALSE)
df_subtrain<-read.table("train/subject_train.txt",header = FALSE)

## 6*2 frame 1 WALKING/5 STANDING etc
activity_names<-read.table("activity_labels.txt",header = FALSE,stringsAsFactors = FALSE)

### Read the 561 feature names 
features<-read.table("features.txt",header = FALSE,stringsAsFactors = FALSE)
features<-features[,2] ##get the names of features


###Merege the two data sets 
print ("Merging the test and train data sets")
subjects<-rbind(df_subtest,df_subtrain)
activity<-rbind(df_ytest,df_ytrain)
merged_df1<-merge(df_xtest,df_xtrain,all = TRUE,sort=FALSE)
merged_df<-cbind(subjects,activity,merged_df1)
rm(merged_df1)
colnames(merged_df)<-c("Subjects","Activity",features)
##merged_df is a 10299*563 df, 1st and 2nd column have subjects and Activity respectively

##2. Extract Mean and Std.Dev from the merged_df
print("Extracting mean and std observations ....")
meancols<-grep("mean",colnames(merged_df))
stdcols<-grep("std",colnames(merged_df))

merged_meanstd<-merged_df[,c(1,2,meancols,stdcols)]


meltdf<-melt(merged_meanstd, id.var = c("Subjects", "Activity"))
meansdf = dcast(meltdf , Subjects + Activity ~ variable, mean)

##Uses descriptive activity names to name the activities in the data set
## 1 ->  WALKING/5 -> STANDING etc
for (i in seq(means[,2])) { 
  meansdf[i,2]<- activity_names[meansdf[i,2],2]   
}

###write the tidy ds meansdf in a textfile & cvs file
print("Writing the tidy data set to files tidy_data.txt & tidy_data.csv")
write.table(meansdf,file = "tidy_data.txt",row.names = FALSE,sep=",")
write.table(meansdf,file = "tidy_data.csv",row.names = FALSE,sep=",")
meansdf
