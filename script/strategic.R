library(games)
test = read.csv("test.csv")

concede2 = concede
concede2[concede == 1] = 0
concede2[concede == 2 | concede == 3] = 1
concede3[concede2 == 1 & ruling == 0] = 0
concede3[concede2 == 1 & ruling == 1] = 1
concede3[concede2 == 0 & ruling == 1] = 2
test3 = cbind(ldc1, ldc2, disc, admit, tradep2, disc, rulp, gdprat, tradep1, many, ruld, concede3)
test3 = as.data.frame(test3)
test3 = na.omit(test3)
f1 = concede3 ~ ldc1 + ldc2 + disc + admit | 0 | tradep2 + disc + rulp + gdprat | tradep1 + many + ruld
f2 = concede3 ~ ldc1 + ldc2 + disc + admit | 0 | tradep2 + disc +  rulp + gdprat | tradep1 + many + ruld + rulp
m3 = egame12(f2, data = test3[test$panel == 1])

#second attempt - remember to subset data to remove panel = 1 and ruling = 0
concede2 = concede
concede2[concede == 1] = 0
concede2[concede == 2 | concede == 3] = 1

concede3[panel ==0] = 0
concede3[panel ==1 & concede2 == 1 & ruling == 1] = 1
concede3[panel ==1 & concede2 == 0 & ruling == 1] = 2
test2 = subset(test,!(panel == 1 & ruling ==0))
test3 = cbind(ldc1, ldc2, disc, admit, tradep2, disc, rulp, gdprat, tradep1, many, ruld, concede3)
test3 = as.data.frame(test3)
test3 = na.omit(test3)
f1 = concede3 ~ ldc1 + ldc2 + disc + admit | 0 | tradep2 + disc + rulp + gdprat | tradep1 + many + ruld
f2 = concede3 ~ ldc1 + ldc2 + disc + admit | 0 | tradep2 + disc +  rulp + gdprat | tradep1 + many + ruld + rulp
m3 = egame12(f2, data = test3)
