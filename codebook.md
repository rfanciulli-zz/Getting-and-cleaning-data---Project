---
title: "CODEBOOK: run_analysis.r"
author: "Riccardo Fanciulli"
date: "Saturday, June 20, 2015"
output: html_document
---

### Introduction

This codebook explains the steps taken for tidying up and summarizing the data collected from the accelerometers from the Samsung Galaxy S smartphone.The data were download from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description of the experiment and its data is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

After a summary of the steps taken in the script "run_analysis.r", a more detailed description of the script follows.

### Description of the raw data set

The data-set originated from the study was divided in two parts for TRAINING (70%) and TESTING (30%) of the learning model used. 
For each of these two groups the following tables were given:

- features.txt
        
        List of the 561 different variables recorded during the experiment 
- activity_labels.txt
        
        List of the 6 subjects' activities during the experiment (walking, standing, lying, etc.) 
- X_test/train.txt
        
        Records of the 561 variables during the experiment (corresponding to different subjects and activities) 
- subject_test/train.txt
        
        Table linking the data (rows) recorded in X_test/trial with the 30 subjects of the experiment
- y_test/train.txt
        
        Table linking the data (rows) recorded in X_test/trial with the 6 activities of the experiment

Putting together the three tables:

- X_test/train
- y_test/train
- subject_test/train

One can assign to each data point (in table X_test/train) what was measured, who was the subject and what activity the subject was doing.

### Step-wise description of the script "run_analysis.r": Summary

- All the tables are downloaded and unzipped manually prior to applying the script
- The tables are read into R (all except X_test/train)
- The tables X_test/train are read up in chunks, only the columns with labels containing "mean" and "std" (86 var remaining)
- An additional column labeled "IDsubject" is added to X_test/train
- An additional column labeled "IDactivity" is added to X_test/train
- The two tables "X_test" and "X_train" are merged into "X" and variable names are applied
- The variable names are cleaned of numbers, "()", "(", ")", and "-" (replaced by "_")  
- The information contained in "X" is summarized obtaining the mean of each variable for each pair [subject(30);activity(6)] in a 88x180 table
- The two columns "IDsubject" and "IDactivity" are changed into factors and each level is labeled with "Subject numsubject" and "activity-name"
- The summarized data table is saved in a txt file using write.table

### Step-wise description of the script "run_analysis.r": Thorough

#### set various directories
```{r}
D_test <- paste("./UCI HAR Dataset/test/" , sep="") 
D_train <- paste("./UCI HAR Dataset/train/" , sep="" ) 
D_exp <- paste("./UCI HAR Dataset/" , sep="" ) 
```

#### IMPORT, FILTER, AND MERGE DATA SETS  

#### load: subject_test/train.txt + "activity" list + y_test/train.txt + features.txt
```{r}
subjects_test  <- read.table(paste(D_test,"subject_test.txt", sep=""), header=FALSE, nrows = 2947 )  # 9 subjects for test                                                        
subjects_train  <- read.table(paste(D_train,"subject_train.txt", sep=""), header=FALSE )  # 10 subjects for test

activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE) # 6 activities

y_test  <- read.table(paste(D_test,"y_test.txt", sep=""), header=FALSE, nrows = 2947 )  # 6 unique activities for test                                                        
y_train  <- read.table(paste(D_train,"y_train.txt", sep=""), header=FALSE )  # 6 unique activities for train

features <- read.table(paste(D_exp,"features.txt", sep=""), sep="\t", header=FALSE, nrows = 561, colClasses = "character")
```

#### filter: features list retaining only features containing "mean" and "std"
```{r}
idx_mean <- unlist(lapply( features, function(x){ grepl("mean",x, ignore.case=TRUE) } ))
idx_std <- unlist(lapply( features, function(x){ grepl("std",x, ignore.case=TRUE) } ))
idx_f <- idx_mean | idx_std
ColClass = character(86); ColClass[idx_f] <- "numeric" ; ColClass[!idx_f] <- "NULL" 
```

