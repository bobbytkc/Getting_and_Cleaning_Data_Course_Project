
##downloads and unzips in a folder called "data" in the working directory.
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","./data.zip")
unzip("./data.zip", exdir = "./data")

##Variables storing directory information of the relevant data in the "./data" folder
dataDir <- "./data/UCI HAR Dataset"
xTrainDir <- paste(dataDir, "/train/X_train.txt", sep = "")
subjectTrainDir <- paste(dataDir, "/train/subject_train.txt", sep = "")
yTrainDir <- paste(dataDir, "/train/y_train.txt", sep = "")
xTestDir <-paste(dataDir, "/test/X_test.txt", sep = "")
subjectTestDir <- paste(dataDir, "/test/subject_test.txt", sep = "")
yTestDir <- paste(dataDir, "/test/y_test.txt", sep = "")

##reads the files containing relevant data
trainData <- read.table(xTrainDir)
trainSubjectLabel <- read.table(subjectTrainDir)
trainTestLabel <- read.table(yTrainDir)
testData <- read.table(xTestDir)
testSubjectLabel <- read.table(subjectTestDir)
testTestLabel <- read.table(yTestDir)

##some of the data read in are converted to lists. 
##This recoverts them into ordinary vectors
trainData$subject <- unlist(trainSubjectLabel)
trainData$activity <- unlist(trainTestLabel)
testData$subject <- unlist(testSubjectLabel)
testData$activity <- unlist(testTestLabel)

##merges the 2 data sets using rbind. The columns of both trainData and testData are identical.
allData <- rbind(trainData,testData)

##reads in the descriptive names of the columns, as given by features.txt
features <- read.table(paste(dataDir, "/features.txt", sep = ""))


meanIndex <- grep("mean()", features[,2]) #finds column indices corr. to mean data
stdIndex <- grep("std()", features[,2]) #finds column indices corr. to std data
allIndex <- c(meanIndex,stdIndex, 562,563) #a vector containing column indices we want
meanStdData <- allData[,allIndex] #extracts relevant data using allIndex

colnames(meanStdData) <- 
c(as.character(features[c(meanIndex, stdIndex),2]),"subject","activity") #names the columns 

##removes troublesome characters from the column names
names(meanStdData) <- gsub("-","_",names(meanStdData))
names(meanStdData) <- gsub("\\(\\)","",names(meanStdData))

##names the activity with descriptive text by casting it as a factor, 
##then re-casting as character vector
activityNames <-
c("walking","walking_upstairs", "walking_downstairs", "sitting", "standing","laying")
activityFactor <- factor(meanStdData$activity, labels = activityNames)
meanStdData$activity <- as.character(activityFactor)

#evalColMeans takes in data for a single subject, 
#then finds the mean of every column split according to activity
evalColMeans <- function(x){
        
        factor<-x["activity"]
        output <- vector()
        
        #computes mean of every column, split according to activity
        for(i in 1:(length(x)-2)){
                temp <- tapply(x[,i],factor,mean)
                output<-cbind(output,temp)

        }
        
        #adds extra columns specifying subject and activity names.
        output<-cbind(x[1:6,"subject"],row.names(output),output)
        output
}

##splits data to create a list containing data of individual subjects,
##then applies evalColMeans to every item of the list
subjectSplit <- split(meanStdData,meanStdData$subject)
subjectSplit <- lapply(subjectSplit, evalColMeans)

##variable to store tidy data
tidyData <- vector()

##merges all the data in subjectSplit
for(i in 1:length(subjectSplit)){
        tidyData<-rbind(tidyData, subjectSplit[[i]])        
}

##tidy data is stored in tidyData as data.frame object 
##and given appropriate column names. Row names removed.
tidyData<-as.data.frame(tidyData)
row.names(tidyData) <- NULL
colnames(tidyData) <- c("subject","activity", as.character(features[c(meanIndex, stdIndex),2]))

## writes tidyData into "./tidyData.txt" in working directory.
write.table(tidyData,"./tidyData.txt", row.names=FALSE)

