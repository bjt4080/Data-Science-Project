model1 <- randomForest(SalePrice ~ LotArea + OverallQual + YearBuilt + TotRmsAbvGrd, 
                      data = train)
predicted_prices <- predict(model1, newdata = test)
head(predicted_prices)

model2 <- rpart(SalePrice ~ OverallQual + YearBuilt + TotRmsAbvGrd, 
                data = train)
predicted_prices <- predict(model2, newdata = test)
head(predicted_prices)

fit <- randomForest(SalePrice ~ Neighborhood + MSSubClass + MSZoning + Street + YearBuilt + 
                      LotShape + LandContour + Utilities + LotConfig + LandSlope + Condition1 + Condition2 + 
                      BldgType + HouseStyle + OverallQual + OverallCond + RoofStyle + RoofMatl + Exterior1st + 
                      Exterior2nd + MasVnrType + ExterQual + ExterCond + Foundation + BsmtQual + BsmtCond + 
                      BsmtExposure + BsmtFinType1 + BsmtFinType2 + Heating + HeatingQC + CentralAir + Electrical + 
                      KitchenQual + Functional + GarageType + GarageFinish + GarageQual + GarageCond + PavedDrive +
                      SaleCondition + SaleType + LotArea + MasVnrArea + BsmtFinSF1 + 
                      BsmtFinSF2 + BsmtUnfSF + TotalBsmtSF + BsmtFullBath + BsmtHalfBath + 
                      FullBath + HalfBath + BedroomAbvGr + KitchenAbvGr + TotRmsAbvGrd + GarageCars + GarageArea + 
                      WoodDeckSF + OpenPorchSF + EnclosedPorch + ScreenPorch + PoolArea + 
                      MoSold + YrSold, 
                    data=train, importance=TRUE, ntree=2000)


Error in na.fail.default(list(SalePrice = c(NA, NA, NA, NA, NA, NA, NA,  : 
                                              missing values in object
