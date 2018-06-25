#Now we will split the data set between train and test
test <- fread("/Users/benturner/Documents/GitHub/Data-Science-Project/test.csv", stringsAsFactors = FALSE)
train<- fread("/Users/benturner/Documents/GitHub/Data-Science-Project/train.csv", stringsAsFactors = FALSE)
#Create a column in test file and feed a dummy value to it
test$SalePrice <- 0
df <- rbind(train,test)
sttest$SalePrice <- rep(NA, 1459)
df<-rbind(train, test)

df_train <- df[1:1460,]
df_test <- df[1461:2919,]


set.seed(40)

# create a split ratiom, after looking it does look like 70% was a good ratio to use for train
samples <- sample.split(df_train$SalePrice,SplitRatio = 0.7)
s_train <- subset(df_train,samples == TRUE)
s_test <- subset(df_train, samples == FALSE)

#rpart!
fit <- rpart(SalePrice ~., data = df_train, method = "anova")
plot(fit, uniform = TRUE)
text(fit, cex=.6)

predict <- predict(fit,test)
head(predict)
tail(predict)
varImp(fit)
