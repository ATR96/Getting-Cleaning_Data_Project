#Loading required libraries
library(data.table)
library(reshape2)

#Getting home path
path <- getwd()

#Loading activitylabels and features
activitylabels <- fread(file.path(path, "UCI HAR Dataset/activity_labels.txt"), col.names = c("classlabels", "activityname"))
features <- fread(file.path(path, "UCI HAR Dataset/features.txt"), col.names = c("index", "featuresname"))

#View(activitylabels)
#View(features)


#Extracting wanted features i.e mean and standard deviation variables 
featureswanted <- grep("(mean|std)\\(\\)", features[, featuresname])
measurements <- features[featureswanted, featuresname]
measurements <- gsub('[()]', '', measurements)
#View(measurements)


#Load train datasets
train <- fread(file.path(path, "UCI HAR Dataset/train/X_train.txt"))[, featuresWanted, with = FALSE]
data.table::setnames(train, colnames(train), measurements)
#View(train)
trainactivities <- fread(file.path(path, "UCI HAR Dataset/train/Y_train.txt"), col.names = c("Activity"))
#View(trainactivities)
trainsubjects <- fread(file.path(path, "UCI HAR Dataset/train/subject_train.txt"), col.names = c("Subject"))
#View(trainsubjects)
train <- cbind(trainsubjects, trainactivities, train)
#View(train)

#Load test datasets
test <- fread(file.path(path, "UCI HAR Dataset/test/X_test.txt"))[, featuresWanted, with = FALSE]
data.table::setnames(test, colnames(test), measurements)
testactivities <- fread(file.path(path, "UCI HAR Dataset/test/Y_test.txt"), col.names = c("Activity"))
testsubjects <- fread(file.path(path, "UCI HAR Dataset/test/subject_test.txt"), col.names = c("Subject"))
test <- cbind(testsubjects, testactivities, test)
#View(test)

#merge the datasets
mergedt <- rbind(train, test)

#Changing classlabels to activitynames and converting subject and activity into factors so as to become id
mergedt[["Activity"]] <- factor(mergedt[, Activity], levels = activitylabels[["classlabels"]], labels = activitylabels[["activityname"]])
mergedt[["Subject"]] <- as.factor(mergedt[, Subject])
#View(mergedt)

#Creating a second tidy data set with mean of each variable for each activity and each subject.
mergedt <- reshape2::melt(data = mergedt, id = c("Subject", "Activity"))
mergedt <- reshape2::dcast(data = mergedt, Subject + Activity ~ variable, fun.aggregate = mean)
#View(mergedt)

data.table::fwrite(x = mergedt, file = "tidydata.txt", quote = FALSE)