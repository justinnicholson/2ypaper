################################################################################
#Housekeeping!!
################################################################################

#Load required libraries - this list just keeps growing
library(epicalc)
library(foreign)
library(maxLik)
library(foreign)
library(ggplot2)
library(MASS)
library(mlogit)
library(games)

#Cleanup
rm(list=ls())                                 #remove all variables
detachAllData()                                #detach all previous data - requires epicalc library
setwd("~/Dropbox/Academic/2YP/Data/GAD/CSV")    #set working directory
#load and attach data
EU = read.csv("EU.csv")
USA = read.csv("USA.csv")
CHN = read.csv("CHN.csv")
TWN = read.csv("TWN.csv")
IND = read.csv("IND.csv")

CMB = smartbind(EU, USA)
CMB = smartbind(CMB, TWN)
CMB = smartbind(CMB, IND)
CMB = CMB[,1:26]
