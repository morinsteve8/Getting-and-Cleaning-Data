---
title: "CODEBOOK.MD"
date: "June 24, 2016"
output: html_document
---

## Description
The dataset provided in the 'final_aggregated_data.txt' file is required for the course project in the 'Getting and Cleaning Data' course. This Code Book describes the data set and which calculations have been performed on the data.

## Original Data Set Source
The original data was sourced from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Details
- 180 observations of 81 Variables
- The 'training' and 'test' data has been merged into the 'final_aggregated_data.txt' file.
- The correct columns names were applied to the data set from the 'features.txt' file.
- Only columns with the mean and standard deviation were subsetted from the original data set. The mean calculation was then applied to each of these columns.
- Activity field: replaced the number with the text for each activity (from the activity_labels.txt)
- The data set was finally arranged/sorted by subject & activity.

## Relevant Files
The run_analysis.R file contains the R script that modified the original data set.