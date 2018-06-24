test <- fread("/Users/benturner/Documents/GitHub/Data-Science-Project/test.csv", stringsAsFactors = FALSE)
train<- fread("/Users/benturner/Documents/GitHub/Data-Science-Project/train.csv", stringsAsFactors = FALSE)
#Create a column in test file and feed a dummy value to it
test$SalePrice <- 0
df <- rbind(train,test)
sttest$SalePrice <- rep(NA, 1459)
df<-rbind(train, test)
str(df)
#We can use the package Amelia to visualize what is missing and what values those are
missmap(train)
#Now we will do the same for the test set
misssmap(test)
#Next we will get the values that are missing
sapply(df[,1:80], function(x) sum(is.na(x))) 
#As we can see, the largest features with missing are vavlues are: 
summary(PoolQC)
summary(SalePrice)
summary(GarageArea)
summary(Fence)
summary(FireplaceQu)


