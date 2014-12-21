# Codebook

### For each record it was provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### After the analysis the output variables are :
=================================================

- volunteer_No (1 - 30) :	The id of the volunteer who performed the experiment 
- activity     :	The label of the activity performed
- activity_No  (1 - 6)  :	The id of the activity performed
- MEAN_xxx	 : These variables are the averages of the input variables grouped by volunteer and activity.