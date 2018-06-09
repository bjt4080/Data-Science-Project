train <- read.csv("~/Documents/GitHub/Data-Science-Project/train.csv", stringsAsFactors = FALSE )
train$SalePrice <-log(train$SalePrice)
test <- read.csv("~/Documents/GitHub/Data-Science-Project/test.csv", stringsAsFactors = FALSE )
combined<-rbind(train[, -81], test) #combining the data sets
combined<-combined[, -1] 
#View # of missing values per variable
missing_ct<-colSums(apply(X = combined, MARGIN = 2, is.na))
missing_ct[which(missing_ct > 0)]
print(paste("There are ", length(missing_ct[which(missing_ct > 0)]), " variables have NAs."))
print(paste("Total number of NAs:", sum(missing_ct)))
