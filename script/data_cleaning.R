################################################################################
#Housekeeping!!
################################################################################

#Load required libraries - this list just keeps growing
library(epicalc)
library(foreign)
library(maxLik)
library(foreign)
library(MASS)

#Cleanup
rm(list=ls())                                 #remove all variables
detachAllData()                                #detach all previous data - requires epicalc library
setwd("C:/Users/jnicho14/Dropbox/Academic/2YP/Data/GAD/CSV") 
setwd("~/Dropbox/Academic/2YP/Data/GAD/CSV")    #set working directory

#load and attach data
EU = as.data.frame(read.csv("EU.csv"))
USA = as.data.frame(read.csv("USA.csv"))
CHN = as.data.frame(read.csv("CHN.csv"))
TWN = as.data.frame(read.csv("TWN.csv"))
IND = as.data.frame(read.csv("IND.csv"))

EU =  EU[,1:26]
USA = USA[,1:26]
CHN = CHN[,1:26]
TWN = TWN[,1:26]
IND = IND[,1:26]

#make correction for weird obs count - check this for all
EU =  EU[1:749,]
USA =  USA[1:1256,]
IND = IND[1:1:667,]

#Combine and standardize names - this reflects decisions made using CoW
CMB = rbind(CHN, EU, IND, TWN, USA)
CMB$ctarget = countrycode(CMB$INV_CTY_CODE, "iso3c", "cown", warn = TRUE)
CMB$ctarget[CMB$INV_CTY_CODE == "GDR"] = 265
CMB$ctarget[CMB$INV_CTY_CODE == "HKG"] = 991
CMB$ctarget[CMB$INV_CTY_CODE == "MAC"] = 992
CMB$ctarget[CMB$INV_CTY_CODE == "FRO"] = 993
CMB$ctarget[CMB$INV_CTY_CODE == "SCG"] = 347
CMB$ctarget[CMB$INV_CTY_CODE == "USR"] = 364
CMB$ctarget[CMB$INV_CTY_CODE == "YUG"] = 345
CMB$ctarget[CMB$INV_CTY_CODE == "KAZ"] = 705
CMB$ctarget[CMB$INV_CTY_CODE == "CSV"] = 315
CMB$ctarget[CMB$INV_CTY_CODE == "FRG"] = 260




