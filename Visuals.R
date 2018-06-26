#Doing some visualization with the data
train<- fread("/Users/benturner/train.csv", stringsAsFactors = FALSE)

plot(SalePrice~YearBuilt, data=train, xlab="Year Built", ylab="Sale Price", grid=FALSE, col="green")
abline(lm(SalePrice~YearBuilt), col="red") #Added simple regression line
lines(lowess(SalePrice~YearBuilt), col="blue") #lowess line
boxplot(SalePrice~YearBuilt, data=train, xlab="Year Built", ylab="Sale Price", col="green")
#Plotting Condition Vs. Price
plot(SalePrice~OverallCond, data=train, xlab="Overall Condition", ylab = "Sale Price", main = "Does Condition effect Price?", col="blue")
#Plotting Sq Foot Vs. Price
plot(SalePrice~GrLivArea, data=train, xlab="Sq. Footage", ylab = "Sale Price", main = "Sq Footage Affect?", col="blue")

plot(SalePrice~GarageArea, data=train, xlab="Garage Area", ylab = "Sale Price", main = "Garage Area", col="red")

plot(SalePrice~YrSold, data=train, xlab="Year Sold", ylab = "Sale Price", main = "Year Sold", col="green")
plot(SalePrice~TotRmsAbvGrd, data=train, xlab="Total Rooms", ylab = "Sale Price", main = "Total Rooms", col="purple")
