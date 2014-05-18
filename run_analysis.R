# This R code will transform the UCI Data on Human Activity Recognition Using Smartphones into a 
# Tidy Data Set. More information on the data set can be obtained 
# from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and 
# See the codebook for more information on the process used and naming conventions.

subfold1 = dir("cleaning/data/train")[-1]
subfold2 = dir("cleaning/data/test")[-1]

# Open our test and training sets. 
train = lapply(as.list(subfold1), function(x) read.table(paste0(getwd(),'/cleaning/data/train/',x)))
test = lapply(as.list(subfold2), function(y) read.table(paste0(getwd(),'/cleaning/data/test/',y)))

# Open up our header and activity mapping files
activity_labels = read.table("cleaning/data/activity_labels.txt")
names(activity_labels) = c("ActivityID", "Activity")
feature_labels = read.table("cleaning/data/features.txt")

# Make our code easier to read by doing some mappings 
subject_train = train[[1]]
activities_train = train[[3]]
values_train = train[[2]]
subject_test = test[[1]]
activities_test = test[[3]]
values_test = test[[2]]

# add header to the values
flabels = as.vector(feature_labels[ ,2])
names(values_train) = flabels
names(values_test) = flabels
names(subject_train) = c("SubjectID")
names(subject_test) = c("SubjectID")
names(activities_train) = c("ActivityID")
names(activities_test) = c("ActivityID")

# Extract the columns dealing with mean or standard deviation
w = grep("mean", flabels)
w2 = grep("std", flabels)
f = flabels[w]
f1 = flabels[w2]
flabels = c(f, f1)
w = grep("Freq", flabels, invert = TRUE)
flabels = flabels[w]
values_train = values_train[ , flabels]
values_test = values_test[ , flabels]

# Combine our newly created Tidy Data
n = cbind(subject_train, activities_train, values_train)
n2 = cbind(subject_test, activities_test, values_test)
combined = rbind(n, n2)

# Merge in the appropriate Activity labels and removed the ActivityID
combined = merge(combined, activity_labels, sort = FALSE)
combined$ActivityID = NULL

# Reshape the data
mn = melt(combined, id.vars = c("SubjectID", "Activity") )
mnd = dcast(mn, SubjectID + Activity ~ variable, mean)

# Update the Column Names to somethign more descriptive
names(mnd) = sub("-std\\()", "StandardDeviation", names(mnd))
names(mnd) = sub("-mean\\()", "Mean", names(mnd))
names(mnd) = sub("f", "Frequency", names(mnd))
names(mnd) = sub("^t", "Time", names(mnd))
names(mnd) = sub("Mag", "Magnitude", names(mnd))
names(mnd) = sub("Gyro", "Gyroscope", names(mnd))

# Create our observation file
write.csv(mnd, "cleaning/output.csv", row.names = FALSE)