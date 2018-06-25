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

> summary(df)
       Id           MSSubClass     MSZoning          LotFrontage        LotArea      
 Min.   :   1.0   20     :1079   Length:2919        Min.   : 21.00   Min.   :  1300  
 1st Qu.: 730.5   60     : 575   Class :character   1st Qu.: 60.00   1st Qu.:  7478  
 Median :1460.0   50     : 287   Mode  :character   Median : 68.00   Median :  9453  
 Mean   :1460.0   120    : 182                      Mean   : 69.09   Mean   : 10168  
 3rd Qu.:2189.5   30     : 139                      3rd Qu.: 78.00   3rd Qu.: 11570  
 Max.   :2919.0   70     : 128                      Max.   :313.00   Max.   :215245  
                  (Other): 529                                                       
    Street             Alley             LotShape         LandContour       
 Length:2919        Length:2919        Length:2919        Length:2919       
 Class :character   Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character  
                                                                            
                                                                            
                                                                            
                                                                            
  Utilities          LotConfig          LandSlope         Neighborhood      
 Length:2919        Length:2919        Length:2919        Length:2919       
 Class :character   Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character  
                                                                            
                                                                            
                                                                            
                                                                            
  Condition1         Condition2          BldgType          HouseStyle       
 Length:2919        Length:2919        Length:2919        Length:2919       
 Class :character   Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character  
                                                                            
                                                                            
                                                                            
                                                                            
  OverallQual      OverallCond      YearBuilt     YearRemodAdd   RoofStyle        
 Min.   : 1.000   Min.   :1.000   Min.   :1872   Min.   :1950   Length:2919       
 1st Qu.: 5.000   1st Qu.:5.000   1st Qu.:1954   1st Qu.:1965   Class :character  
 Median : 6.000   Median :5.000   Median :1973   Median :1993   Mode  :character  
 Mean   : 6.089   Mean   :5.565   Mean   :1971   Mean   :1984                     
 3rd Qu.: 7.000   3rd Qu.:6.000   3rd Qu.:2001   3rd Qu.:2004                     
 Max.   :10.000   Max.   :9.000   Max.   :2010   Max.   :2010                     
                                                                                  
   RoofMatl         Exterior1st        Exterior2nd         MasVnrType       
 Length:2919        Length:2919        Length:2919        Length:2919       
 Class :character   Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character  
                                                                            
                                                                            
                                                                            
                                                                            
   MasVnrArea      ExterQual          ExterCond          Foundation       
 Min.   :   0.0   Length:2919        Length:2919        Length:2919       
 1st Qu.:   0.0   Class :character   Class :character   Class :character  
 Median :   0.0   Mode  :character   Mode  :character   Mode  :character  
 Mean   : 101.4                                                           
 3rd Qu.: 163.5                                                           
 Max.   :1600.0                                                           
                                                                          
   BsmtQual           BsmtCond         BsmtExposure       BsmtFinType1      
 Length:2919        Length:2919        Length:2919        Length:2919       
 Class :character   Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character  
                                                                            
                                                                            
                                                                            
                                                                            
   BsmtFinSF1     BsmtFinType2         BsmtFinSF2       BsmtUnfSF        
 Min.   :   0.0   Length:2919        Min.   :   0.00   Length:2919       
 1st Qu.:   0.0   Class :character   1st Qu.:   0.00   Class :character  
 Median : 368.0   Mode  :character   Median :   0.00   Mode  :character  
 Mean   : 441.3                      Mean   :  49.57                     
 3rd Qu.: 733.0                      3rd Qu.:   0.00                     
 Max.   :5644.0                      Max.   :1526.00                     
                                                                         
 TotalBsmtSF          Heating           HeatingQC          CentralAir       
 Length:2919        Length:2919        Length:2919        Length:2919       
 Class :character   Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character  
                                                                            
                                                                            
                                                                            
                                                                            
  Electrical           1stFlrSF       2ndFlrSF       LowQualFinSF        GrLivArea   
 Length:2919        Min.   : 334   Min.   :   0.0   Min.   :   0.000   Min.   : 334  
 Class :character   1st Qu.: 876   1st Qu.:   0.0   1st Qu.:   0.000   1st Qu.:1126  
 Mode  :character   Median :1082   Median :   0.0   Median :   0.000   Median :1444  
                    Mean   :1160   Mean   : 336.5   Mean   :   4.694   Mean   :1501  
                    3rd Qu.:1388   3rd Qu.: 704.0   3rd Qu.:   0.000   3rd Qu.:1744  
                    Max.   :5095   Max.   :2065.0   Max.   :1064.000   Max.   :5642  
                                                                                     
  BsmtFullBath     BsmtHalfBath        FullBath        HalfBath       BedroomAbvGr 
 Min.   :0.0000   Min.   :0.00000   Min.   :0.000   Min.   :0.0000   Min.   :0.00  
 1st Qu.:0.0000   1st Qu.:0.00000   1st Qu.:1.000   1st Qu.:0.0000   1st Qu.:2.00  
 Median :0.0000   Median :0.00000   Median :2.000   Median :0.0000   Median :3.00  
 Mean   :0.4296   Mean   :0.06132   Mean   :1.568   Mean   :0.3803   Mean   :2.86  
 3rd Qu.:1.0000   3rd Qu.:0.00000   3rd Qu.:2.000   3rd Qu.:1.0000   3rd Qu.:3.00  
 Max.   :3.0000   Max.   :2.00000   Max.   :4.000   Max.   :2.0000   Max.   :8.00  
                                                                                   
  KitchenAbvGr   KitchenQual         TotRmsAbvGrd     Functional          Fireplaces    
 Min.   :0.000   Length:2919        Min.   : 2.000   Length:2919        Min.   :0.0000  
 1st Qu.:1.000   Class :character   1st Qu.: 5.000   Class :character   1st Qu.:0.0000  
 Median :1.000   Mode  :character   Median : 6.000   Mode  :character   Median :1.0000  
 Mean   :1.045                      Mean   : 6.452                      Mean   :0.5971  
 3rd Qu.:1.000                      3rd Qu.: 7.000                      3rd Qu.:1.0000  
 Max.   :3.000                      Max.   :15.000                      Max.   :4.0000  
                                                                                        
 FireplaceQu         GarageType         GarageYrBlt   GarageFinish         GarageCars   
 Length:2919        Length:2919        Min.   :1895   Length:2919        Min.   :0.000  
 Class :character   Class :character   1st Qu.:1962   Class :character   1st Qu.:1.000  
 Mode  :character   Mode  :character   Median :1979   Mode  :character   Median :2.000  
                                       Mean   :1978                      Mean   :1.767  
                                       3rd Qu.:2001                      3rd Qu.:2.000  
                                       Max.   :2207                      Max.   :5.000  
                                                                                        
   GarageArea      GarageQual         GarageCond         PavedDrive       
 Min.   :   0.0   Length:2919        Length:2919        Length:2919       
 1st Qu.: 320.0   Class :character   Class :character   Class :character  
 Median : 480.0   Mode  :character   Mode  :character   Mode  :character  
 Mean   : 472.9                                                           
 3rd Qu.: 576.0                                                           
 Max.   :1488.0                                                           
                                                                          
   WoodDeckSF       OpenPorchSF     EnclosedPorch      3SsnPorch        ScreenPorch    
 Min.   :   0.00   Min.   :  0.00   Min.   :   0.0   Min.   :  0.000   Min.   :  0.00  
 1st Qu.:   0.00   1st Qu.:  0.00   1st Qu.:   0.0   1st Qu.:  0.000   1st Qu.:  0.00  
 Median :   0.00   Median : 26.00   Median :   0.0   Median :  0.000   Median :  0.00  
 Mean   :  93.71   Mean   : 47.49   Mean   :  23.1   Mean   :  2.602   Mean   : 16.06  
 3rd Qu.: 168.00   3rd Qu.: 70.00   3rd Qu.:   0.0   3rd Qu.:  0.000   3rd Qu.:  0.00  
 Max.   :1424.00   Max.   :742.00   Max.   :1012.0   Max.   :508.000   Max.   :576.00  
                                                                                       
    PoolArea          PoolQC             Fence           MiscFeature       
 Min.   :  0.000   Length:2919        Length:2919        Length:2919       
 1st Qu.:  0.000   Class :character   Class :character   Class :character  
 Median :  0.000   Mode  :character   Mode  :character   Mode  :character  
 Mean   :  2.252                                                           
 3rd Qu.:  0.000                                                           
 Max.   :800.000                                                           
                                                                           
    MiscVal             MoSold     YrSold      SaleType         SaleCondition     
 Min.   :    0.00   6      :503   2006:619   Length:2919        Length:2919       
 1st Qu.:    0.00   7      :446   2007:692   Class :character   Class :character  
 Median :    0.00   5      :394   2008:622   Mode  :character   Mode  :character  
 Mean   :   50.83   4      :279   2009:647                                        
 3rd Qu.:    0.00   8      :233   2010:339                                        
 Max.   :17000.00   3      :232                                                   
                    (Other):832                                                   
   SalePrice     
 Min.   :     0  
 1st Qu.:     0  
 Median : 34900  
 Mean   : 90492  
 3rd Qu.:163000  
 Max.   :755000 

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


