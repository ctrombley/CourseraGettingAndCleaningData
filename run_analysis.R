library(dplyr)

# Load the test and training sets into memory
test <- read.table('UCI HAR Dataset//test//X_test.txt', header=F, sep="", stringsAsFactors=F)
train <- read.table('UCI HAR Dataset//train//X_train.txt',  header=F, sep="", stringsAsFactors=F)

# Load in the feature and activity labels
features <- read.table('UCI HAR Dataset//features.txt', header=F, stringsAsFactors=F)[,2]
activity_labels <- read.table('UCI HAR Dataset//activity_labels.txt', header=F, stringsAsFactors=F)[,2]

# Merge the test and training sets into one set
data <- rbind_list(test, train)

# Tidy the feature labels and apply them to the columns
features_tidy <- gsub('([a-z])([A-Z])', '\\1.\\2', features)
features_tidy <- gsub('-', '.', features_tidy)
features_tidy <- gsub('[\\(\\)]', '', features_tidy)
features_tidy <- tolower(features_tidy)
colnames(data) <- features_tidy

# Isolate the factors containing stdev and mean measurements in their own set
std_mean_logical <- grep("(std|mean)", features)
std_mean_data <- data[,std_mean_logical]

# Load in the test & training subject observations and merge them into a single set
subject_test <- read.table('UCI HAR Dataset//test//subject_test.txt', header=F, stringsAsFactors=F)
subject_train <- read.table('UCI HAR Dataset//train//subject_train.txt', header=F, stringsAsFactors=F)
subject <- rbind(subject_test, subject_train)

# Load in the test & training activity observations and merge them into a single set
activity_test <- read.table('UCI HAR Dataset//test//y_test.txt', header=F, stringsAsFactors=F)
activity_train <- read.table('UCI HAR Dataset//train//y_train.txt', header=F, stringsAsFactors=F)
activity <- rbind(activity_test, activity_train)

# Add subject and activity observations as new columns to the data and label them
std_mean_data <-cbind(std_mean_data, subject)
std_mean_data <-cbind(std_mean_data, activity)
colnames(std_mean_data)[c(ncol(std_mean_data)-1,ncol(std_mean_data))] <- c('Subject', 'Activity')

# Replace activity IDs with their corresponding labels
std_mean_data <- mutate(std_mean_data, Activity = activity_labels[Activity])
std_mean_data <- tbl_df(std_mean_data)

# Calculate the mean value for each measurement
tidy_data <- group_by(std_mean_data, Subject, Activity) %>%
              summarise_each(funs(mean))


# Write out table for grading
write.table(tidy_data, "tidy_data.txt", row.name=F)
