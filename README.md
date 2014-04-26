#run_analysis.R ReadMe File

This file describes the steps in the creation of the file tidydataset.csv through the R file run_analysis.R

####The general steps are as follows:

####1. Prepare train data

Open features list and save labels to an object

Open X train data

Apply features labels to train data

Sub-select only variables with mean() or std() in variable name

Open Y train data

Create a variable activityname with descriptive labels

Open subject file and rename variable to subject

Merge subject, Y train, and X train

####2. Prepare test data

*Open features list and save labels to an object

*Open X test data

*Apply features labels to test data

*Sub-select only variables with mean() or std() in variable name

*Open Y test data

*Create a variable activityname with descriptive labels

*Open subject file and rename variable to subject

*Merge subject, Y test, and X test

####3. Combine test and train datasets using rbind
####4. Collapse to means by subject/activity combo
####5. Write data set to a csv file using tidydataset.csv