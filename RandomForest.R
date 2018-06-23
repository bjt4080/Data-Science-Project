#Random Forest 
library(ggplot2)
library(readr)
library(plyr)
library(dplyr)
library(randomForest)
library(Amelia)
install.packages(mice)
library(caret)
library(xgboost)
train1 <- train[-1]
str(df)
summary(df)
missmap(df, col = c('yellow','black'), legend = F, main= 'Missing   Values')
#Adjusting the missing values
# Pool QC will be replacing the NA values with none
df$PoolQC <-as.character(df$PoolQC)
df$PoolQC[is.na(df$PoolQC)] <- "None"
table(df$PoolQC) ; sort(unique(df$PoolQC))

#Misc Feature
df$MiscFeature <-as.character(df$MiscFeature)
df$MiscFeature[is.na(df$MiscFeature)] <- 'None'
#Basement Exposure
table(df$BsmtExposure) ; str(df$BsmtExposure)
df$BsmtExposure[is.na(df$BsmtExposure)] <- 'No'
any(is.na(df$BsmtExposure))

#Fence 
df$Fence <-as.character(df$Fence)
df$Fence[is.na(df$Fence)] <- 'None'
table(df$Fence)
sort(unique(df$Fence))

#Alley 
df$Alley <-as.character(df$Alley)
df$Alley [is.na(df$Alley)] <- "None"
table(df$Alley)

#FirePlace Quality 
df$FireplaceQu <-as.character(df$FireplaceQu)
df$FireplaceQu[is.na(df$FireplaceQu)] <- "None"
table(df$FireplaceQu)

#Lot Frontage (Linear feet of street connected to property)
summary(df$LotFrontage)
hist(df$LotFrontage)
#I will replace missing values with median value given that Lot Frontage appers to be be noraml distribution
df$LotFrontage[is.na(df$LotFrontage)] <- 68
any(is.na(df$LotFrontage))

#Garage Condition 
table(df$GarageCond)
table(df$GarageQual)
#Will repalce both these values with TA since since the majority are TA
df$GarageCond[is.na(df$GarageCond)] <- "TA"
table(df$GarageCond)
df$GarageQual{is.na(df$GarageQual)} <-"TA"
table(df$GarageQual)

#Garage Finish
summary(df$GarageFinish)
str(df$GarageFinish)
#Will use None as most do not have value
df$GarageFinish <-as.character(df$GarageFinish) 
df$GarageFinish[is.na(df$GarageFinish)] <- 'None'
table(df$GarageFinish)

#Garage Year built
summary(df$GarageYrBlt)
#Will use median to assign NA values
df$GarageYrBlt[is.na(df$GarageYrBlt)] <- 1979
any(is.na(df$GarageYrBlt))
summary(df$GarageYrBlt)

#Garage Type
table(df$GarageType)
#I think I will use the "Attached" because it's the most common occurence
df$GarageType[is.na(df$GarageType)] <- "Attchd"

#Basement Condition
table(df$BsmtCond)
#Will swtich NAs to "TA" since the majority is TA
df$BsmtCond[is.na(df$BsmtCond)] <- 'TA'

#Basement Quality 
table(df$BsmtQual)
#Will switch NAs to "TA since the majority is TA
df$BsmtQual[is.na(df$BsmtQual)] <- 'TA'

#Basement Fin Type 1
table(df$BsmtFinType1)
#Will use None for this since there is not a clear majority
df$BsmtFinType1[is.na(df$BsmtFinType1)] <- 'None'

#Basement Fin Type 2
table(df$BsmtFinType2)
#Will use Unfinished since that is large majority of data
df$BsmtFinType2[is.na(df$BsmtFinType2)] <- 'Unf'
table(df$BsmtFinType2)

#MassVnr Type 
table(df$MasVnrType)
#Will replace with "None:
df$MasVnrType[is.na(df$MasVnrType)] <- 'None'

#MassVnr Area
summary(df$MasVnrArea)
#Will use '0' as majority of values are this
df$MasVnrArea[is.na(df$MasVnrArea)] <- '0'

#MS Zoning
table(df$MSZoning)
#Will use "RL" as majority of points are this
df$MSZoning[is.na(df$MSZoning)] <- 'RL'

#Utiliies 
table(df$Utilities)
#Will use 'AllPub' as all but one value are this
df$Utilities[is.na(df$Utilities)] <- 'Allpub'

#BsmtFinSF1
summary(df$BsmtFinSF1)
#Will use 0 since not all houses have basements
df$BsmtFinSF1[is.na(df$BsmtFinSF1)] <- '0'

