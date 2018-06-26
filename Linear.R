test <- fread("/Users/benturner/test.csv", stringsAsFactors = FALSE)
train<- fread("/Users/benturner/train.csv", stringsAsFactors = FALSE)
clean<- fread("/Users/benturner/clean1.csv", stringsAsFactors = FALSE)

#Create a column in test file and feed a dummy value to it
test$SalePrice <- 0
df <- rbind(train,test)
test$SalePrice <- rep(NA, 1459)
df<-rbind(train, test)

#This is a very basic linear model using only lot's square footage, bedrooms, and month 
linearModel <- lm(SalePrice ~ YrSold + MoSold + LotArea + BedroomAbvGr, data=df)
linearPreds <- data.frame(Id = df$Id, SalePrice= predict(linearModel, df))
str(linearPreds)
head(linearPreds)
summary(linearModel)


#Now let's replace the df dataset with the clean dataset:
linearModel1 <- lm(SalePrice~., data=clean)
linearPreds1 <- data.frame(Id = clean$Id, SalePrice= predict(linearModel, clean))
str(linearPreds1)
head(linearPreds1)
plot(linearPreds1)
summary(linearModel1)



