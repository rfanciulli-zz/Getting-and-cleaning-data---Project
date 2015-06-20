
library(dplyr)
setwd("C:/Users/Riccardo/Rworkspace/coursera/Downloading_datasets_course/Project/")

# IMPORT, FILTER, AND MERGE DATA SETS  ------------------------------------------------------------------------------------------------

# set various directories
D_test <- paste("./UCI HAR Dataset/test/" , sep="") 
D_train <- paste("./UCI HAR Dataset/train/" , sep="" ) 
D_exp <- paste("./UCI HAR Dataset/" , sep="" ) 

# load: subject_test/train.txt
subjects_test  <- read.table(paste(D_test,"subject_test.txt", sep=""), header=FALSE, nrows = 2947 )  # 9 subjects for test                                                        
subjects_train  <- read.table(paste(D_train,"subject_train.txt", sep=""), header=FALSE )  # 10 subjects for test


# load: "activity" list (names)
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE) # 6 activities

# load: y_test/train.txt
y_test  <- read.table(paste(D_test,"y_test.txt", sep=""), header=FALSE, nrows = 2947 )  # 6 unique activities for test                                                        
y_train  <- read.table(paste(D_train,"y_train.txt", sep=""), header=FALSE )  # 6 unique activities for train

# load: features.txt
features <- read.table(paste(D_exp,"features.txt", sep=""), sep="\t", header=FALSE, nrows = 561, colClasses = "character")

# filter: features by "mean" and "std"
idx_mean <- unlist(lapply( features, function(x){ grepl("mean",x, ignore.case=TRUE) } ))
idx_std <- unlist(lapply( features, function(x){ grepl("std",x, ignore.case=TRUE) } ))
idx_f <- idx_mean | idx_std
ColClass = character(86); ColClass[idx_f] <- "numeric" ; ColClass[!idx_f] <- "NULL" 

# load: X_test:  (import by stitching) and filter
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

# load: X_train:  (import by stitching) and filter
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

# add 2 new columns (separately to X_test and X_train):
# 1. IDsubject
# 2. IDactivity
Xtest <- cbind(Xtest, subjects_test, y_test)
Xtrain <- cbind(Xtrain, subjects_train, y_train)

# Merge X_test and X_train into one "X"
Xtrain <- rbind(Xtest, Xtrain)
X <- Xtrain                     #10,299 x (86+2)
rm(Xtest); rm(Xtrain)

# Apply VAR names
names(X) <- c(features[idx_f,1], "IDsubject", "IDactivity")


# ---------- SUMMARIZING THE INFORMATION IN A SECOND DATA SET ---------------------------------------------------------------------------------

# Clean VAR names from numbers
oldnames <- names(X)
names(X) <- unlist(lapply(oldnames,  clean_spaces))

clean_spaces <- function(x){
                                pos <- regexpr(" ", x)[1]
                                Nc <- nchar(x)
                                newS <- substr(x, pos+1, Nc)
                                newS <- gsub("-","_",newS)
                                newS <- gsub("\\(|\\)","",newS);
                                newS        
}


# Summarizing data using MEAN for groups combining [ID_activity , ID_subject]     dim = 180 x 88 
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


# "factorising" the two Ids and applying labels ------------------------------------------------------------------------------------------
# ID_subject
X_summary$ID_subject <- factor(X_summary$ID_subject,
                               , levels = 1:30
                               , labels = paste(rep("subject number",30), as.character(1:30)))

# ID_activity
X_summary$ID_activity <- factor(X_summary$ID_activity,
                               , levels = 1:6
                               , labels = as.character(activities[,2]))

save(X_summary, file="X_summary.txt") # for my use

# ----------- SAVING SUMMARIZED TIDY DATA SET ---------------------------------------------------------------------------------------------

write.table(X_summary, file = "data_tidy_summarized.txt", row.name=FALSE) 


#mynames <- c("bob", "mary", "tom")
#description <- my names
#description <- gsub("o", " the letter o ", description)
#description <- gsub("m", " the letter m ", description)
#codestart <- paste(mynames, description)
#write.table(codestart, "startofcodebook.md")


