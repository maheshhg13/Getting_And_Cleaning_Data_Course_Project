if(file.exists(".\\CourseProjectCleaningData"))
{
    #Read Activity Labels
    activityLabels<-read.table(".\\CourseProjectCleaningData\\activity_labels.txt")
    
    #Read all features. These will be used as column names for data.
    features<-read.table(".\\CourseProjectCleaningData\\features.txt")
    
    #Read Test data. Add descriptive variable names from features.
    subjectTest<-read.table(".\\CourseProjectCleaningData\\test\\subject_test.txt",col.names="Subject")
    rowNamesTest<-read.table(".\\CourseProjectCleaningData\\test\\y_test.txt",col.names="Activity")
    testData<-read.table(".\\CourseProjectCleaningData\\test\\X_test.txt",col.names = features[,2], check.names=FALSE)
    testData<-cbind(rowNamesTest,subjectTest,testData)
    
    #Read Training data. Add descriptive variable names from features.
    subjectTrain<-read.table(".\\CourseProjectCleaningData\\train\\subject_train.txt",col.names="Subject")
    rowNamesTraining<-read.table(".\\CourseProjectCleaningData\\train\\y_train.txt",col.names="Activity")
    trainingData<-read.table(".\\CourseProjectCleaningData\\train\\X_train.txt",col.names = features[,2], check.names=FALSE)
    trainingData<-cbind(rowNamesTraining,subjectTrain,trainingData)
    
    #Merge Test and Training data.
    data<-rbind(testData,trainingData)
    
    #Extracts only the measurements on the mean and standard deviation for each measurement.
    indexes<-grep("mean\\(|std\\(", colnames(data))
    indexes<-c(1,2,indexes)
    data<-data[,indexes]
    
    #Using descriptive activity names using activity codes.
    data[,1]<-activityLabels[data[,1],2]
    
    #Creates a second, independent tidy data set with 
    #the average of each variable for each activity and each subject.
    library(reshape2)
    molten <- melt(data, id.vars= c("Activity", "Subject"))
    tableWithAverages <- dcast(molten, Activity + Subject ~ variable, mean)
    
    write.table(tableWithAverages, file="Final_Tidy_Set.txt", quote=FALSE, row.names=FALSE, sep="\t")
}else
    print("Required Directory with Name: CourseProjectCleaningData Not Found!!")

