# Getting and cleaning data course project.

# setting the workspace directory
setwd("C:/NelsonRepo/Technical/DataScience/R_Programming/PracticePrograms/getdata-projectfiles-UCI HAR Dataset (1)/UCI HAR Dataset")

####################################################################
# Reading common files related to training and test data
####################################################################

features <- read.table("features.txt")
actlables <- read.table("activity_labels.txt")
names(actlables) <- c("Actno","ActDesc")

#####################################################################
# Cleaning logic for test data.
#####################################################################

# Reading test data 
tstdata <- read.table("test/X_test.txt")
# Reading y test data
tsty <- read.table("test/y_test.txt",colClasses = "numeric")
# Reading subjec test data
tstsub <- read.table("test/subject_test.txt",colClasses = "numeric")
# Changing header name to test data
names(tstdata) <- features[,2]
names(tstsub)<-'subject'
names(tsty)<- c("Actno")
# Merging subject and test data
names(tstdata) <- features[,2]
tstdata <- cbind(tstdata,tstsub)
tstdata <- cbind(tstdata,tsty)
outtst<- merge(tstdata,actlables,by='Actno')


#####################################################################
# Cleaning logic for training data.
#####################################################################
# Reading train data 
trndata <- read.table("train/X_train.txt")
# Reading y train data
trny <- read.table("train/y_train.txt",colClasses = "numeric")
# Reading subject train data
trnsub <- read.table("train/subject_train.txt",colClasses = "numeric")
# Changing header name to train data
names(trndata) <- features[,2]
names(trnsub)<-'subject'
names(trny)<- c("Actno")
# Merging subject and train data
trndata<- cbind(trndata,trnsub)
trndata <- cbind(trndata,trny)
outtrn <- merge(trndata,actlables,by='Actno')

head(outtrn)

####################################################################
# Merging test and train data
####################################################################
Consoldata <- rbind(outtst,outtrn)
head(Consoldata)

####################################################################
#Extracts only the measurements on the mean and standard deviation 
####################################################################

library(dplyr)
gpmean <- grep("mean()",names(Consoldata),value=T,fixed = T)
gpstd <- grep("std()",names(Consoldata),value=T,fixed=T)
finalcolumns <- c(gpmean,gpstd,'subject','Actno','ActDesc')
finaldata <- subset(Consoldata,select=finalcolumns)
TidyOutput1 <- finaldata

####################################################################
#Change the column names to meaning full value
###################################################################

names(TidyOutput1)<-gsub("std\\(\\)", "SD", names(TidyOutput1))
names(TidyOutput1)<-gsub("mean\\(\\)", "MEAN", names(TidyOutput1))
names(TidyOutput1)<-gsub("^t", "time", names(TidyOutput1))
names(TidyOutput1)<-gsub("^f", "frequency", names(TidyOutput1))
names(TidyOutput1)<-gsub("Acc", "Accelerometer", names(TidyOutput1))
names(TidyOutput1)<-gsub("Gyro", "Gyroscope", names(TidyOutput1))
names(TidyOutput1)<-gsub("Mag", "Magnitude", names(TidyOutput1))
names(TidyOutput1)<-gsub("BodyBody", "Body", names(TidyOutput1))


write.table(TidyOutput1, "tidyoutput1.txt", row.name=FALSE)

####################################################################
#average of each variable for each activity and each subject.
####################################################################

tidyoutput2 <- aggregate(TidyOutput1[,1:66],list(TidyOutput1$ActDesc,TidyOutput1$subject),mean)
changename <- tidyoutput2

###################################################################
# Change the column names to meaning full value
##################################################################

names(changename)<-gsub("Group.1", "Activity", names(changename))
names(changename)<-gsub("Group.2", "Subject", names(changename))


# Write to Out put file


write.table(changename, "tidyoutput2.txt", row.name=FALSE)




##################### THANK YOU ######################################



