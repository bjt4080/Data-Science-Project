
clean <- fread("/Users/benturner/clean1.csv", stringsAsFactors = FALSE)


model <- rpart(SalePrice ~.,data = clean, method = "anova")
predict1 <- predict(model, clean)
summary(predict1)
library(caret)
postResample(predict1, clean$SalePrice)