#BsmFinSF2
summary(df$BsmtFinSF2)
#Will use 0 since not all houses have basements
df$BsmtFinSF2[is.na(df$BsmtFinSF2)] <- '0'

#BsmtFinsType1
table(df$BsmtFinType1)
#Will use 0 since not all houses have basements
df$BsmtFinType1[is.na(df$BsmtFinType1)] <- '0'

#BsmtFinsType2
table(df$BsmtFinType2)
#Will use 0 since not all houses have basements
df$BsmtFinType2[is.na(df$BsmtFinType2)] <- '0'

#Mason Veneer
table(df$MasVnrType)
#Will replace with none as that is majority of values
df$MasVnrType[is.na(df$MasVnrType)] <- 'None'

#Exterior1st
table(df$Exterior1st)
#Will replace with None
df$Exterior1st[is.na(df$Exterior1st)] <- 'VinylSd'

#Exterior2nd 
table(df$Exterior2nd)
#Will replace with "VinySD" as most popular
df$Exterior2nd[is.na(df$Exterior2nd)] <- 'VinylSd'

#Basement Unit Square Feet
summary(df$BsmtUnfSF)
#Replace with None
df$BsmtUnfSF[is.na(df$BsmtUnfSF)] <- 'None'

#Total Basement Square Feet
summary(df$TotalBsmtSF)
#Repalce with None
df$TotalBsmtSF[is.na(df$TotalBsmtSF)] <- 'None'

#Electrical 
table(df$Electrical)
#Will use 'SBrkr' 
df$Electrical[is.na(df$Electrical)] <- 'SBrkr'

#BasementFullBath
table(df$BsmtFullBath)
#Will replace with '0'
df$BsmtFullBath[is.na(df$BsmtFullBath)] <- '0'

#BasementHalfBath
table(df$BsmtHalfBath)
#Will replace with '0'
df$BsmtHalfBath[is.na(df$BsmtHalfBath)] <- '0'

#Kitchen Quality
table(df$KitchenQual)
#Will replace with TA
df$KitchenQual[is.na(df$KitchenQual)] <- 'TA'

#Functional
table(df$Functional)
#Will replace with TA
df$Functional[is.na(df$Functional)] <- 'Typ'

#Garage Cars
summary(df$GarageCars)
#Will replace with 2 since it's median
df$GarageCars[is.na(df$GarageCars)] <- '2'

#Garage Area
summary(df$GarageArea)
#Will replace with 480 since it's median
df$GarageArea[is.na(df$GarageArea)] <- '480'

#Garage Quality
summary(df$GarageQual)
#Will replace with 'TA'
df$GarageQual[is.na(df$GarageQual)] <- 'TA'

#Sale Type
summary(df$SaleType)
#Will use 'WD' 
df$SaleType[is.na(df$SaleType)] <- 'WD'

#Sale Price
summary(df$SalePrice)
#Will use '163000'
df$SalePrice[is.na(df$SalePrice)] <- '163000'

#So now that we have all the missing variabes addressed, we will want to change all character variables into factor variables
for(i in colnames(df[,sapply(df, is.character)])){
  df[,i] <- as.factor(df[,i])
}

#Swtich year sold (YrSold) from integer to factor
df$YrSold <- as.factor(df$YrSold)
df$MoSold <- as.factor(df$MoSold)
df$MSSubClass <- as.factor(df$MSSubClass)

#Use mice to impute values
library(mice)
raw_data <- mice(df, m=3, method='cart', maxit=1)


df <- complete(raw_data)

#Confirm that all missing values are accounted for
any(is.na(df))

#Now we will split the data set between train and test
df_train <- df[1:1460,]
df_test <- df[1461:2919,]
library(e1071)
insinstall.packages("caTools")
library(caTools)

set.seed(40)

# create a split ratiom, after looking it does look like 70% was a good ratio to use for train
samples <- sample.split(df_train$SalePrice,SplitRatio = 0.7)
s_train <- subset(df_train,samples == TRUE)
s_test <- subset(df_train, samples == FALSE)

#rpart!
fit <- rpart(SalePrice ~ LotArea + YearBuilt + Condition1 + FullBath + BedroomAbvGr + TotRmsAbvGrd
             ,data = train)
plot(fit, uniform = TRUE)
text(fit, cex=.6)
model <- rpart(SalePrice ~., data = train, method = "anova")
rf <- randomForest(SalePrice~.,data=train,ntree=1000,proximity=TRUE)
