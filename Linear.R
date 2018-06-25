test <- fread("/Users/benturner/Documents/GitHub/Data-Science-Project/test.csv", stringsAsFactors = FALSE)
train<- fread("/Users/benturner/Documents/GitHub/Data-Science-Project/train.csv", stringsAsFactors = FALSE)
#Create a column in test file and feed a dummy value to it
test$SalePrice <- 0
df <- rbind(train,test)
sttest$SalePrice <- rep(NA, 1459)
df<-rbind(train, test)
str(df)
#This is a very basic linear model using only lot's square footage, bedrooms, and month 
linearModel <- lm(SalePrice ~ YrSold + MoSold + LotArea + BedroomAbvGr, data=train)
linearPreds <- data.frame(Id = test$Id, SalePrice= predict(linearModel, test))
write_csv(linearPreds, "sample_submission.csv")
str(linearPreds)
head(linearPreds)
plot(linearPreds)
