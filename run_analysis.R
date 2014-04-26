
features<- read.table("features.txt", sep=" ")

#read in train data


X_train <- read.table("/train/X_train.txt")

#apply variable labels to the train data
colnames(X_train) <-features$V2

#trim down to only mean and std variables
X_train <- X_train[,grep("mean\\(\\)|std\\(\\)", features$V2, value=TRUE)]

Y_train <- read.table("/train/y_train.txt")

#Add the Y_Train numbers to the X_train data
colnames(Y_train) <- c("activitynumber")

Y_train$activityname <- ifelse(Y_train$activitynumber == 1, "Walking", 
                              ifelse(Y_train$activitynumber == 2, "Walking_Upstairs", 
                                     ifelse(Y_train$activitynumber == 3, "Walking_Downstairs",
                                            ifelse(Y_train$activitynumber == 4, "Sitting", 
                                                   ifelse(Y_train$activitynumber == 5, "Standing",
                                                          ifelse(Y_train$activitynumber == 6, "Laying", ""))))))

#load the subject data frame
subject_train <- read.table("/train/subject_train.txt")
colnames(subject_train)<- c("subject")


train_df <- data.frame(subject_train, Y_train, X_train)







X_test <- read.table("/test/X_test.txt")


#apply variable labels to the test data
colnames(X_test) <-features$V2

#trim down to mean and std variables
X_test <- X_test[,grep("mean\\(\\)|std\\(\\)", features$V2, value=TRUE)]

Y_test <- read.table("/test/y_test.txt")

#Add the Y_test numbers to the X_test data
colnames(Y_test) <- c("activitynumber")

Y_test$activityname <- ifelse(Y_test$activitynumber == 1, "Walking", 
ifelse(Y_test$activitynumber == 2, "Walking_Upstairs", 
ifelse(Y_test$activitynumber == 3, "Walking_Downstairs",
ifelse(Y_test$activitynumber == 4, "Sitting", 
ifelse(Y_test$activitynumber == 5, "Standing",
ifelse(Y_test$activitynumber == 6, "Laying", ""))))))

#load the subject data frame
subject_test <- read.table("/test/subject_test.txt")
colnames(subject_test)<- c("subject")


test_df <- data.frame(subject_test, Y_test, X_test)

#append test and train datasets
fulldata <- rbind(test_df, train_df)

#remove excess data frames
remove(X_test, X_train, Y_test, Y_train, features, test_df, train_df, subject_train, subject_test)




#now, to collapse these into means by subject and activity
#generate a new variable to collapse over
fulldata$subact <- paste(fulldata$subject, fulldata$activityname)
tidydataset <- aggregate(fulldata, list(fulldata$subact), mean)

tidydataset$activityname <-NULL

write.csv(tidydataset, file="tidydataset.csv")