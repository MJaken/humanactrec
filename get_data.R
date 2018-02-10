## R script used to download raw data from original source, unzip it and prepare for
## further usage by run_analysis.R script

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "data.zip", method="curl")
unzip("data.zip")
file.rename("UCI HAR Dataset", "raw")