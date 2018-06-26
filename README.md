# MSDS 692 DATA SCIENCE PRACTICUM 
E

# Project Overview

This project will be evaluating 79 different variables that are provided in a Kaggle competition dataset. The variables describe almost every different of aspect of a house. The data includes obvious variables like square footage, number of bedrooms, and number of bathrooms, to much more less known variables, such as basement square footage, to what shape the lot of the house is on, to whether or not the house has alley access.

The dependent variable in this project will be the Sale Price.  In this project we are going to try to determine how to predict housing prices based on home variables.

## EDA (EXPLATORY DATA ANALYIS)
The EDA will begin by trying to understand how the dependent variables and independent variables relate to each other and the cause for that relationship. Our EDA will also involve some data cleaning, how to handle the missing data, and how to deal with the categorical variables. 

The data for this project is split up between a test and a train data set. When running the first initial EDA, we find that we have A LOT of missing data. So we will not be able to run a reliable predictive model until we will those values in. Overall there are 34 different variables missing data or NA’s, and a grand total of 13,965 NA or missing values in total.  

For the variables, I either input the median value or whatever the majority value was. For example, the highest variables with missing values was the pool area. Since the majority of houses came back with a “None” value, I will use that and replace all missing values for Pool QC with None. 

For numerical variables, such as Year Built, referring to what year the house was built in, we look to see if it has a normal or skewed distribution. For normal distributions, it is best to use mean for our model. If the variable has a skewed distribution, then it is best is we use the median value. For this variable, based on the histogram this looks like a skewed distribution as most of the houses are built 1960 or so and later, and a large proportion of them built after 1990’s, so we will use the median for this value of 1979. 


## EDA (EXPLATORY DATA ANALYSIS)
Looking at the data

