
clean<- fread("/Users/benturner/clean1.csv", stringsAsFactors = FALSE)
train<- fread("/Users/benturner/train.csv", stringsAsFactors = FALSE)
set.seed(40)


#rpart!
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
rf1 <- randomForest(SalePrice~.,data=clean, ntree=1000,proximity=TRUE)
varImpPlot(rf1)
predict_rf<-predict(rf1, clean) #Prediction
head(predict_rf)
summary(predict_rf)

sub = subset(clean, select = -c(clean$BsmtUnfSF, clean$TotalBsmtSF))
library(dplyr)
mydata2 = clean[,!grepl("BsmtUnfSF", "TotalBsmtSF",names(clean))]

#Now we will try to make the RandomForest work.

rf2 <- randomForest(SalePrice ~., data = mydata2, method = "anova")
varImpPlot(rf2)
prediction<-predict(rf2, clean) #Prediction
head(prediction)
summary(prediction)