Looking at the data we have a ton of values that are missing data. I've decided to input the missing values into missing data points based on what would most make sense for my model. For instance, the variable for Garage Year Built has missing values. When I run a summary for this data, I get the following: 
> summary(df$GarageYrBlt)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   1900    1962    1979    1979    2001    2010 
   
 In this case, it is probably best to use the median, I've decided to use the median of 1979 to use for all missing values for this partiuclar variable. 
 
 In another case, I've used just the most frequent feature. For example, the varibale of MSZoing, which refers to how a house is zoned (residential, commerical, etc). As we can see from the table, the vast majority of data is zoned as 'RL', so we will use this to input for the missing values. 
 > table(df$MSZoning)
C (all)      FV      RH      RL      RM 
     10      65      16    1151     218 


Let's take a look at the summary of those values:
summary(PoolQC)


The result I focused on here was R-Squared. R – squared is a statistical measure of how close the data are to the fitted regression line. Typically, the higher the R-squared, the better the model fits your data. So in this case my R-squared value was 
Residual standard error: 43390 on 708 degrees of freedom
Multiple R-squared:  0.9597,	Adjusted R-squared:  0.834 
F-statistic: 7.635 on 2210 and 708 DF,  p-value: < 0.00000000000000022 

The Adjusted R-Squared of .834 is the data I’m concered with. It should be noted that just because an R-squared value is not high,that does not mean that the model is bad. You can also have a high R-squared value, and the model does not fit the data 




## CONCLUSIONS


