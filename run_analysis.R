# Submitter:    Steve Morin
# Date:         June 24th, 2016
# 
# Course: Getting and Cleaning Data
# Assignment: Getting and Cleaning Data Course Project
#
# Description: The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
# The goal is to prepare tidy data that can be used for later analysis. 

# Set the Working Directory
setwd("D:\\Coursera\\Data Science Specialization\\Getting and Cleaning Data\\Course Project\\getdata_projectfiles_UCI HAR Dataset\\")

# Read the list of features from features.txt file
features<-read.table(".\\UCI HAR Dataset\\features.txt")
# Get subset of columns with mean or std in their names
features_subset <- grep(".*mean.*|.*std.*", features[,2])

# Load the Training Data from the raw text files
x_train<-read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
y_train<-read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
subject_train<-read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")

# Load the Test Data from the raw text files
x_test<-read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
y_test<-read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
subject_test<-read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")

# Merge the Training and Test Data
x_merge<-rbind(x_train,x_test)                   # Merge X data
y_merge<-rbind(y_train,y_test)                   # Merge y data
subject_merge<-rbind(subject_train,subject_test) # Merge subject data

# 
colnames(subject_merge)<-"subject"

# Get a subset of the x_merge data frame based on the features_subset that includes only STD and MEAN columns
x_merge<-x_merge[,features_subset]
colnames(x_merge)<-features[features_subset,2]

# Get activities from activities_label.txt file
activity_labels<-read.table(".\\UCI HAR Dataset\\activity_labels.txt")

# Set column names for y_merge dataset
y_merge[,1]<-activity_labels[y_merge[,1],2]
colnames(y_merge)<-"activity"

# Combine x_merge,y_merge, subject_merge vectors into a single data frame
merged_data<-cbind(x_merge,y_merge, subject_merge)

# Calculate the mean on all columns except subject and activity
agg_data <- aggregate(. ~ subject - activity, data = merged_data, mean)
# Sort based on the subject & activity columns
final_data_frame<- arrange(agg_data,subject,activity)

# Finally Write the data set to a text file
write.table(finalDF, "final_aggregated_data.txt", row.name=FALSE)

