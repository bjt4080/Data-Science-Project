
clean<- fread("/Users/benturner/Documents/GitHub/Data-Science-Project/clean1.csv", stringsAsFactors = FALSE)

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


#This part still doens't work

rf2 <-randomForest(SalePrice~ MSSubClass + Lot Area + OverallQual + OverallCond, data=clean, ntree =1000, proximity = TRUE)
