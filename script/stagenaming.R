for (i in 1:NROW(grep("^s.", names(data), value=TRUE))){
  match <- which(colnames(data) == grep("^s.", names(data), value=TRUE)[i])
  colnames(data)[match] = paste(colnames(data)[match], "INV", sep = "")
}

for (i in 1:NROW(grep("^t.", names(data), value=TRUE))){
  match <- which(colnames(data) == grep("^t.", names(data), value=TRUE)[i])
  colnames(data)[match] = paste(colnames(data)[match], "INV", sep = "")
}