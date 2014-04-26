setwd("C:/Users/Chris Curran.ThinkPadCC/Documents/Data Science Cousera/Getting and Cleaning Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/")

features<- read.table("features.txt", sep=" ")

#read in train data
setwd("C:/Users/Chris Curran.ThinkPadCC/Documents/Data Science Cousera/Getting and Cleaning Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/")

X_train <- read.table("X_train.txt")

#apply variable labels to the train data
colnames(X_train) <-features$V2

Y_train <- read.table("y_train.txt")

#Add the Y_Train numbers to the X_train data
colnames(Y_train) <- c("activitynumber")

#load the subject data frame
subject_train <- read.table("subject_train.txt")
colnames(subject_train)<- c("subject_train")


train_df <- data.frame(subject_train, Y_train, X_train)






setwd("C:/Users/Chris Curran.ThinkPadCC/Documents/Data Science Cousera/Getting and Cleaning Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/")

X_test <- read.table("X_test.txt")

#apply variable labels to the test data
colnames(X_test) <-features$V2

Y_test <- read.table("y_test.txt")

#Add the Y_test numbers to the X_test data
colnames(Y_test) <- c("activitynumber")

#load the subject data frame
subject_test <- read.table("subject_test.txt")
colnames(subject_test)<- c("subject_test")


test_df <- data.frame(subject_test, Y_test, X_test)

test_df$activitynumber = "walking" 