#### load: X_test:  (import by stitching) and filter imediately each imported chuck
```{r}
steps <- 10 ; packages <- 2950/steps  # reading steps
steps_skipped <- 0
# X_test: loop Loading & Filtering 
for(i in 1:steps){
        print(paste("Step:",as.character(i),"lines skipped:",as.character(steps_skipped),"lines read:",as.character(packages)))
        Xtest_tmp  <- read.fwf(paste(D_test,"X_test.txt", sep=""), widths = rep(16,561), sep="", header=FALSE, skip = steps_skipped, n = packages, colClasses = ColClass)
        steps_skipped <- steps_skipped + packages
        if(i==1){ Xtest <- Xtest_tmp} else{Xtest <- rbind(Xtest, Xtest_tmp)}
        print(paste("package number:",as.character(i),"done","  read:",as.character(length(Xtest_tmp[,1])),"lines", "  Xtest at size:", as.character(length(Xtest[,1]))))
        rm(Xtest_tmp)
}

# save X_test filtered
save(X_test) 
```

#### load: X_train:  (import by stitching) and filter
```{r}
steps <- 20; steps_skipped <- 0 # reading steps
packages <- 7500/steps
# X_train: loop Loading & Filtering 
for(i in 1:steps){
        print(paste("Step:",as.character(i),"lines skipped:",as.character(steps_skipped),"lines read:",as.character(packages)))
        Xtrain_tmp  <- read.fwf(paste(D_train,"X_train.txt", sep=""), widths = rep(16,561), sep="", header=FALSE, skip = steps_skipped, n = packages, colClasses = ColClass)
        steps_skipped <- steps_skipped + packages
        if(i==1){Xtrain <- Xtrain_tmp}else{Xtrain <- rbind(Xtrain, Xtrain_tmp)}
        print(paste("package number:",as.character(i),"done","  read:",as.character(length(Xtrain_tmp[,1])),"lines", "  Xtest at size:", as.character(length(Xtrain[,1]))))
        rm(Xtrain_tmp)
}

# save X_train filtered
save(X_train) 
```

#### add two new columns (separately to X_test and X_train):
```{r}
# 1. IDsubject
# 2. IDactivity
Xtest <- cbind(Xtest, subjects_test, y_test)
Xtrain <- cbind(Xtrain, subjects_train, y_train)
```

#### Merge X_test and X_train into one "X"
```{r}
Xtrain <- rbind(Xtest, Xtrain)
X <- Xtrain                     #10,299 x (86+2)
rm(Xtest); rm(Xtrain)
```

#### Apply VAR names to the newly merged table "X"
```{r}
names(X) <- c(features[idx_f,1], "IDsubject", "IDactivity")
```

#### SUMMARIZING THE INFORMATION IN A SECOND DATA SET

#### Clean VAR names from numbers
```{r}
clean_spaces <- function(x){
                                pos <- regexpr(" ", x)[1]
                                Nc <- nchar(x)
                                newS <- substr(x, pos+1, Nc)
                                newS <- gsub("-","_",newS)
                                newS <- gsub("\\(|\\)","",newS);
                                newS        
}
oldnames <- names(X)
names(X) <- unlist(lapply(oldnames,  clean_spaces))
```

#### Summarizing data using MEAN for groups combining [ID_activity , ID_subject]     dim = 180 x 88 
```{r}
Ns <- length(X[1,])-2
for(j in 1:Ns ){
        X_tmp <- ddply(X, c("IDsubject", "IDactivity"), summarize, mean(X[,j],na.rm=TRUE))
        if(j==1){
                X_summary <- X_tmp
        }
        else{
                X_summary <- cbind(X_summary, X_tmp[,3])
        }
}
names(X_summary) <- c("ID_subject", "ID_activity",newnames[1:Ns])
```

#### "factorising" the ID_subject and ID_activity columns in "X" and applying labels to their levels
```{r}
# ID_subject
X_summary$ID_subject <- factor(X_summary$ID_subject,
                               , levels = 1:30
                               , labels = paste(rep("subject number",30), as.character(1:30)))

# ID_activity
X_summary$ID_activity <- factor(X_summary$ID_activity,
                               , levels = 1:6
                               , labels = as.character(activities[,2]))

save(X_summary, file="X_summary.txt") # for my use
```

#### SAVING SUMMARIZED TIDY DATA SET in the required format
```{r}
write.table(X_summary, file = "data_tidy_summarized.txt", row.name=FALSE) 
```


