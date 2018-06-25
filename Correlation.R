test <- fread("/Users/benturner/Documents/GitHub/Data-Science-Project/test.csv", stringsAsFactors = FALSE)
train<- fread("/Users/benturner/Documents/GitHub/Data-Science-Project/train.csv", stringsAsFactors = FALSE)
#Create a column in test file and feed a dummy value to it
test$SalePrice <- 0
df <- rbind(train,test)
colnames(df)
ggplot(train,aes(SalePrice))+geom_histogram(fill="green",color="black", bins = 60)
cols = colnames(df[, lapply(df, is.numeric) == TRUE, with = FALSE])
cormat <- round(cor(na.omit(df[,cols[-1],with=FALSE])),6)
melted_cormat <- melt(cormat)
options(repr.plot.width=6.5, repr.plot.height=5.5)
options(repr.plot.width=6.5, repr.plot.height=5.5)
ggplot(data = melted_cormat, aes(x=Var1, y=Var2, fill=value)) + 
  geom_raster() +
  scale_fill_distiller(palette = "RdBu", trans="reverse") +  #PuOr
  theme(axis.text.x = element_text(angle=90,size=7)) +   
  theme(axis.text.y = element_text(size=7)) + 
  labs(x="" ,  y="" , title="Correlation")
#Now we will list these for they are easier to read
tmp_dt = data.table(melted_cormat)
tmp_dt = tmp_dt[Var2=='SalePrice',c('Var1','value'),with=FALSE]

tmp_dt[order(value,decreasing = TRUE)][-1]
