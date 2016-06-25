---
title: "Getting and Cleaning Data"
output: html_document
---

## Description
This is the course project for the Getting and Cleaning Data Course (Coursera). The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.The goal is to prepare tidy data that can be used for later analysis. 

## How The Script Works

1. Set the Working Directory
2. Read the list of features from features.txt file
3. Get subset of columns with mean or std in their names
4. Load the Training Data from the raw text files
5. Load the Test Data from the raw text files
6. Merge the Training and Test Data
7. Get a subset of the x_merge data frame based on the features_subset that includes only STD and MEAN columns
8. Get activities from activities_label.txt file
9. Set column names for y_merge dataset
10. Combine x_merge,y_merge, subject_merge vectors into a single data frame
11. Calculate the mean on all columns except subject and activity
12. Sort based on the subject & activity columns
13. Finally write the data set to a text file
