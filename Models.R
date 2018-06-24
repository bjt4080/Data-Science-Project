model1 <- randomForest(SalePrice ~ LotArea + OverallQual + YearBuilt + TotRmsAbvGrd, 
                      data = train)
predicted_prices <- predict(model1, newdata = test)
head(predicted_prices)

model2 <- rpart(SalePrice ~ OverallQual + YearBuilt + TotRmsAbvGrd, 
                data = train)
predicted_prices <- predict(model2, newdata = test)
head(predicted_prices)

Error in na.fail.default(list(SalePrice = c(NA, NA, NA, NA, NA, NA, NA,  : 
                                              missing values in object