Codebook for Tidy UCI HAR Dataset
=================================

## Description

This code book describes the tidy data set produced by the `run_analysis.R` script. After a successful run, the data is loaded into memory as a dplyr table (`tidy_data`) as well as written to `tidy_data.txt`.

The `run_analysis.R` script creates a tidy version of the University of California Irvine's (UCI's) dataset for Human Activity Recognition (HAR) using smartphones. The original UCI HAR Dataset is a public domain dataset built from the recordings of subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensor (see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Experimentswere carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying) wearing a Samsung Galaxy S II smartphone on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments were video-recorded to label the data manually.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force was assumed to have only low frequency components, so a filter with a 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Implementation

This script first downloads and unzips the data from the following URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The following steps are then taken to tidy the results:

1. Load the test and training sets into memory.
  * The original UCI HAR dataset is split into distinct training and test sets to facilitate machine learning.  Here they are both loaded into memory.
2. Load in the feature and activity labels.
  * The feature column names and human readable activity mappings are both stored in separate files.  Here they are both loaded into memory.
3. Merge the test and training sets into one set.
  * For the purposes of this project, we should consider the dataset as a whole, so the test and training sets are concatenated.
4. Tidy the feature labels and apply them to the columns.
  * The feature labels are tidied using a methodology described below in the **Features** section.
5. Isolate the factors containing stdev and mean measurements in their own set.
  * The project requirements call for filtering of the original set of 561 features down to a subset that represents only mean and standard deviation features.  This was accomplished by matching the original feature set for either a  "std" or "mean" token.
6. Load in the test & training subject observations and merge them into a single set.
  * The subject ID observations are stored in separate files from the feature observations, and are similarly partitioned into test and train sets that correspond to the larger test and train data sets.  Here they are both loaded into memory and concatenated in a similar fashion to the larger observation sets.
7. Load in the test & training activity observations and merge them into a single set.
  * A similar approach is taken to load in the activity observations.
8. Add subject and activity observations as new columns to the data and label them.
  * Here the subject and activity observations that are now in memory are added as columns to our tidy data set.
9. Replace activity IDs with their corresponding labels.
  * The activity IDs are replaced with human readable labels for readability.
10. Calculate the mean value for each measurement.
  * The mean is calculated across all the observations for each feature.  Our resulting dataset represents a summarized form of the data, with a single set of mean feature observations for each subject/activity pair.

The resulting subset consists of 180 observations (6 activities * 30 subjects) across 79 distinct features.

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

The measurements for which the mean is calculated. These make up the 79 columns following the subject and activity.  The feature names have been cleaned to fit a standard naming convention, where each identifier is separated by a single period.  From these names, the measurement domain can be easily ascertained ("t" for time, "f" for frequency) as well as the subject ("body", "gravity"), the sensor ("acc" for accelerometer, "gyro" for gyroscope), the original metric observed ("mean" for mean, "std" for standard deviation), the axis ("x", "y", "z"), as well as any higher-order calculations used ("jerk", "mag" for magnitude).  Please refer the codebook with the original dataset for a more detailed explanation of each individual feature.  The complete list of features is as follows:

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
