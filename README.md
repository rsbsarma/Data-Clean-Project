# Getting and Cleaning Data

## Course Project

This project aims at cleaning the given data. As mentioned in activity_labels.txt, there are about 6 activities () that have been performed by about 30 volunteers (aged 19-48). Over a period of time, the data has been collected and then given to the user.

## Details about 'run_analysis.R'

* Assumption: The Data set folder received from the problem statement is uncompressed and loaded into the repositor
* Install and load necessary packages beforehand
* Loading / Processing all necessary testing and training data from the given data files
* Extracts only the measurements on the mean and standard deviation for each measurement
* Merge testing and training data sets as mentioned in the problem
* Apply dcast function to get tidy data which also gets saved in working directory

## Steps to work on this course project

1. Get the repository to local
2. Set the working directory using ```setwd()``` function in RStudio to this repository folder
3. Make sure the two dependent packages ```data.table``` and ```reshape2``` are already installed. Otherwise install them using the given commands install.packages("data.table") and install.packages("reshape2")
4. Run ```source("run_analysis.R")``` to generate a new file ```tiny_data.txt``` in the working directory.
