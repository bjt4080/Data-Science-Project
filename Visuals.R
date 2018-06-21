#Doing some visualization with the data
plot(SalePrice~YearBuilt, data=train, xlab="Year Built", ylab="Sale Price", grid=FALSE, col="green")
abline(lm(SalePrice~YearBuilt), col="red") #Added simple regression line
lines(lowess(SalePrice~YearBuilt), col="blue") #lowess line
boxplot(SalePrice, YearBuilt, data=train, xlab="Year Built", ylab="Sale Price")

plot(SalePrice~OverallCond, data=train, xlab="Overall Condition", ylab = "Sale Price", main = "Does Condition effect Price?", col="blue")
