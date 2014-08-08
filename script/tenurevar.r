##Justin W. Nicholson
##Second Year Paper project
##Coding for ARCHIGOS data in dataset
#17/07/2014

library(foreign)
library(countrycode)
library(epicalc)
#Cleanup and preliminaries
detachAllData()                                #detach all previous data - requires epicalc library
setwd("/Users/justinnicholson/documents/academic/projects/2ypaper/data/images")    #set working directory
load("adjudication01.rda")
arch = read.csv("archigos.csv", 
				strip.white = TRUE)

# "t.tenure" is created to hold the tenure calculation. 
# "data" is the dataframe of WTO initiations. $ccode is CoW code, $einitdate is the initiation date, using the date class of variable. 
# "arch" is the dataframe holding the archigos data. I believe the $eoutdate and $eindate come in as strings, and I changed them to the date objects.  

#create vector for the leadership tenure data

t.tenure = matrix(NA,nrow(data),1)

#Loop accomplishes two purposes: 1) find appropriate leader data. 2) calculate leadership tenure. 
for (i in 1:nrow(data)) {
	#Find the current leader in the dataset. "arch" is the archigos dataframe, "data" is the WTO dataframe
	#Appropriate leader is the intersection of countrycode (COW, but can be changed to any appropriate system), and two time inequalities.

	currentleader = which(data$t.ccode[i] == arch$ccode & data$einitdate[i] >= arch$eindate & data$einitdate[i] <= arch$eoutdate)
	
	#Calculate leadership tenure. This works ONLY IF both dates are of the appropriate R date class. 
	tencalc = as.integer(data$einitdate[i] - arch$eindate[currentleader])
	
	#This statement is the ideal: 1 leader is selected, so the tenure calculation returns one value.
	if(length(tencalc)==1){
	t.tenure[i] = tencalc
	
	#This statement handles a null match for the leader.
	} else if(length(tencalc) == 0) {
	t.tenure[i] = NA
	
	#This statement handles the few cases where the WTO initiation date occured on the date of power transfer. Here I chose to use the incoming leader
	#as it seemed that although the old leader probably made the decision, other states actions would be conditioned on a new, inexperienced leader. You can 
	#change this by switching the last inequality in the "currentleader" statement below. 

	} else if(length(tencalc) > 1) {
	currentleader = which(data$t.ccode[i] == arch$ccode & data$einitdate[i] >= arch$eindate & data$einitdate[i] < arch$eoutdate)
	tencalc = as.integer(data$einitdate[i] - arch$eindate[currentleader])
	t.tenure[i] = tencalc
	}

	#Error handling for good measure. This shouldn't be an issue.
	else {
	print("ERROR")
	}
	}