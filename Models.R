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
plot(linearModel1)
summary(linearModel1)


#Next we will use rpart as part of the caret package to complete the model
model <- rpart(SalePrice ~.,data = clean, method = "anova")
predict1 <- predict(model, clean)
summary(predict1)
library(caret)
postResample(predict1, clean$SalePrice)


fit <- rpart(SalePrice ~ LotArea + YearBuilt + Condition1 + FullBath + BedroomAbvGr + TotRmsAbvGrd
             ,data = clean)
plot(fit, uniform = TRUE)
text(fit, cex=.6)
model <- rpart(SalePrice ~., data = clean, method = "anova")
#Changing Characters into Factors as it Random Forest won't work with characters
clean <- clean %>% mutate_if(is.character,as.factor)
#Random Forest
#First we have to make it so the the columns in R don't start with numbers, so I'll change
names(clean) <- make.names(names(clean))
#Then we have to change the # of categorial bc RF cannot hanlde over 53
clean <- clean %>% mutate_if(is.character,as.factor)
#This didn't work, so I'll try to change them into integers
clean <- clean %>% mutate_if(is.factor,as.integer)

#Random Forest using the updated clean data
rf1 <- randomForest(SalePrice~.,data=clean, ntree=1000,proximity=TRUE)
varImpPlot(rf1)
predict_rf<-predict(rf1, clean) #Prediction
head(predict_rf)
summary(predict_rf)
postResample(predict_rf, clean$SalePrice) #This tests our model, look at r^2


sub = subset(clean, select = -c(clean$BsmtUnfSF, clean$TotalBsmtSF))
library(dplyr)
mydata2 = clean[,!grepl("BsmtUnfSF", "TotalBsmtSF",names(clean))]

#Now we will try to make the RandomForest work.
rf2 <- randomForest(SalePrice ~., data = mydata2, method = "anova")
varImpPlot(rf2)
prediction<-predict(rf2, clean) #Prediction
head(prediction)
summary(prediction)
postResample(prediction, clean$SalePrice) #This tests our model, look at r^2 to determine accuracy
