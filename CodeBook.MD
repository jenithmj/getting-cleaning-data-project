Getting and Cleaning Data Project
Jenith


Description


Additional information about the variables, data and transformations used in the course project for the Johns Hopkins Getting and Cleaning Data course.
Source Data
A full description of the data used in this project can be found at  : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The source data for this project can be found here :http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


Data Set Information


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
Attribute Information
For each record in the dataset it is provided:
•	Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
•	Triaxial Angular velocity from the gyroscope.
•	A 561-feature vector with time and frequency domain variables.
•	Its activity label.
•	An identifier of the subject who carried out the experiment.


Section 1 . 
Downloading the Data Set from the URL provided in the Coursera Course Link to your working Directory
Downloads and unzips the file in the working directory, you can change the destination of the file by changing  the destination path for the variable “dest_file”

Section 2. Merge the training and the test sets to create one data set and assign appropriate column names and Data labels
Here the code reads from the data set which we have downloaded and combines all of them into a combined data set

1.	Reads the Data present in the Train folder and assigning them to the below variables
•	x_train
•	y_train
•	subject_train
2.	Reads Data present in the test Folder and assigning them to the below variables
•	x_test
•	y_test
•	subject_test
3.	Reads Data in the feature Text file and assigns them to the variable
•	Features
4.	Reads Data from the Activity_labes text file and assigns them to the variable
•	activityLabels
5.	Assigning’s appropriate column names to the imported data sets
6.	Merges all the Train and Test Data set into a whole data set combinedset
.
Section 3. Extract only the measurements on the mean and standard deviation for each measurement.
1.	Reads all the column names from the Combined data set
2.	Creates a vector for Defining ID, Mean and Standard Deviation 
3.	Makes a subset from the combined data set

Section 4. Using descriptive activity names to name the activities in the data set
Using descriptive activity names to name the activities in the data set 

Section 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
1.	Make  Tidy Data Set
2.	Writes the Tidy Data set to a txt file
Note :  The code is taking for granted that all the data is present in the same folder.
