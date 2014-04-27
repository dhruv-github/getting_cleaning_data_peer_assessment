### 4/27/14 ###

There are 30 subjects used in the analysis, 21 (70%)in the training group and 9 (30%) in the 
testing group.
There are five activities the subjects are required to do - 
Walking, Walking upstairs, Walking downstairs, Sitting, Standing and Laying

First,I read in the data for the training and testing sets.  There are no rows with NAs.
I identify the columns which are the mean and sd for each measurement and consider only that 
subset of the data. I merge the activity info with the train/test data and create a new data 
frame with the subject info, the activity info and the mean and sd measurements.

I do a row bind (rbind) of the testing and the training data obtained above. 
To compute the average of each variable for each subject and activity , I use the aggregate function.
