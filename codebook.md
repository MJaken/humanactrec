CodeBook
================
MJ
Feb 10, 2018

Project Description
-------------------

This is a course project for John Hopkins University Getting and Cleaning Data course on Coursera platform. Data used taken from UCI Machine Learning Depository from an experiment data recordings ran by [Smartlab](http://www.smartlab.ws) to find out if smartphone sensors can recognise subject's activity performed.

Study Design and Data Processing
--------------------------------

### Collection of the Raw Data

Smartlab Notes:

> The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. They performed a protocol of activities composed of six basic activities: three static postures (standing, sitting, lying) and three dynamic activities (walking, walking downstairs and walking upstairs). The experiment also included postural transitions that occurred between the static postures. These are: stand-to-sit, sit-to-stand, sit-to-lie, lie-to-sit, stand-to-lie, and lie-to-stand. All the participants were wearing a smartphone (Samsung Galaxy S II) on the waist during the experiment execution. We captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz using the embedded accelerometer and gyroscope of the device. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of 561 features was obtained by calculating variables from the time and frequency domain. See `features_info.txt` for more details. [1]

### Notes on Original (Raw) Data

Inertial sensor data was not used in project but exists in downloaded .zip file and can be extracted manually. Other data, used in this project consists of:

-   561 feature vector with time and frequency domain variables (`X_train.txt` and `X_test.txt` files).
-   activity codes (`y_train.txt` and `y_test.txt` ) associated with each observation `X_train.txt` and `X_test.txt`.
-   subject IDs for each observation contained in `subject_train.txt` and `subject_test.txt` files.
-   activity codes descripted in `activity_labels.txt`
-   `features.txt` file contains variable description for `X_train.txt` and `X_test.txt` data.
-   Features are normalized and bounded within \[-1,1\].
-   Acceleration units (total and body) are 'g's (Earth gravitational constant = 9.80665 m/s^2).
-   Gyroscope units (Gyro) are rad/s.

Creating Tidy Data File
-----------------------

### Guide to Create Tidy Datafile

1.  Download data (`raw` folder) or use `get_data.R` script from your work directory
2.  Run `run_analysis.R` script from your working directory
3.  You'll get "tidyData"" and "data" data frames in R environment and tidy\_data.txt file with tidyData

Cleaning of the Data
--------------------

1.  `run_analysis.R` script combines train and test datasets in one data frame with subject id's and activities performed
2.  Measurements labeled and labels modified ("()", "-" cleared and some letter case modifications)
3.  All measurements except mean measurements and standart deviation measurements wiped until 68 variables including id and activity name left
4.  Output data from previous step grouped according to subjects first and activities second
5.  Averages for each activity of each subject calculated using `summarize()` and `mean()` functions

Description of Tidy Data Variables
----------------------------------

Output dataset dimensioins:

    ## [1] 180  68

Variables:

`non-sensor data`

| Variable name | Description                        |
|---------------|------------------------------------|
| `ID`          | identification number of a subject |
| `Activity`    | activity performed                 |

`sensor data`

Other variable names composed using shortnings

| Short     | Description                                             |
|-----------|---------------------------------------------------------|
| time/freq | time or frequency domain                                |
| Acc       | data from accelerometer                                 |
| Gyro      | data from gyroscope                                     |
| Body      | body acceleration signal                                |
| Gravity   | gravity acceleration signal                             |
| Jerk      | for Jerk signal                                         |
| Mag       | for magnitude                                           |
| X/Y/Z     | corresponding axis name                                 |
| Mean/Std  | mean or standart deviation of recording                 |
| Avg       | average calculated for tidy dataset (abscent in `data`) |

List of sensor variables:

    ##  [1] "timeBodyAccMeanXAvg"            "timeBodyAccMeanYAvg"           
    ##  [3] "timeBodyAccMeanZAvg"            "timeBodyAccStdXAvg"            
    ##  [5] "timeBodyAccStdYAvg"             "timeBodyAccStdZAvg"            
    ##  [7] "timeGravityAccMeanXAvg"         "timeGravityAccMeanYAvg"        
    ##  [9] "timeGravityAccMeanZAvg"         "timeGravityAccStdXAvg"         
    ## [11] "timeGravityAccStdYAvg"          "timeGravityAccStdZAvg"         
    ## [13] "timeBodyAccJerkMeanXAvg"        "timeBodyAccJerkMeanYAvg"       
    ## [15] "timeBodyAccJerkMeanZAvg"        "timeBodyAccJerkStdXAvg"        
    ## [17] "timeBodyAccJerkStdYAvg"         "timeBodyAccJerkStdZAvg"        
    ## [19] "timeBodyGyroMeanXAvg"           "timeBodyGyroMeanYAvg"          
    ## [21] "timeBodyGyroMeanZAvg"           "timeBodyGyroStdXAvg"           
    ## [23] "timeBodyGyroStdYAvg"            "timeBodyGyroStdZAvg"           
    ## [25] "timeBodyGyroJerkMeanXAvg"       "timeBodyGyroJerkMeanYAvg"      
    ## [27] "timeBodyGyroJerkMeanZAvg"       "timeBodyGyroJerkStdXAvg"       
    ## [29] "timeBodyGyroJerkStdYAvg"        "timeBodyGyroJerkStdZAvg"       
    ## [31] "timeBodyAccMagMeanAvg"          "timeBodyAccMagStdAvg"          
    ## [33] "timeGravityAccMagMeanAvg"       "timeGravityAccMagStdAvg"       
    ## [35] "timeBodyAccJerkMagMeanAvg"      "timeBodyAccJerkMagStdAvg"      
    ## [37] "timeBodyGyroMagMeanAvg"         "timeBodyGyroMagStdAvg"         
    ## [39] "timeBodyGyroJerkMagMeanAvg"     "timeBodyGyroJerkMagStdAvg"     
    ## [41] "freqBodyAccMeanXAvg"            "freqBodyAccMeanYAvg"           
    ## [43] "freqBodyAccMeanZAvg"            "freqBodyAccStdXAvg"            
    ## [45] "freqBodyAccStdYAvg"             "freqBodyAccStdZAvg"            
    ## [47] "freqBodyAccJerkMeanXAvg"        "freqBodyAccJerkMeanYAvg"       
    ## [49] "freqBodyAccJerkMeanZAvg"        "freqBodyAccJerkStdXAvg"        
    ## [51] "freqBodyAccJerkStdYAvg"         "freqBodyAccJerkStdZAvg"        
    ## [53] "freqBodyGyroMeanXAvg"           "freqBodyGyroMeanYAvg"          
    ## [55] "freqBodyGyroMeanZAvg"           "freqBodyGyroStdXAvg"           
    ## [57] "freqBodyGyroStdYAvg"            "freqBodyGyroStdZAvg"           
    ## [59] "freqBodyAccMagMeanAvg"          "freqBodyAccMagStdAvg"          
    ## [61] "freqBodyBodyAccJerkMagMeanAvg"  "freqBodyBodyAccJerkMagStdAvg"  
    ## [63] "freqBodyBodyGyroMagMeanAvg"     "freqBodyBodyGyroMagStdAvg"     
    ## [65] "freqBodyBodyGyroJerkMagMeanAvg" "freqBodyBodyGyroJerkMagStdAvg"

Sources
-------

[1] Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Luca Oneto(1) and Xavier Parra(2) 1 - Smartlab, DIBRIS - UniversitÃ degli Studi di Genova, Genoa (16145), Italy. 2 - CETpD - Universitat PolitÃ¨cnica de Catalunya. Vilanova i la GeltrÃº (08800), Spain
