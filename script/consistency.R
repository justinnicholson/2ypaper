################################################################################
# Justin W. Nicholson
# Second Year Paper Project
# Consistency checker
# This script handles comparison between two data frames
# checking for unintentional data editing and errors. 
# all matching done by CoW codes. Some are user-defined as nessecary.
################################################################################
consistency = function(backup.frame, suspect.frame){
  inconsistent = NULL
#ROW CONSISTENCY
#Check for observation consistency between sets based on user set unique key. 
#Right now this is limited to one variable.
obsdel = setdiff(as.vector(backup.frame$CASE_ID), as.vector(suspect.frame$CASE_ID))
obsadd = setdiff(as.vector(suspect.frame$CASE_ID), as.vector(backup.frame$CASE_ID))
if (length(obsdel) > 0){
  cat("These observations have been dropped in new data:", obsdel, sep = '\n')
}else if(length(obsadd) > 0){
  cat("These observations have been added in new data:", obsadd, sep = '\n')
}else {cat("Observations match")
}

#code for proper subsetting should go here
#change hardcoded backup / suspect to whichever is longer dynamically.
rowinter = intersect(as.vector(suspect.frame$CASE_ID), as.vector(backup.frame$CASE_ID))

#Row subset
backup.subset = backup.frame[backup.frame$CASE_ID %in% rowinter,]

#COLUMN CONSISTENCY
coldel = setdiff(as.vector(colnames(backup.frame)), as.vector(colnames(suspect.frame)))
coladd = setdiff(as.vector(colnames(suspect.frame)), as.vector(colnames(backup.frame)))
colinter =as.matrix(intersect(as.vector(colnames(suspect.frame)), as.vector(colnames(backup.frame))))

if (length(coldel) > 0){
  cat("These variables have been dropped or changed in new data:", coldel, sep = '\n')
}else if(length(coladd) > 0){
  cat("These variables have been added or changed in new data:", coladd, sep = '\n')
}else {cat("variable names match")
}

#Column subset
suspect.subset = suspect.frame[,colnames(suspect.frame) %in% colinter]
backup.subset = backup.subset[,colnames(backup.subset) %in% colinter]
#DATA CONSISTENCY
#change hard coded 'colinter' to dynamically changing variable. Also check colinter call
sordered = suspect.subset[order(suspect.subset$CASE_ID), ]
bordered = backup.subset[order(backup.subset$CASE_ID), ]


for (i in 1:nrow(colinter)){
  oldloc = match(colinter[i], colnames(backup.subset))
  newloc = match(colinter[i], colnames(suspect.subset))

 if (any(is.na(sordered)) == F & any(is.na(bordered)) == F){
  if(prod(as.vector(sordered[,newloc]) == as.vector(bordered[,oldloc])) == 1){
cat("Column",i, "matches", '\n')
  } else{
    cat("Column",colnames(colinter[i]), "does not match. Location saved")
    inconsistent = append(inconsistent, colinter[i])
}

}else{
  sorderedmod = sordered
  sorderedmod = sorderedmod[which(is.na(sorderedmod[,newloc])), newloc] == c("NA")
  borderedmod = bordered
  borderedmod = borderedmod[which(is.na(borderedmod[,oldloc])), oldloc] == c("NA")
  if(prod(toString(sordered[,newloc]) == toString(bordered[,oldloc])) == 1){
    cat("Column",i, "matches", '\n')
    }else{
      cat("Column",i, "does not match. Location saved", '\n')
   inconsistent = cbind(inconsistent, c(colinter[i]),newloc, oldloc, i)
     }
}
}

#SHOW INCONSISTENCIES
for(j in 1:nrow(inconsistent)){
show = as.vector(which(sordered[,as.integer(inconsistent[j,2])] != bordered[,as.integer(inconsistent[j,3])]))
for (k in 1:NROW(show)){
cat("row", show[k] ,'\n', "difference in variable", inconsistent[j,1], '\n',
    toString(sordered[show[k],as.integer(inconsistent[j,2])]),
    "v.s.", 
    toString(bordered[show[k],as.integer(inconsistent[j,3])]), '\n \n')
}
}
return(show)
}
#CLEANUP
#rm(obsdel, obsadd, coldel, coladd, colinter, backup.subset, data.subset, suspect.subset, borderedmod, i, k, inter, newloc, oldloc, sorderedmod, bordered)
