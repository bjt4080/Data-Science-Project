# Data-Science-Project
Ben's Project

# Project Overview
This project will be evaluating the variables in home prices based on a group of 79 certain variabesl. In this project we are going to try to determine how to predict housing prices based on home variables. 

## EDA (EXPLATORY DATA ANALYIS)
Looking at the data

df <- fread("/Users/benturner/housetest.csv")
str(df)
#use ColClasses to avoid warning from fread
df <- fread("/Users/benturner/housetest.csv",colClasses = c("MiscFeature"='character','PoolQC'='character'))
df <- fread("/Users/benturner/housetrain.csv",colClasses = c("MiscFeature"='character','PoolQC'='character'))
colnames(df)
summary(df$SalePrice)
#To unclass all data 
df <- as.data.frame(unclass(df))
str(df) #shows that data is now coverted from character to factors

## ANALYSIS

## CONCLUSIONS
link to your video presentation
