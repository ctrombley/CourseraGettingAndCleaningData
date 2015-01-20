Code Book for Tidy UCI HAR Dataset
=================================

## Description

This code book describes the tidy data set produced by the `run_analysis.R` script. After a successful run, the data is loaded into memory as a dplyr table (`tidy_data`) as well as written to `tidy_data.txt`.

The `run_analysis.R` script creates a tidy version of the University of California Irvine's (UCI's) dataset for Human Activity Recognition (HAR) using smartphones. The original UCI HAR Dataset is a public domain dataset built from the recordings of subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensor (see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Experimentswere carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying) wearing a Samsung Galaxy S II smartphone on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments were video-recorded to label the data manually.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force was assumed to have only low frequency components, so a filter with a 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

This script first generates a combined subset of the original data by appending the training data set to the test data set, and then extracting only the features that contain mean and standard deviation metrics, for a total of 79 features out of the 561 original features. This combined subset is loaded into the global environment during analysis as `std_mean_data`, and contains 10299 observations of 79 variables.  The pertinent Subject ID and Activity have also been appended as columns. 

The combined subset is further reduced by calculating the mean of the observations by activity and subject pair to generate 180 observations (6 activities * 30 subjects) of the same 79 features. 

## Description of the UCI HAR variables

The tidy dataset, loaded into memory as `tidy_data` after running analysis, consists of 180 observations summarized by activity (6 categories) and subject (30 volunteers) pairs. For each observation in the tidy dataset, the following 81 columns are provided:

- Subject
- Activity
- Features (79 columns)

### Subject

A unique numeric identifier (1-30) of the subject who carried out the experiment.

### Activity

The activity name, with one of the following possible values:
- 'LAYING',
- 'SITTING',
- 'STANDING',
- 'WALKING',
- 'WALKING_DOWNSTAIRS'
- 'WALKING_UPSTAIRS'

### Features

The measurements for which the mean is calculated. These make up the 79 columns following the subject and activity.  Please refer the codebook with the original dataset for the explanation of each individual feature.

- t.body.acc.mean.x
- t.body.acc.mean.y
- t.body.acc.mean.z
- t.body.acc.std.x
- t.body.acc.std.y
- t.body.acc.std.z
- t.gravity.acc.mean.x
- t.gravity.acc.mean.y
- t.gravity.acc.mean.z
- t.gravity.acc.std.x
- t.gravity.acc.std.y
- t.gravity.acc.std.z
- t.body.acc.jerk.mean.x
- t.body.acc.jerk.mean.y
- t.body.acc.jerk.mean.z
- t.body.acc.jerk.std.x
- t.body.acc.jerk.std.y
- t.body.acc.jerk.std.z
- t.body.gyro.mean.x
- t.body.gyro.mean.y
- t.body.gyro.mean.z
- t.body.gyro.std.x
- t.body.gyro.std.y
- t.body.gyro.std.z
- t.body.gyro.jerk.mean.x
- t.body.gyro.jerk.mean.y
- t.body.gyro.jerk.mean.z
- t.body.gyro.jerk.std.x
- t.body.gyro.jerk.std.y
- t.body.gyro.jerk.std.z
- t.body.acc.mag.mean
- t.body.acc.mag.std
- t.gravity.acc.mag.mean
- t.gravity.acc.mag.std
- t.body.acc.jerk.mag.mean
- t.body.acc.jerk.mag.std
- t.body.gyro.mag.mean
- t.body.gyro.mag.std
- t.body.gyro.jerk.mag.mean
- t.body.gyro.jerk.mag.std
- f.body.acc.mean.x
- f.body.acc.mean.y
- f.body.acc.mean.z
- f.body.acc.std.x
- f.body.acc.std.y
- f.body.acc.std.z
- f.body.acc.mean.freq.x
- f.body.acc.mean.freq.y
- f.body.acc.mean.freq.z
- f.body.acc.jerk.mean.x
- f.body.acc.jerk.mean.y
- f.body.acc.jerk.mean.z
- f.body.acc.jerk.std.x
- f.body.acc.jerk.std.y
- f.body.acc.jerk.std.z
- f.body.acc.jerk.mean.freq.x
- f.body.acc.jerk.mean.freq.y
- f.body.acc.jerk.mean.freq.z
- f.body.gyro.mean.x
- f.body.gyro.mean.y
- f.body.gyro.mean.z
- f.body.gyro.std.x
- f.body.gyro.std.y
- f.body.gyro.std.z
- f.body.gyro.mean.freq.x
- f.body.gyro.mean.freq.y
- f.body.gyro.mean.freq.z
- f.body.acc.mag.mean
- f.body.acc.mag.std
- f.body.acc.mag.mean.freq
- f.body.body.acc.jerk.mag.mean
- f.body.body.acc.jerk.mag.std
- f.body.body.acc.jerk.mag.mean.freq
- f.body.body.gyro.mag.mean
- f.body.body.gyro.mag.std
- f.body.body.gyro.mag.mean.freq
- f.body.body.gyro.jerk.mag.mean
- f.body.body.gyro.jerk.mag.std
- f.body.body.gyro.jerk.mag.mean.freq