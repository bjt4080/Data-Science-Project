#Doing some visualization with the data
scatterplot(dt$SalePrice ~ dt$YearBuilt, data=train,  xlab="dt$Year Built", ylab="Sale Price", grid=FALSE)
boxplot(dt$SalePrice ~ dt$YearBuilt, data=train,  xlab="dt$Year Built", ylab="Sale Price", grid=FALSE)

