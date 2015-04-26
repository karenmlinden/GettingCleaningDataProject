finalfolder <- "final"      
setwd('~/R/DataCleanProject')

library(plyr)


if(!file.exists(finalfolder)){
        print("Creating final folder")
        dir.create(finalfolder)
} 

##Load a table from the data file
LoadTable <- function (filename,cols = NULL){
        
        print(paste("Load Table:", filename))
        
        data <- data.frame()
        
        if(is.null(cols)){
                data <- read.table(filename,sep="",stringsAsFactors=F)
        } else {
                data <- read.table(filename,sep="",stringsAsFactors=F, col.names= cols)
        }
        
        
        data
        
}

##Load and creates a complete data set
LoadData <- function(type, features){
        
        print(paste("Loading data", type))
        
        s <- LoadTable(paste(type,"/","subject_",type,".txt",sep=""),"id")
        y <- LoadTable(paste(type,"/","y_",type,".txt",sep=""),"activity")    
        x <- LoadTable(paste(type,"/","X_",type,".txt",sep=""),features$V2) 
        
        return (cbind(s,y,x)) 
}


##saves the data into the result folder
FinalResult <- function (data,name){
        
        print(paste("Final data", name))
        
        file <- paste(finalfolder, "/", name,".txt" ,sep="")
        write.table(data,file,row.name=FALSE)
}



##get common data tables

#features used for col names when creating train and test data sets
f <- LoadTable("features.txt")

## Load the data sets
train <- LoadData("train",f)
test <- LoadData("test",f)

## 1. Merges the training and the test sets to create one data set.

m <- rbind(train, test)

m <- arrange(m, id)


## 3. Uses descriptive activity names to name the activities in the data set

a <- LoadTable("activity_labels.txt")

## 4. Appropriately labels the data set with descriptive variable names. 

m$activity <- factor(m$activity, levels=a$V1, labels=a$V2)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

Finalset1 <- m[,c(1,2,grep("std", colnames(m)), grep("mean", colnames(m)))]


FinalResult(Finalset1,"Finalset1")

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Finalset2 <- ddply(Finalset1, .(id, activity), .fun=function(x){ colMeans(x[,-c(1:2)]) })

colnames(Finalset2)[-c(1:2)] <- paste(colnames(Finalset2)[-c(1:2)], "_mean", sep="")

FinalResult(Finalset2,"Finalset2")