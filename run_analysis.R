#fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileUrl,destfile="Dataset.zipl
#load all packages I need
library(dplyr)
library(plyr)
library(reshape2)
library(stats)
## load names of columns for the X files
features<-read.table("features.txt")
names<-features[,2]
#1. Merge the training and the test sets to create on data set
#first I read in all the data from the test group

test_X<-read.table("X_test.txt")
test_Y<-read.table("y_test.txt")
test_subjects<-read.table("subject_test.txt")

#select the appropriate variables
names(test_X)<-names
a<-!duplicated(names)

test_X<-test_X[,a]

data<-select(test_X,contains("mean()"))
datb<-select(test_X,contains("std()"))
dat1<-cbind(data,datb)


#then I combine the three datasets to one data set
test<-cbind(test_subjects,test_Y)
names(test)<-c("subject","activity")
test<-cbind(test,dat1)

#2. Merge the training and the test sets to create on data set
#first I read in all the data from the train group

train_X<-read.table("X_train.txt")
train_Y<-read.table("y_train.txt")
train_subjects<-read.table("subject_train.txt")

# select the appropriate values
names(train_X)<-names
a<-!duplicated(names)
train_X<-train_X[,a]

datc<-select(train_X,contains("mean()"))
datd<-select(train_X,contains("std()"))
dat2<-cbind(datc,datd)

#then I combine the three datasets to one data set
train<-cbind(train_subjects,train_Y)
names(train)<-c("subject","activity")
train<-cbind(train,dat2)


#then I combine the train and test file to one big file
data<-rbind(test,train)

#the give descriptive names to the activities
data$activity<-as.character(data$activity)
data$activity<-revalue(data$activity,c("1"="walking","2"="walking_upstairs","3"="walking_downstairs","4"="sitting","5"="standing","6"="laying"))


names<-names(data)
names<-names[3:68]

data<-melt(data,id=c("subject","activity"))
names(data)<-c("subject","activity","measure","value")

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data<-as.data.frame(data)
data2<-aggregate(value~subject+activity+measure,data,mean)

#A<-tapply(X=data$value,INDEX=list(data$subject,data$activity,data$measure),FUN=ciMean)

write.table(data2,"data.txt",row.name=FALSE)



