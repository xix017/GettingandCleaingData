#######Load the data#######
setwd("M:/Min/study/data science/getting and cleaning data/UCI HAR Dataset")
train = read.csv("train/X_train.txt", sep="", header=FALSE)
train[,562] = read.csv("train/Y_train.txt", sep="", header=FALSE)
train[,563] = read.csv("train/subject_train.txt", sep="", header=FALSE)

test = read.csv("test/X_test.txt", sep="", header=FALSE)
test[,562] = read.csv("test/Y_test.txt", sep="", header=FALSE)
test[,563] = read.csv("test/subject_test.txt", sep="", header=FALSE)

features = read.csv("features.txt", sep="", header=FALSE)[,-1]

#######Merges the training and the test sets to create one data set#######
data = rbind(train, test)
#Add the column names to the features in the training and testing dataframe#
colnames(data) = c(as.character(features),"Activity","Subject")


######Extracts only the measurements on the mean and standard deviation######
colNeed = grep(".*mean.*|.*std.*",colnames(data))
data2 = data[,c(colNeed,562,563)]
colNeed2 = grep("Freq",colnames(data2))
newdata = data2[,-colNeed2]
head(colnames(newdata))
#"tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z" 
#"tBodyAcc-std()-X"  "tBodyAcc-std()-Y"  "tBodyAcc-std()-Z" 

#####Uses descriptive activity names to name the activities#####
activityName = read.csv("activity_labels.txt", sep="", header=FALSE)
activityName$V2 = as.character(activityName$V2)
for( i in 1:nrow(newdata)){
  for(j in 1:6)
  {
    if(newdata[i,"Activity"]==activityName$V1[j]){
      newdata[i,"Activity"] = activityName$V2[j]
    }
  }
}
table(newdata$Activity)
# LAYING  SITTING   STANDING  WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS
#1944     1777        1906      1722        1406            1544 
table(data2$Activity)
#1    2    3    4    5    6 
#1722 1544 1406 1777 1906 1944 

#####Create the tidy data set#####
newdata$Activity <- as.factor(newdata$Activity)
newdata$Subject <- as.factor(newdata$Subject)
tidyset = aggregate(newdata[,1:66], 
                    by=list(Activity=newdata$Activity, Subject=newdata$Subject), 
                    mean)
write.table(tidyset, "tidyset.txt", sep="\t", row.name=FALSE)
