features = read.table("features.txt")
activity_labels = read.table("activity_labels.txt")
names(activity_labels) = c("Activity","Activity_Labels")
subject_test = read.table("./test/subject_test.txt")
X_test = read.table("./test/X_test.txt")
y_test = read.table("./test/y_test.txt")
subject_train = read.table("./train/subject_train.txt")
X_train = read.table("./train/X_train.txt")
y_train = read.table("./train/y_train.txt")
X = rbind(X_train,X_test)
names(X) = features[,2]
y = rbind(y_train,y_test)
names(y) = "Activity"
subject = rbind(subject_train,subject_test)
names(subject) = "Subject"
data = cbind(X,subject,y)
mergeData = merge(data,activity_labels,by = "Activity")
colData = match(c("fBodyAcc-mean()-X","fBodyAcc-mean()-Y","fBodyAcc-mean()-Z","Subject","Activity_Labels"),names(mergeData))
selectData = mergeData[,colData]
names(selectData) = c("xAcc","yAcc","zAcc","Subject","Activity")
library(plyr)
tidyData = ddply(selectData,.(Subject,Activity), summarize, xMeanAcc = mean(xAcc), yMeanAcc = mean(yAcc), zMeanAcc = mean(zAcc), xStdAcc = sd(xAcc), yStdAcc = sd(yAcc), zStdAcc = sd(zAcc))
write.table(tidyData,file = "tidyData.txt")