```
str(df)

      Id           MSSubClass     MSZoning          LotFrontage    
 Min.   :   1.0   20     :1079   Length:2919        Min.   : 21.00  
 1st Qu.: 730.5   60     : 575   Class :character   1st Qu.: 60.00  
 Median :1460.0   50     : 287   Mode  :character   Median : 68.00  
 Mean   :1460.0   120    : 182                      Mean   : 69.09  
 3rd Qu.:2189.5   30     : 139                      3rd Qu.: 78.00  
 Max.   :2919.0   70     : 128                      Max.   :313.00  
                  (Other): 529                                      
    LotArea          Street             Alley             LotShape        
 Min.   :  1300   Length:2919        Length:2919        Length:2919       
 1st Qu.:  7478   Class :character   Class :character   Class :character  
 Median :  9453   Mode  :character   Mode  :character   Mode  :character  
 Mean   : 10168                                                           
 3rd Qu.: 11570                                                           
 Max.   :215245                                                           
                                                                          
 LandContour         Utilities          LotConfig          LandSlope        
 Length:2919        Length:2919        Length:2919        Length:2919       
 Class :character   Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character  
                                                                            
                                                                            
                                                                            
                                                                            
 Neighborhood        Condition1         Condition2          BldgType        
 Length:2919        Length:2919        Length:2919        Length:2919       
 Class :character   Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character  
                                                                            
                                                                            
                                                                                                                  
  HouseStyle         OverallQual      OverallCond      YearBuilt   
 Length:2919        Min.   : 1.000   Min.   :1.000   Min.   :1872  
 Class :character   1st Qu.: 5.000   1st Qu.:5.000   1st Qu.:1954  
 Mode  :character   Median : 6.000   Median :5.000   Median :1973  
                    Mean   : 6.089   Mean   :5.565   Mean   :1971  
                    3rd Qu.: 7.000   3rd Qu.:6.000   3rd Qu.:2001  
                    Max.   :10.000   Max.   :9.000   Max.   :2010  
                                                                   
  YearRemodAdd   RoofStyle           RoofMatl         Exterior1st       
 Min.   :1950   Length:2919        Length:2919        Length:2919       
 1st Qu.:1965   Class :character   Class :character   Class :character  
 Median :1993   Mode  :character   Mode  :character   Mode  :character  
 Mean   :1984                                                           
 3rd Qu.:2004                                                           
 Max.   :2010                                                           
                                                                        
 Exterior2nd         MasVnrType          MasVnrArea      ExterQual        
 Length:2919        Length:2919        Min.   :   0.0   Length:2919       
 Class :character   Class :character   1st Qu.:   0.0   Class :character  
 Mode  :character   Mode  :character   Median :   0.0   Mode  :character  
                                       Mean   : 101.4                     
                                       3rd Qu.: 163.5                     
                                       Max.   :1600.0                     
                                                                          
  ExterCond          Foundation          BsmtQual           BsmtCond        
 Length:2919        Length:2919        Length:2919        Length:2919       
 Class :character   Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character  
                                                                            
                                                                            
                                                                            
                                                                            
 BsmtExposure       BsmtFinType1         BsmtFinSF1     BsmtFinType2      
 Length:2919        Length:2919        Min.   :   0.0   Length:2919       
 Class :character   Class :character   1st Qu.:   0.0   Class :character  
 Mode  :character   Mode  :character   Median : 368.0   Mode  :character  
                                       Mean   : 441.3                     
                                       3rd Qu.: 733.0                     
                                       Max.   :5644.0                     
                                                                          
   BsmtFinSF2       BsmtUnfSF         TotalBsmtSF          Heating         
 Min.   :   0.00   Length:2919        Length:2919        Length:2919       
 1st Qu.:   0.00   Class :character   Class :character   Class :character  
 Median :   0.00   Mode  :character   Mode  :character   Mode  :character  
 Mean   :  49.57                                                           
 3rd Qu.:   0.00                                                           
 Max.   :1526.00                                                           
                                                                           
  HeatingQC          CentralAir         Electrical           1stFlrSF   
 Length:2919        Length:2919        Length:2919        Min.   : 334  
 Class :character   Class :character   Class :character   1st Qu.: 876  
 Mode  :character   Mode  :character   Mode  :character   Median :1082  
                                                          Mean   :1160  
                                                          3rd Qu.:1388  
                                                          Max.   :5095  
                                                                        
    2ndFlrSF       LowQualFinSF        GrLivArea     BsmtFullBath   
 Min.   :   0.0   Min.   :   0.000   Min.   : 334   Min.   :0.0000  
 1st Qu.:   0.0   1st Qu.:   0.000   1st Qu.:1126   1st Qu.:0.0000  
 Median :   0.0   Median :   0.000   Median :1444   Median :0.0000  
 Mean   : 336.5   Mean   :   4.694   Mean   :1501   Mean   :0.4296  
 3rd Qu.: 704.0   3rd Qu.:   0.000   3rd Qu.:1744   3rd Qu.:1.0000  
 Max.   :2065.0   Max.   :1064.000   Max.   :5642   Max.   :3.0000  
                                                                    
  BsmtHalfBath        FullBath        HalfBath       BedroomAbvGr 
 Min.   :0.00000   Min.   :0.000   Min.   :0.0000   Min.   :0.00  
 1st Qu.:0.00000   1st Qu.:1.000   1st Qu.:0.0000   1st Qu.:2.00  
 Median :0.00000   Median :2.000   Median :0.0000   Median :3.00  
 Mean   :0.06132   Mean   :1.568   Mean   :0.3803   Mean   :2.86  
 3rd Qu.:0.00000   3rd Qu.:2.000   3rd Qu.:1.0000   3rd Qu.:3.00  
 Max.   :2.00000   Max.   :4.000   Max.   :2.0000   Max.   :8.00  
                                                                  
  KitchenAbvGr   KitchenQual         TotRmsAbvGrd     Functional       
 Min.   :0.000   Length:2919        Min.   : 2.000   Length:2919       
 1st Qu.:1.000   Class :character   1st Qu.: 5.000   Class :character  
 Median :1.000   Mode  :character   Median : 6.000   Mode  :character  
 Mean   :1.045                      Mean   : 6.452                     
 3rd Qu.:1.000                      3rd Qu.: 7.000                     
 Max.   :3.000                      Max.   :15.000                     
                                                                       
   Fireplaces     FireplaceQu         GarageType         GarageYrBlt  
 Min.   :0.0000   Length:2919        Length:2919        Min.   :1895  
 1st Qu.:0.0000   Class :character   Class :character   1st Qu.:1962  
 Median :1.0000   Mode  :character   Mode  :character   Median :1979  
 Mean   :0.5971                                         Mean   :1978  
 3rd Qu.:1.0000                                         3rd Qu.:2001  
 Max.   :4.0000                                         Max.   :2207  
                                                                      
 GarageFinish         GarageCars      GarageArea      GarageQual       
 Length:2919        Min.   :0.000   Min.   :   0.0   Length:2919       
 Class :character   1st Qu.:1.000   1st Qu.: 320.0   Class :character  
 Mode  :character   Median :2.000   Median : 480.0   Mode  :character  
                    Mean   :1.767   Mean   : 472.9                     
                    3rd Qu.:2.000   3rd Qu.: 576.0                     
                    Max.   :5.000   Max.   :1488.0                     
                                                                       
  GarageCond         PavedDrive          WoodDeckSF       OpenPorchSF    
 Length:2919        Length:2919        Min.   :   0.00   Min.   :  0.00  
 Class :character   Class :character   1st Qu.:   0.00   1st Qu.:  0.00  
 Mode  :character   Mode  :character   Median :   0.00   Median : 26.00  
                                       Mean   :  93.71   Mean   : 47.49  
                                       3rd Qu.: 168.00   3rd Qu.: 70.00  
                                       Max.   :1424.00   Max.   :742.00  
                                                                         
 EnclosedPorch      3SsnPorch        ScreenPorch        PoolArea      
 Min.   :   0.0   Min.   :  0.000   Min.   :  0.00   Min.   :  0.000  
 1st Qu.:   0.0   1st Qu.:  0.000   1st Qu.:  0.00   1st Qu.:  0.000  
 Median :   0.0   Median :  0.000   Median :  0.00   Median :  0.000  
 Mean   :  23.1   Mean   :  2.602   Mean   : 16.06   Mean   :  2.252  
 3rd Qu.:   0.0   3rd Qu.:  0.000   3rd Qu.:  0.00   3rd Qu.:  0.000  
 Max.   :1012.0   Max.   :508.000   Max.   :576.00   Max.   :800.000  
                                                                      
    PoolQC             Fence           MiscFeature           MiscVal        
 Length:2919        Length:2919        Length:2919        Min.   :    0.00  
 Class :character   Class :character   Class :character   1st Qu.:    0.00  
 Mode  :character   Mode  :character   Mode  :character   Median :    0.00  
                                                          Mean   :   50.83  
                                                          3rd Qu.:    0.00  
                                                          Max.   :17000.00  
                                                                            
     MoSold     YrSold      SaleType         SaleCondition        SalePrice     
 6      :503   2006:619   Length:2919        Length:2919        Min.   :     0  
 7      :446   2007:692   Class :character   Class :character   1st Qu.:     0  
 5      :394   2008:622   Mode  :character   Mode  :character   Median : 34900  
 4      :279   2009:647                                         Mean   : 90492  
 8      :233   2010:339                                         3rd Qu.:163000  
 3      :232                                                    Max.   :755000  
 (Other):832                                                                                                                                 
 ```
 
                                                                            
                                                                            
