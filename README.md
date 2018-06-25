# MSDS 692 DATA SCIENCE PRACTICUM 
E

# Project Overview

This project will be evaluating the variables in home prices based on a group of 79 certain variabesl. In this project we are going to try to determine how to predict housing prices based on home variables.

## EDA (EXPLATORY DATA ANALYIS)
In this project I will need 

Feature selection is the automatic selection of attributes in the data that are most relevant to the predictive modeling. This is done by reducing the number

Now that the data has been converted to numeric values, we can begin doing some correlation analysis. The first is the scatterplot below.

This project will be evaluating the variables in home prices based on a group of 79 certain variables. In this project we are going to try to determine how to predict housing prices based on home variables.

We see 

## EDA (EXPLATORY DATA ANALYSIS)
Looking at the data

Pool QC
  Ex   Fa   Gd None 
   4    2    4 2909 
[1] "Ex"   "Fa"   "Gd"   "None"

## ANALYSIS
* VarImp
* Missing Values



#Scatterplot
![](https://github.com/bjt4080/Data-Science-Project/blob/master/Boxplot.png)
<<<<<<< HEAD


#Boxplot
![Boxer](https://github.com/bjt4080/Data-Science-Project/blob/master/Boxplot.png)


=======
 
>>>>>>> 7620703f92f72e3fccf45e82e822ac40a4f568ec
#Plot
![rplot01](https://user-images.githubusercontent.com/25735405/40893807-73736cb6-6759-11e8-9298-aa7d95b9fb64.png)

Price Vs. Overall Condition (1-10 scale, 10 being best condition)
![condition](https://user-images.githubusercontent.com/25735405/40893912-671a4646-675a-11e8-9fca-2324b7fd3539.png)

Price Vs. Overall Quality (1-10 scale, 10 being highest quality)
![quality](https://user-images.githubusercontent.com/25735405/40893997-222cb14e-675b-11e8-843f-ebee768f533f.png)

Looking at Sale Price V. Year Built V. Overall Quality
![salepricevquality](https://user-images.githubusercontent.com/25735405/41806217-a1254a66-766e-11e8-9dbe-8c98912da6c1.png)

This plot show a the relationship between the SalePrice, YearBuilt and OverallQuality. It seems that houses from recent years have better grade of quality.

<<<<<<< HEAD
#Plotting with Outliers
=======
Plotting with Outliers 
>>>>>>> cae0f15bab73f1ff22388e80a7ce9fa9a04296da
![rplot4](https://user-images.githubusercontent.com/25735405/41139323-b83e942a-6a9b-11e8-81a4-3f285c08a510.png)

Plotting without Outliers
![rplot03](https://user-images.githubusercontent.com/25735405/41139466-9f5bbd06-6a9c-11e8-953a-ebaeaf57ee77.png)

<<<<<<< HEAD
As we run the data for the missing values we see that there are 34 features with missing values, but I'm only going to list the top 5 to address those:
1. PoolQC : Pool quality
2. MiscFeature: Miscellaneious feature not covered in other categories
3. Alley: Type of alley access to propety
4. Fence: Fence Quality
5. FireplaceQU: Fireplace Quality
=======
Missing Values Graphic for Test Data
![missingness test](https://user-images.githubusercontent.com/25735405/41495351-f42e1b56-70d9-11e8-9817-9b26a042b0dd.png)

Train Data
![missingness train](https://user-images.githubusercontent.com/25735405/41495353-f5f3cb0c-70d9-11e8-9c38-4552d7b34a6c.png)\


Looking at the data we have a ton of values that are missing data. I've decided to input the missing values into missing data points based on what would most make sense for my model. For instance, the variable for Garage Year Built has missing values. When I run a summary for this data, I get the following: 
> summary(df$GarageYrBlt)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   1900    1962    1979    1979    2001    2010 
   
 In this case, it is probably best to use the median, I've decided to use the median of 1979 to use for all missing values for this partiuclar variable. 
 
 In another case, I've used just the most frequent feature. For example, the varibale of MSZoing, which refers to how a house is zoned (residential, commerical, etc). As we can see from the table, the vast majority of data is zoned as 'RL', so we will use this to input for the missing values. 
 > table(df$MSZoning)
C (all)      FV      RH      RL      RM 
     10      65      16    1151     218 
>>>>>>> cae0f15bab73f1ff22388e80a7ce9fa9a04296da

Let's take a look at the summary of those values:
summary(PoolQC)



## CONCLUSIONS


