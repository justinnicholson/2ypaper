################################################################################
# Justin W. Nicholson
# Second Year Paper Project
# Consistency checker
# This script handles comparison between two data frames
# checking for unintentional data editing and errors. 
# all matching done by CoW codes. Some are user-defined as nessecary.
################################################################################

#ROW CONSISTENCY
#Check for observation consistency between sets based on user set unique key. 
#Right now this is limited to one variable.
obsdel = setdiff(as.vector(backup.frame$CASE_ID), as.vector(suspect.frame$CASE_ID))
obsadd = setdiff(as.vector(suspect.frame$CASE_ID), as.vector(backup.frame$CASE_ID))
if (length(obsdel) > 0){
  cat("These observations have been dropped in new data:", obsdel, sep = '\n')
}else if(length(obsadd) > 0){
  cat("These observations have been added in new data:", obsadd, sep = '\n')
}else cat("Observations match")
}

#COLUMN CONSISTENCY