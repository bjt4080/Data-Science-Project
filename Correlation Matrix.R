#Using R Caret
colnames(df)
df <- as.data.frame(unclass(df))
library(data.table)
dt <-as.data.table(df)
dt <-dt[,lapply(.SD, as.numeric)]


attach(dt)
correlationMatrix <- cor(dt[,1:80])
print(correlationMatrix)
highcorrelation <- findCorrelation(correlationMatrix, cutoff = 0.5) #This is where I got the error
Error in if (x[i, j] > cutoff) { : missing value where TRUE/FALSE needed


  
  
  