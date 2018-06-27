library(data.table)
library(randomForest)
library(caret)
library(ggplot2)
library(rpart)
library(DataExplorer)


test <- fread("/Users/benturner/test.csv", stringsAsFactors = FALSE)
train<- fread("/Users/benturner/train.csv", stringsAsFactors = FALSE)
clean<- fread("/Users/benturner/clean1.csv", stringsAsFactors = FALSE)

plot_correlation(choco, type = 'continuous','Review.Date')plot_str(clean)
plot_str(train) #Look at our variables
plot_density(train) #Look at variables in denisty plots
plot_correlation(clean, type = 'continuous','clean$SalePrice') #Look at correlation to this variables
create_report(clean) #This gives us a printable report in HTML that allows us to look at the data

