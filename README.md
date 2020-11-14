# Getting_and_Cleaning_Data Course Project

```ruby
library(dplyr) ## loading dplyr library
feature <- read.table("UCI HAR Dataset/features.txt") ## reading the file with the
                                                      ## names of feature variables

measure <- grep("\\bmean\\b|\\bstd\\b", feature[,2]) ## exctracting only the places of
                                                     ## names of mean and standard 
                                                     ## deviation measurements

act_labels <- c("WALKING", "WALKING UPSTAIRS", "WALKING DOWNSTAIRS", "SITTING", 
                "STANDING", "LAYING") ## vector with the actual names of activities

value_t <- read.table("UCI HAR Dataset/test/X_test.txt") ## reading files from test set
subject_t <- read.table("UCI HAR Dataset/test/subject_test.txt") ## with the data of
activity_t <- read.table("UCI HAR Dataset/test/y_test.txt") ## feature values, subjects
                                                            ## numbers and activity                                                                ##  type

colnames(value_t) <- feature[,2] ## giving the columns of the datasets names
colnames(subject_t) <- "subject"
colnames(activity_t) <- "activity"

value_t <- select(value_t, measure) ## selecting only the columns for needed types of
                                    ## measuremets
                                    
data_t <- cbind(activity_t, subject_t, value_t) ## merging into common test set dataset
rm(value_t, subject_t, activity_t) ## removing unnessesary values and variables

value_tr <- read.table("UCI HAR Dataset/train/X_train.txt") ## same steps as above
subject_tr <- read.table("UCI HAR Dataset/train/subject_train.txt")
activity_tr <- read.table("UCI HAR Dataset/train/y_train.txt")

colnames(value_tr) <- feature[,2]
colnames(subject_tr) <- "subject"
colnames(activity_tr) <- "activity"

value_tr <- select(value_tr, measure)
data_tr <- cbind(activity_tr, subject_tr, value_tr)
rm(value_tr, subject_tr, activity_tr, measure)

DATA <- rbind(data_t, data_tr) ## merging test dataset and train dataset

c <- c()
for (i in 1:length(DATA$activity)) {
    c <- c(c,act_labels[DATA$activity[i]]) ## replacing numbers, which described 
                                           ## activities with the actual names
}
DATA$activity <- c
DATA <- arrange(DATA, subject) ## sorting dataset in acsending order by the subject
rm(i, c, data_t, data_tr) ## removing unnessesary values and variables

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
```