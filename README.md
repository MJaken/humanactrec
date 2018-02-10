# Getting and Cleaning Data - Course Project
Author: MJ

Repository for Human Activity Recognition Using Smartphones data analysis submission for John Hopkins Getting and Cleaning Data course project

### Overview
This project demonstrates collection and cleaning data and further analysis (finding average values) of human activity acquired from Samsung Galaxy SII smartphones. Data was taken from: [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions) (please follow "Download: Data Folder" link)

##### This repository contains:
 * `README.md`, text file you're reading now, provides information on process and overview of the project
 * `CodeBook.md`, text file, giving information about variables used and transformations performed to generate output dataset
 * `tidy_data.txt`, text file, containing the output dataset (using `read.table()` to read data into R/RStudio is recommended)
 * `run_analysis.R`, R script, used to generate output dataset 
 * `get_data.R`, R script, used to downloading and unpacking data from original source
 * `raw`, directory, contains raw data used to generate output (recomended to download to working directory, otherwise use `get_data.R` script for full raw data)
 
### System Requirements 
 * RSudio(ver 3.4.3 was used)
 * `dplyr` and `RCurl` packages installed

### Course Project
To get `tidy_data.txt` file with output dataset you should run `run_analysis.R` script on raw data (or use `get_data.R` script). `run_analysis.R` steps:

1. Loads `dplyr` package
2. Reads and combines data frame from test raw data 
3. Reads and combines data frame from train raw data 
4. Combines all data in one main dataset `data`
5. Reads activity codes, activity names and overwrites the names to main dataset
6. Reads variable names used in raw data and assigns them to columns in main dataset
7. Modifies main dataset column names 
8. Creates tidy dataset by grouping data according to subject ID and activity performed 
9. Summarizes all data according to grouping made using mean function to calculate averages
10. Adds "Avg" at the end of column names and writing tidy dataset to `tidy_data.txt` file
11. Removes intermediate data frames and vectors
 
 