test$SalePrice <- rep(NA, 1459)
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
#Given that these have over half the values missing for each, I think it's best if we just get rid of these values instead of assign values for them 
df

