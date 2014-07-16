################################################################################
# Justin W. Nicholson
# Second Year Paper Project
# Constructed variables file
# This script handles construction of variables for the 2YP project. 
# all matching done by CoW codes. Some are user-defined as nessecary.
################################################################################


#Libraries
library(foreign)
library(countrycode)
library(epicalc)
#Cleanup and preliminaries
detachAllData()                                #detach all previous data - requires epicalc library
setwd("/Users/justinnicholson/documents/academic/projects/2ypaper/data/images")    #set working directory
load("adjudication.rda")

for (i in 1:nrow(data)){
  data$prevint[i] = ifelse(length(which(data$t.ccode == data$t.ccode[i] & data$chal == 1 & data$i.date<data$i.date[i])) == 0,0,1)             
}

t.tenure = matrix(NA,nrow(data),1)

for (i in 1:nrow(data)){
  yourvector[i] = ifelse(length(which(arch$ccode == data$t.ccode[i] & arch$eindate <= data$cdate[i] & data$cdate[i] <= arch$eoutdate)>0),
                         which(arch$ccode == data$t.ccode[i] & arch$eindate <= data$cdate[i] & data$cdate[i] <= arch$eoutdate),NA)
  t.tenure[i] = data$cdate[i] - arch$eindate[yourvector[i]]
}

yourvector = which( data$t.ccode == arch$ccode & x>=your.number)
x[yourvector[which(abs(x[yourvector]-your.number) == min(abs(x[yourvector]-your.number)))]]


arch$ccode[arch$idacr == "GFR"] = 255

#save the final product
save.image(file = "adjudication.rda")

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

#difference in sets
setdiff(as.vector(backup.frame$CASE_ID), as.vector(suspect.frame$CASE_ID))