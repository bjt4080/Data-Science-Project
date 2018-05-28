#Converting Character variabes into factors
df <- fread("/Users/benturner/housetest.csv")
str(df)
#use ColClasses to avoid warning from fread
df <- fread("/Users/benturner/housetest.csv",colClasses = c("MiscFeature"='character','PoolQC'='character'))
df <- fread("/Users/benturner/housetrain.csv",colClasses = c("MiscFeature"='character','PoolQC'='character'))
colnames(df)
summary(df$SalePrice)
#To unclass all data 
df <- as.data.frame(unclass(df))
str(df) #shows that data is now coverted from character to factors