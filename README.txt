
1. RAW DATA 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth
filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

2. TIDY DATA

The table below gives a description of the variable reported in the TIDY data set.
for each of the 86 variables included in the tidy data set, the mean is reported out of the 30 x 6 = 180 groups of pairs [test subject(30);]
For an exhaustive report on how the tidy data set was produced, see file "codebook.md" in the repository or directly the genereting script "run_analysis.R"


VARIABLE NAME			--	AXIS	--	MEASUREMENT			--	UNITS	--	DOMAIN	--	ACCELERATION SOURCE	--	OPERATION

tBodyAcc_mean_X			--	X	--	ACCELERATION			--	NA	--	TIME	--	BODY	--	MEAN
tBodyAcc_mean_Y			--	Y	--	ACCELERATION			--	NA	--	TIME	--	BODY	--	MEAN
tBodyAcc_mean_Z			--	Z	--	ACCELERATION			--	NA	--	TIME	--	BODY	--	MEAN
tBodyAcc_std_X			--	X	--	ACCELERATION			--	NA	--	TIME	--	BODY	--	STD
tBodyAcc_std_Y			--	Y	--	ACCELERATION			--	NA	--	TIME	--	BODY	--	STD
tBodyAcc_std_Z			--	Z	--	ACCELERATION			--	NA	--	TIME	--	BODY	--	STD
tGravityAcc_mean_X		--	X	--	GRAVITY ACCELERATION		--	NA	--	TIME	--	GRAVITY	--	MEAN
tGravityAcc_mean_Y		--	Y	--	GRAVITY ACCELERATION		--	NA	--	TIME	--	GRAVITY	--	MEAN
tGravityAcc_mean_Z		--	Z	--	GRAVITY ACCELERATION		--	NA	--	TIME	--	GRAVITY	--	MEAN
tGravityAcc_std_X		--	X	--	GRAVITY ACCELERATION		--	NA	--	TIME	--	GRAVITY	--	STD
tGravityAcc_std_Y		--	Y	--	GRAVITY ACCELERATION		--	NA	--	TIME	--	GRAVITY	--	STD
tGravityAcc_std_Z		--	Z	--	GRAVITY ACCELERATION		--	NA	--	TIME	--	GRAVITY	--	STD
tBodyAccJerk_mean_X		--	X	--	BODY ACCELERATION (JERK)	--	NA	--	TIME	--	BODY	--	MEAN
tBodyAccJerk_mean_Y		--	Y	--	BODY ACCELERATION (JERK)	--	NA	--	TIME	--	BODY	--	MEAN
tBodyAccJerk_mean_Z		--	Z	--	BODY ACCELERATION (JERK)	--	NA	--	TIME	--	BODY	--	MEAN
tBodyAccJerk_std_X		--	X	--	BODY ACCELERATION (JERK)	--	NA	--	TIME	--	BODY	--	STD
tBodyAccJerk_std_Y		--	Y	--	BODY ACCELERATION (JERK)	--	NA	--	TIME	--	BODY	--	STD
tBodyAccJerk_std_Z		--	Z	--	BODY ACCELERATION (JERK)	--	NA	--	TIME	--	BODY	--	STD
tBodyGyro_mean_X		--	X	--	BODY GYROSCOPE			--	NA	--	TIME	--	BODY	--	MEAN
tBodyGyro_mean_Y		--	Y	--	BODY GYROSCOPE			--	NA	--	TIME	--	BODY	--	MEAN
tBodyGyro_mean_Z		--	Z	--	BODY GYROSCOPE			--	NA	--	TIME	--	BODY	--	MEAN
tBodyGyro_std_X			--	X	--	BODY GYROSCOPE			--	NA	--	TIME	--	BODY	--	STD
tBodyGyro_std_Y			--	Y	--	BODY GYROSCOPE			--	NA	--	TIME	--	BODY	--	STD
tBodyGyro_std_Z			--	Z	--	BODY GYROSCOPE			--	NA	--	TIME	--	BODY	--	STD
tBodyGyroJerk_mean_X		--	X	--	BODY GYROSCOPE (JERK)		--	NA	--	TIME	--	BODY	--	MEAN
tBodyGyroJerk_mean_Y		--	Y	--	BODY GYROSCOPE (JERK)		--	NA	--	TIME	--	BODY	--	MEAN
tBodyGyroJerk_mean_Z		--	Z	--	BODY GYROSCOPE (JERK)		--	NA	--	TIME	--	BODY	--	MEAN
tBodyGyroJerk_std_X		--	X	--	BODY GYROSCOPE (JERK)		--	NA	--	TIME	--	BODY	--	STD
tBodyGyroJerk_std_Y		--	Y	--	BODY GYROSCOPE (JERK)		--	NA	--	TIME	--	BODY	--	STD
tBodyGyroJerk_std_Z		--	Z	--	BODY GYROSCOPE (JERK)		--	NA	--	TIME	--	BODY	--	STD
tBodyAccMag_mean		--		--	BODY ACCELERATION (MAGNITUDE)	--	NA	--	TIME	--	BODY	--	MEAN
tBodyAccMag_std			--		--	BODY ACCELERATION (MAGNITUDE)	--	NA	--	TIME	--	BODY	--	STD
tGravityAccMag_mean		--		--	GRAVITY ACCELERATION (MAGNITUDE)--	NA	--	TIME	--	GRAVITY	--	MEAN
tGravityAccMag_std		--		--	GRAVITY ACCELERATION (MAGNITUDE)--	NA	--	TIME	--	GRAVITY	--	STD
tBodyAccJerkMag_mean		--		--	BODY ACCELERATION (JERK/MAGNITUDE)--	NA	--	TIME	--	BODY	--	MEAN
tBodyAccJerkMag_std		--		--	BODY ACCELERATION (JERK/MAGNITUDE)--	NA	--	TIME	--	BODY	--	STD
tBodyGyroMag_mean		--		--	BODY GYROSCOPE (MAGNITUDE)	--	NA	--	TIME	--	BODY	--	MEAN
tBodyGyroMag_std		--		--	BODY GYROSCOPE (MAGNITUDE)	--	NA	--	TIME	--	BODY	--	STD
tBodyGyroJerkMag_mean		--		--	BODY GYROSCOPE (JERK/MAGNITUDE)	--	NA	--	TIME	--	BODY	--	MEAN
tBodyGyroJerkMag_std		--		--	BODY GYROSCOPE (JERK/MAGNITUDE)	--	NA	--	TIME	--	BODY	--	STD
fBodyAcc_mean_X			--	X	--	FREQ. BODY ACCELERATION		--	NA	--	FREQUENCY	--	BODY	--	MEAN
fBodyAcc_mean_Y			--	Y	--	FREQ. BODY ACCELERATION		--	NA	--	FREQUENCY	--	BODY	--	MEAN
fBodyAcc_mean_Z			--	Z	--	FREQ. BODY ACCELERATION		--	NA	--	FREQUENCY	--	BODY	--	MEAN
fBodyAcc_std_X			--	X	--	FREQ. BODY ACCELERATION		--	NA	--	FREQUENCY	--	BODY	--	STD
fBodyAcc_std_Y			--	Y	--	FREQ. BODY ACCELERATION		--	NA	--	FREQUENCY	--	BODY	--	STD
fBodyAcc_std_Z			--	Z	--	FREQ. BODY ACCELERATION		--	NA	--	FREQUENCY	--	BODY	--	STD
fBodyAcc_meanFreq_X		--	X	--	FREQ. BODY ACCELERATION		--	NA	--	FREQUENCY	--	BODY	--	MEAN FREQUENCY
fBodyAcc_meanFreq_Y		--	Y	--	FREQ. BODY ACCELERATION		--	NA	--	FREQUENCY	--	BODY	--	MEAN FREQUENCY
fBodyAcc_meanFreq_Z		--	Z	--	FREQ. BODY ACCELERATION		--	NA	--	FREQUENCY	--	BODY	--	MEAN FREQUENCY
fBodyAccJerk_mean_X		--	X	--	FREQ. BODY ACCELERATION (JERK)	--	NA	--	FREQUENCY	--	BODY	--	MEAN
fBodyAccJerk_mean_Y		--	Y	--	FREQ. BODY ACCELERATION (JERK)	--	NA	--	FREQUENCY	--	BODY	--	MEAN
fBodyAccJerk_mean_Z		--	Z	--	FREQ. BODY ACCELERATION (JERK)	--	NA	--	FREQUENCY	--	BODY	--	MEAN
fBodyAccJerk_std_X		--	X	--	FREQ. BODY ACCELERATION (JERK)	--	NA	--	FREQUENCY	--	BODY	--	STD
fBodyAccJerk_std_Y		--	Y	--	FREQ. BODY ACCELERATION (JERK)	--	NA	--	FREQUENCY	--	BODY	--	STD
fBodyAccJerk_std_Z		--	Z	--	FREQ. BODY ACCELERATION (JERK)	--	NA	--	FREQUENCY	--	BODY	--	STD
fBodyAccJerk_meanFreq_X		--	X	--	FREQ. BODY ACCELERATION (JERK)	--	NA	--	FREQUENCY	--	BODY	--	MEAN FREQUENCY
fBodyAccJerk_meanFreq_Y		--	Y	--	FREQ. BODY ACCELERATION (JERK)	--	NA	--	FREQUENCY	--	BODY	--	MEAN FREQUENCY
fBodyAccJerk_meanFreq_Z		--	Z	--	FREQ. BODY ACCELERATION (JERK)	--	NA	--	FREQUENCY	--	BODY	--	MEAN FREQUENCY
fBodyGyro_mean_X		--	X	--	FREQ. BODY GYROSCOPE		--	NA	--	FREQUENCY	--	BODY	--	MEAN
fBodyGyro_mean_Y		--	Y	--	FREQ. BODY GYROSCOPE		--	NA	--	FREQUENCY	--	BODY	--	MEAN
fBodyGyro_mean_Z		--	Z	--	FREQ. BODY GYROSCOPE		--	NA	--	FREQUENCY	--	BODY	--	MEAN
fBodyGyro_std_X			--	X	--	FREQ. BODY GYROSCOPE		--	NA	--	FREQUENCY	--	BODY	--	STD
fBodyGyro_std_Y			--	Y	--	FREQ. BODY GYROSCOPE		--	NA	--	FREQUENCY	--	BODY	--	STD
fBodyGyro_std_Z			--	Z	--	FREQ. BODY GYROSCOPE		--	NA	--	FREQUENCY	--	BODY	--	STD
fBodyGyro_meanFreq_X		--	X	--	FREQ. BODY GYROSCOPE		--	NA	--	FREQUENCY	--	BODY	--	MEAN FREQUENCY
fBodyGyro_meanFreq_Y		--	Y	--	FREQ. BODY GYROSCOPE		--	NA	--	FREQUENCY	--	BODY	--	MEAN FREQUENCY
fBodyGyro_meanFreq_Z		--	Z	--	FREQ. BODY GYROSCOPE		--	NA	--	FREQUENCY	--	BODY	--	MEAN FREQUENCY
fBodyAccMag_mean		--		--	FREQ. BODY ACCELERATION (MAGNITUDE)--	NA	--	FREQUENCY	--	BODY	--	MEAN
fBodyAccMag_std			--		--	FREQ. BODY ACCELERATION (MAGNITUDE)--	NA	--	FREQUENCY	--	BODY	--	STD
fBodyAccMag_meanFreq		--		--	FREQ. BODY ACCELERATION (MAGNITUDE)--	NA	--	FREQUENCY	--	BODY	--	MEAN FREQUENCY
fBodyBodyAccJerkMag_mean	--		--	FREQ. BODY ACCELERATION (JERK/MAGNITUDE)NA	--	FREQUENCY	--	BODY	--	MEAN
fBodyBodyAccJerkMag_std		--		--	FREQ. BODY ACCELERATION (JERK/MAGNITUDE)NA	--	FREQUENCY	--	BODY	--	STD
fBodyBodyAccJerkMag_meanFreq	--		--	FREQ. BODY ACCELERATION (JERK/MAGNITUDE)NA	--	FREQUENCY	--	BODY	--	MEAN FREQUENCY
fBodyBodyGyroMag_mean		--		--	FREQ. BODY BODY GYROSCOPE (MAGNITUDE)--	NA	--	FREQUENCY	--	BODY	--	MEAN
fBodyBodyGyroMag_std		--		--	FREQ. BODY BODY GYROSCOPE (MAGNITUDE)--	NA	--	FREQUENCY	--	BODY	--	STD
fBodyBodyGyroMag_meanFreq	--		--	FREQ. BODY BODY GYROSCOPE (MAGNITUDE)--	NA	--	FREQUENCY	--	BODY	--	MEAN FREQUENCY
fBodyBodyGyroJerkMag_mean	--		--	FREQ. BODY BODY GYROSCOPE (JERK/MAGNITUDE)NA	--	FREQUENCY	--	BODY	--	MEAN
fBodyBodyGyroJerkMag_std	--		--	FREQ. BODY BODY GYROSCOPE (JERK/MAGNITUDE)NA	--	FREQUENCY	--	BODY	--	STD
fBodyBodyGyroJerkMag_meanFreq	--		--	FREQ. BODY BODY GYROSCOPE (JERK/MAGNITUDE)NA	--	FREQUENCY	--	BODY	--	MEAN FREQUENCY
angletBodyAccMean,gravity	--	ANGLE	--	BODY ACCELERATION VS. GRAVITY		--	NA	--	NA	--	NA	--	NA
angletBodyAccJerkMean,gravityMean--	ANGLE	--	BODY ACCELERATION JERK MEAN VS. GRAVITY MEAN	NA	--	NA	--	NA	--	NA
angletBodyGyroMean,gravityMean	--	ANGLE	--	BODY GYROSCOPE MEAN VS. GRAVITY MEAN	--	NA	--	NA	--	NA	--	NA
angletBodyGyroJerkMean,gravityMean--	ANGLE	--	BODY GYROSCOPE JERK MEAN VS. GRAVITY MEAN--	NA	--	NA	--	NA	--	NA
angleX,gravityMean		--	ANGLE	--	X VS. GRAVITY MEAN			--	NA	--	NA	--	NA	--	NA
angleY,gravityMean		--	ANGLE	--	Y VS. GRAVITY MEAN			--	NA	--	NA	--	NA	--	NA
angleZ,gravityMean		--	ANGLE	--	Y VS. GRAVITY MEAN			--	NA	--	NA	--	NA	--	NA


