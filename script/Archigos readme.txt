#Justin W. Nicholson
#Second Year Paper project
#17/07/2014
#Archigos Coding



##Coding for ARCHIGOS data in dataset

#Problems:
No data for Europe
Data only goes up to 2004


##Coding agenda:
Match based on CoW code and leader enter/exit date. (This is the unique key for this dataset)


#ccode must match ccode
#INIT date must be less than leader exit date (if leader is still in office this is not applicable)
#INIT date must be greater than leader enter date. (always applicable)

#Procedure based on agenda
1.) subset data to 2009 and before.
2.) in match require ccode = ccode
3.) require that INIT date must be greater than leader enter date.
4.) require that INIT date must be less than leader exit date unless leader still in office

