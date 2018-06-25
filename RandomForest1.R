test <- fread("/Users/benturner/Documents/GitHub/Data-Science-Project/test.csv", stringsAsFactors = FALSE)
train<- fread("/Users/benturner/Documents/GitHub/Data-Science-Project/train.csv", stringsAsFactors = FALSE)
combi <- rbind(train[,-81], test)
which(colSums(sapply(combi, is.na)) !=0)

variables <- names(train)
variables <- variables[variables != "SalePrice"]
print(variables)
for(variable in variables)
{
  if(any(is.na(train[[variable]])))
  {
    print(paste(variable,"-",class(train[[variable]])))
    if(is.character(train[[variable]]))
    {
      train[[variable]][is.na(train[[variable]])] <- "Missing"
    }
    else
    {
      train[[variable]][is.na(train[[variable]])] <- mean(train[[variable]],na.rm=TRUE)
    }
  }
  if(any(is.na(test[[variable]])))
  {
    if(is.character(test[[variable]]))
    {
      test[[variable]][is.na(test[[variable]])] <- "Missing"
    }
    else
    {
      test[[variable]][is.na(test[[variable]])] <- mean(test[[variable]],na.rm=TRUE)
    }
  }
}

# Deal with factors
for(variable in variables)
{
  if(is.character(train[[variable]]))
  {
    levels <- sort(unique(c(train[[variable]],test[[variable]])))
    train[[variable]] <- factor(train[[variable]],levels=levels)
    test[[variable]] <- factor(test[[variable]],levels=levels)
  }
}

forest <-randomForest(SalePrice~.,train, do.trace=TRUE)
Error in eval(predvars, data, env) : object '1stFlrSF' not found
names(train) <- make.names((names(train)))
forest <-randomForest(SalePrice~.,train, do.trace=TRUE)
varImpPlot(forest)