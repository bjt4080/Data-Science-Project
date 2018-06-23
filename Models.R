model1 <- randomForest(SalePrice ~ LotArea + OverallQual + YearBuilt + TotRmsAbvGrd, 
                      data = train)
predicted_prices <- predict(model1, newdata = test)
head(predicted_prices)

model2 <- rpart(SalePrice ~ OverallQual + YearBuilt + TotRmsAbvGrd, 
                data = train)
predicted_prices <- predict(model2, newdata = test)
head(predicted_prices)


