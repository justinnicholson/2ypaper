################################################################################
# Justin W. Nicholson
# Second Year Paper Project
# Load data from IMF World Dev Indicators
# This script handles files downloaded in CSV format, using "list" option rather than "dataset" option
# NOTE: Dataset option requires reformatting data
# all matching done by CoW codes. Some are user-defined as nessecary.
################################################################################

#Libraries
library(foreign)
library(countrycode)
library(epicalc)
#Cleanup and preliminaries
detachAllData()                                #detach all previous data - requires epicalc library
setwd("~/Dropbox/Academic/2YP/data/")    #set working directory
load("adjudication.rda")
old.data = data
#load and attach current data

#Data options - user input needed here
#csv is the name of the file to be imported and combined. Must be saved in /data folder
csv.name = "agpgdp"                                     #name of file WITHOUT extension attached.
csv.data = read.csv(paste(csv.name,".csv", sep = ""))   # Don't touch this line

#merging and cleaning

#list of states to drop from dataset - insert iso codes for all nonrelevant states here
drop = c("ABW",
         "ADO",
         "ASM",
         "BMU",
         "CHI",
         "CUW",
         "CYM",
         "GRL",
         "GUM",
         "IMY",
         "MAF",
         "SXM",
         "MNP",
         "NCL",
         "PRI",
         "PRK",
         "PYF",
         "TCA",
         "TMP",
         "VIR",
         "WBG",
         "ZAR", 
         "FRO", 
         "KSV"
  )

#remove states with iso codes listed above
csv.data = csv.data[!csv.data$iso %in% drop,]

#match country codes
csv.data$ccode = countrycode(csv.data$iso, origin = "iso3c", destination = "cown", warn = TRUE)
#data cleaning
csv.data$ccode[csv.data$iso == "SRB"] = 345
csv.data$ccode[csv.data$iso == "ROM"] = 360
csv.data$ccode[csv.data$iso == "MAC"] = 992
csv.data$ccode[csv.data$iso == "HKG"] = 991
csv.data$ccode[csv.data$iso == "EUU"] = 994

#data merging
drop = c("country", "iso")
csv.data = csv.data[,!colnames(csv.data) %in% drop]
#sender info
old.data2 = merge(old.data, csv.data, by.x = c("i.date", "s.ccode"), by.y = c("year", "ccode"), all.x = T, all.y = F)
colnames(old.data2)[ncol(old.data2)] = paste("s.",colnames(old.data2)[ncol(old.data2)], sep = "")

#target info
old.data2 = merge(old.data2, csv.data, by.x = c("i.date", "t.ccode"), by.y = c("year", "ccode"), all.x = T, all.y = F)
colnames(old.data2)[ncol(old.data2)] = paste("t.",colnames(old.data2)[ncol(old.data2)], sep = "")

#data cleanup
data <- old.data2
rm(list=c("old.data", "old.data2", "csv.name", "drop"))

#save the final product
save.image(file = "adjudication.rda")

#one off code - do not worry about this
old.data$t.ccode[old.data$INV_CTY_NAME == "Serbia"] = 345
old.data$t.ccode[old.data$INV_CTY_NAME == "Serbia and Montenegro"] = 345
old.data$t.ccode[old.data$INV_CTY_NAME == "Montenegro"] = 341
old.data$INV_CTY_NAME[old.data$t.ccode == 52] = "Trinidad and Tobago"
data$t.ccode[data$INV_CTY_NAME == "East Germany"] = 265

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
