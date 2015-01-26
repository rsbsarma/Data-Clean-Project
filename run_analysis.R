#Assumption: The Data set folder received from the problem statement is uncompressed and loaded into the repositor

# Install and load necessary packages beforehand

#install.packages("data.table")
#install.packages("reshape2")
require("data.table")
require("reshape2")

# Loading necessary data: (i) activity labels (ii) features, 
# (iii) X_test data,(iv) Y_test data, (v) Subjects test data
# (vi) X_train data,(vii) Y_train data, (viii) Subjects train data
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Extracts only the measurements on the mean and standard deviation for each measurement.
extract_features <- grepl("mean|std", features)

# Process X_test & y_test data.
names(X_test) = features

# Extract only the measurements on the mean and standard deviation for each measurement.
X_test = X_test[,extract_features]

# Load activity labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "Subject"

# Bind subject, X and Y testing data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

# Load and process X_train & y_train data.

names(X_train) = features

# Extract only the measurements on the mean and standard deviation for each measurement.
X_train = X_train[,extract_features]

# Load activity data
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "Subject"

# Bind subject, X and Y training data
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

# Merge testing and training data sets as mentioned in the problem
data = rbind(test_data, train_data)

id_labels   = c("Subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)

# Apply dcast function to get tidy data
tidy_data   = dcast(melt_data, Subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./tidy_data.txt")