Pool QC
  Ex   Fa   Gd None 
   4    2    4 2909 
[1] "Ex"   "Fa"   "Gd"   "None"



#Scatterplot
![](https://github.com/bjt4080/Data-Science-Project/blob/master/Boxplot.png)



#Boxplot
![Boxer](https://github.com/bjt4080/Data-Science-Project/blob/master/Boxplot.png)



 
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


Looking at the data we have a ton of values that are missing data. I've decided to input the missing values into missing data points based on what would most make sense for my model. For instance, the variable for Lot Frontage has missing values. When I run a summary for this data, I get the following: 
```{r}
summary(df$LotFrontage)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  21.00   60.00   68.00   69.09   78.00  313.00 
```
   In this case, it is probably best to use the median, I've decided to use the median of 69.09 to use for all missing values for this partiuclar variable since it is normally distributed 
 
 In another case, I've used just the most frequent feature. For example, the varibale of MSZoing, which refers to how a house is zoned (residential, commerical, etc). As we can see from the table, the vast majority of data is zoned as 'RL', so we will use this to input for the missing values. 
```{r}
table(df$MSZoning)
C (all)      FV      RH      RL      RM 
     25     139      26    2269     460 
```

```{r}
#This is a very basic linear model using only lot's square footage, bedrooms, and month 
linearModel <- lm(SalePrice ~ YrSold + MoSold + LotArea + BedroomAbvGr, data=train)
linearPreds <- data.frame(Id = test$Id, SalePrice= predict(linearModel, test))
str(linearPreds)
head(linearPreds)
data.frame':	1459 obs. of  2 variables:
 $ Id       : int  1461 1462 1463 1464 1465 1466 1467 1468 1469 1470 ...
 $ SalePrice: num  169277 187758 183584 179317 150730 ...
```

After cleaning the data I ran a couple different models. The first was a very simple linear regression model that used 


Call:
lm(formula = SalePrice ~ YrSold + MoSold + LotArea + BedroomAbvGr, 
    data = train)

Residuals:
    Min      1Q  Median      3Q     Max 
-258793  -48846  -17832   30415  542493 

Coefficients:
                 Estimate   Std. Error t value             Pr(>|t|)    
(Intercept)  1917554.0845 3037799.2464   0.631                0.528    
YrSold          -897.6770    1512.5335  -0.593                0.553    
MoSold          1104.8926     743.2912   1.486                0.137    
LotArea            1.9680       0.2005   9.817 < 0.0000000000000002 ***
BedroomAbvGr   13275.8801    2456.2101   5.405         0.0000000756 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 75870 on 1455 degrees of freedom
Multiple R-squared:  0.09035,	Adjusted R-squared:  0.08785 
F-statistic: 36.13 on 4 and 1455 DF,  p-value: < 0.00000000000000022


The result I focused on here was R-Squared. R – squared is a statistical measure of how close the data are to the fitted regression line. Typically, the higher the R-squared, the better the model fits your data. So in this case my R-squared value was: 
The Adjusted R-Squared of . is the data I’m concered with. It should be noted that just because an R-squared value is not high,that does not mean that the model is bad. You can also have a high R-squared value, and the model does not fit the data 




## CONCLUSIONS


