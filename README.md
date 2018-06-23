# Data-Science-Project
Ben's Project

# Project Overview

This project will be evaluating the variables in home prices based on a group of 79 certain variabesl. In this project we are going to try to determine how to predict housing prices based on home variables.

## EDA (EXPLATORY DATA ANALYIS)
Looking at the data, what I'm going to need to do is make it so I can do some missing values data, some EDA, will need to do some major feature selction in order to get this project to run smoothly.

Feature selection is the automatic selection of attributes in the data that are most relevant to the predictive modeling. This is done by reducing the number

Now that the data has been converted to numeric values, we can begin doing some correlation analysis. The first is the scatterplot below.

This project will be evaluating the variables in home prices based on a group of 79 certain variables. In this project we are going to try to determine how to predict housing prices based on home variables. 

## EDA (EXPLATORY DATA ANALYSIS)
Looking at the data

#Scatterplot
![](https://github.com/bjt4080/Data-Science-Project/blob/master/Boxplot.png)


#Boxplot
![Boxer](https://github.com/bjt4080/Data-Science-Project/blob/master/Boxplot.png)
 

#Plot
![rplot01](https://user-images.githubusercontent.com/25735405/40893807-73736cb6-6759-11e8-9298-aa7d95b9fb64.png)

Price Vs. Overall Condition (1-10 scale, 10 being best condition)
![condition](https://user-images.githubusercontent.com/25735405/40893912-671a4646-675a-11e8-9fca-2324b7fd3539.png)

Price Vs. Overall Quality (1-10 scale, 10 being highest quality) 
![quality](https://user-images.githubusercontent.com/25735405/40893997-222cb14e-675b-11e8-843f-ebee768f533f.png)

Looking at Sale Price V. Year Built V. Overall Quality
![salepricevquality](https://user-images.githubusercontent.com/25735405/41806217-a1254a66-766e-11e8-9dbe-8c98912da6c1.png)

This plot show a the relationship between the SalePrice, YearBuilt and OverallQuality. It seems that houses from recent years have better grade of quality.

Plotting with Outliers 
![rplot4](https://user-images.githubusercontent.com/25735405/41139323-b83e942a-6a9b-11e8-81a4-3f285c08a510.png)

Plotting without Outliers
![rplot03](https://user-images.githubusercontent.com/25735405/41139466-9f5bbd06-6a9c-11e8-953a-ebaeaf57ee77.png)

Missing Values Graphic for Test Data
![missingness test](https://user-images.githubusercontent.com/25735405/41495351-f42e1b56-70d9-11e8-9817-9b26a042b0dd.png)

Train Data
![missingness train](https://user-images.githubusercontent.com/25735405/41495353-f5f3cb0c-70d9-11e8-9c38-4552d7b34a6c.png)\





s we run the data for the missing values we see that there are 34 features with missing values, but I'm only going to list the top 5 to address those:
1. PoolQC : Pool quality
2. MiscFeature: Miscellaneious feature not covered in other categories 
3. Alley: Type of alley access to propety
4. Fence: Fence Quality
5. FireplaceQU: Fireplace Quality

#Histogram of Lot Frontage
![lotfronrtage](https://user-images.githubusercontent.com/25735405/41504551-8a47cd4e-71a7-11e8-8347-9f9cdb781462.png)

Let's take a look at the summary of those values: 
summary(PoolQC)
 

## ANALYSIS
* VarImp
* Missing Values

## CONCLUSIONS
link to your video presentation
