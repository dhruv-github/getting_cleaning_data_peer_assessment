### 4/25/14 ###

features <-  read.table("features.txt")
activity <- read.table("activity_labels.txt")

train <- read.table("train/X_train.txt")
colnames(train) <- features$V2
train <- train[which(grepl("mean|std",colnames(train),ignore.case=T))]
train.subject <- read.table("train/subject_train.txt")
train.activity <- read.table("train/y_train.txt")
train.activity.labeled <- merge(train.activity,activity,sort=F)
train.data <- data.frame(subject=train.subject$V1,activity=train.activity.labeled$V2,train,check.names=F)


test <- read.table("test/X_test.txt")
colnames(test) <- features$V2
test <- test[which(grepl("mean|std",colnames(test),ignore.case=T))]
test.subject <- read.table("test/subject_test.txt")
test.activity <- read.table("test/y_test.txt")
test.activity.labeled <- merge(test.activity,activity,sort=F)
test.data <- data.frame(subject=test.subject$V1,activity=test.activity.labeled$V2,test,check.names=F)


### 1,2,3,4)
total = rbind(train.data,test.data)



### 5)
result = aggregate(total[,-c(1:2)],list(total$subject,total$activity),mean)
colnames(result)[1:2]=c("subject","activity")
library(plyr)
result=arrange(result,subject,activity)
write.table(result,file="tidy_data_averages.txt",quote=F,row.names=F,sep="\t")