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
arch$ccode[arch$idacr == "RUS"] = 365



#COW CODE CORRECTIONS
gattacc$ccode[gattacc$GATTname == "Cote d'ivore"] = 437
gattacc$ccode[gattacc$GATTname == "Hong Kong"] = 991
gattacc$ccode[gattacc$GATTname == "Macao"] = 992

##DATES FOR WTO AND GATT
d = as.Date(gattacc$GATTdate, format = '%m/%d/%y')
gattacc$GATTdate <- as.Date(ifelse(d > Sys.Date(), format(d, "19%y-%m-%d"), format(d)))

#merge target info
data3 <- merge(data2, gattacc, by.x = c("t.ccodeIMP"), by.y = c("ccode"), all.x = T, all.y = F)
colnames(data3)[(ncol(data3)-1):ncol(data3)] = paste("t.",colnames(data3)[(ncol(data3)-1):ncol(data3)], sep = "")

#merge sender info
data3 <- merge(data3, gattacc, by.x = c("s.ccodeIMP"), by.y = c("ccode"), all.x = T, all.y = F)
colnames(data3)[(ncol(data3)-1):ncol(data3)] = paste("s.",colnames(data3)[(ncol(data3)-1):ncol(data3)], sep = "")

##WTO MEMBER DUMMY VARIABLE
t.WTOmem = matrix(NA, nrow(data2), 1)
s.WTOmem = matrix(NA, nrow(data2), 1)

#variables for target
for(i in 1:nrow(data2)){
if(is.na(data2$t.WTOdate[i]) == F){
  t.WTOmem[i] = ifelse(data2$t.WTOdate[i] <= as.Date(data2$P_AD_DATE[i], format = '%m/%d/%y'), 1, 0)
  }
    else{
    paste("Error in row", i)
  }
}

#variables for sender
for(i in 1:nrow(data2)){
  if(is.na(data2$s.WTOdate[i]) == F){
    s.WTOmem[i] = ifelse(data2$s.WTOdate[i] <= as.Date(data2$P_AD_DATE[i], format = '%m/%d/%y'), 1, 0)
  }
  else{
    paste("Error in row", i)
  }
}

##GATT MEMBER DUMMY VARIABLE
t.GATTmem = matrix(NA, nrow(data3), 1)
s.GATTmem = matrix(NA, nrow(data3), 1)

#variables for target
for(i in 1:nrow(data3)){
  if(is.na(data3$t.GATTdate[i]) == F){
    t.GATTmem[i] = ifelse(data3$t.GATTdate[i] <= as.Date(data3$P_AD_DATE[i], format = '%m/%d/%y'), 1, 0)
  }
  else{
    paste("Error in row", i)
  }
}

#variables for sender
for(i in 1:nrow(data3)){
  if(is.na(data3$s.GATTdate[i]) == F){
    s.GATTmem[i] = ifelse(data3$s.GATTdate[i] <= as.Date(data3$P_AD_DATE[i], format = '%m/%d/%y'), 1, 0)
  }
  else{
    paste("Error in row", i)
  }
}

data3$s.GATTmem <- s.GATTmem
data3$t.GATTmem <- t.GATTmem
rm(s.GATTmem)
rm(t.GATTmem)

#save the final product
save.image(file = "adjudication01.rda")

polity$ccode[which(polity$ccode == 316)] = 315
polity$ccode[which(polity$ccode == 260)] = 255

for (i in 1:nrow(data4)){
  if(is.na{
  s.democ.i_IMP[i] = ifelse( ,1,0)
  
}

for(i in 1:nrow(data4)){
  s.democ.i_IMP[i] <- ifelse(data4$s.polity2_IMP[i] >= 6 ,1,0)
  t.democ.i_IMP[i] <- ifelse(data4$t.polity2_IMP[i] >= 6 ,1,0)
}

