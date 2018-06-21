df <- fread("/Users/benturner/housetest.csv")
str(df)
#use ColClasses to avoid warning from fread
df <- fread("/Users/benturner/housetest.csv",colClasses = c("MiscFeature"='character','PoolQC'='character'))
df <- fread("/Users/benturner/housetrain.csv",colClasses = c("MiscFeature"='character','PoolQC'='character'))
colnames(df)
summary(df$SalePrice)
#To unclass all data 
missmap(df[,1:80],
str(df) #shows that data is now coverted from character to factors
library(data.table)
dt <- as.data.table(df) #converts data.frame into data.tableic)] #converts data.table into numeric
dt <- dt[,lapply(.SD, as.numeric)] #converts all columns to numeric
Warning message:
  In lapply(.SD, as.numeric) : NAs introduced by coercion

