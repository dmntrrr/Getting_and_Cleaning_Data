library(dplyr)
feature <- read.table("UCI HAR Dataset/features.txt")
measure <- grep("\\bmean\\b|\\bstd\\b", feature[,2])
act_labels <- c("WALKING", "WALKING UPSTAIRS", "WALKING DOWNSTAIRS", "SITTING", 
                "STANDING", "LAYING")

## Test set

value_t <- read.table("UCI HAR Dataset/test/X_test.txt")
subject_t <- read.table("UCI HAR Dataset/test/subject_test.txt")
activity_t <- read.table("UCI HAR Dataset/test/y_test.txt")

colnames(value_t) <- feature[,2]
colnames(subject_t) <- "subject"
colnames(activity_t) <- "activity"

value_t <- select(value_t, measure)
data_t <- cbind(activity_t, subject_t, value_t)
rm(value_t, subject_t, activity_t)

## Train set

value_tr <- read.table("UCI HAR Dataset/train/X_train.txt")
subject_tr <- read.table("UCI HAR Dataset/train/subject_train.txt")
activity_tr <- read.table("UCI HAR Dataset/train/y_train.txt")

colnames(value_tr) <- feature[,2]
colnames(subject_tr) <- "subject"
colnames(activity_tr) <- "activity"

value_tr <- select(value_tr, measure)
data_tr <- cbind(activity_tr, subject_tr, value_tr)
rm(value_tr, subject_tr, activity_tr, measure)

## Merging

DATA <- rbind(data_t, data_tr)

c <- c()
for (i in 1:length(DATA$activity)) {
    c <- c(c,act_labels[DATA$activity[i]])
}
DATA$activity <- c
DATA <- arrange(DATA, subject)
rm(i, c, data_t, data_tr)

## Creating second dataset

measure2 <- grep("\\bmean\\b|\\bstd\\b", feature[,2], value = TRUE)
DATA2 <- DATA %>% group_by(activity, subject) %>% 
                           summarise()
for (i in 1:length(measure2)) {
    DATA3 <- DATA %>% group_by(activity, subject) %>% 
                               summarise(mean(.data[[measure2[i]]]))
    DATA2 <- cbind(DATA2, DATA3[,3])
}
rm(DATA3, i, measure2)

colnames(DATA2) <- gsub(".data|\\[|\\]", "", colnames(DATA2))
