# MSDS 692 DATA SCIENCE PRACTICUM 
Ben Turner
Predicting Housing Prices in Ames, Iowa

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
                                                                        
#Scatterplot
![](https://github.com/bjt4080/Data-Science-Project/blob/master/Boxplot.png)



#Boxplot
![Boxer](https://github.com/bjt4080/Data-Science-Project/blob/master/Boxplot.png)

![rplot01](https://user-images.githubusercontent.com/25735405/40893807-73736cb6-6759-11e8-9298-aa7d95b9fb64.png)

Price Vs. Overall Condition (1-10 scale, 10 being best condition)
![condition](https://user-images.githubusercontent.com/25735405/40893912-671a4646-675a-11e8-9fca-2324b7fd3539.png)

Price Vs. Overall Quality (1-10 scale, 10 being highest quality)
![quality](https://user-images.githubusercontent.com/25735405/40893997-222cb14e-675b-11e8-843f-ebee768f533f.png)

Looking at Sale Price V. Year Built V. Overall Quality
![salepricevquality](https://user-images.githubusercontent.com/25735405/41806217-a1254a66-766e-11e8-9dbe-8c98912da6c1.png)

This plot show a the relationship between the SalePrice, YearBuilt and OverallQuality. It seems that houses from recent years have better grade of quality.

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


```{r}
summary(linearModel)

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
```
The result I focused on here was R-Squared. R – squared is a statistical measure of how close the data are to the fitted regression line. Typically, the higher the R-squared, the better the model fits your data. So in this case my R-squared value was: 
The Adjusted R-Squared of . is the data I’m concered with. It should be noted that just because an R-squared value is not high,that does not mean that the model is bad. You can also have a high R-squared value, and the model does not fit the data 


The 2nd time I ran the linear model was with all the data and I was able to get a better R-squared result: 

```
Call:
lm(formula = SalePrice ~ ., data = clean)

Residuals:
    Min      1Q  Median      3Q     Max 
-217712  -36433   -3078   30921  414132 

Coefficients: (2 not defined because of singularities)
                   Estimate    Std. Error t value             Pr(>|t|)    
(Intercept)   29935067.0434  1791320.2637  16.711 < 0.0000000000000002 ***
V1                 -98.2790        1.3526 -72.658 < 0.0000000000000002 ***
Id                       NA            NA      NA                   NA    
MSSubClass         -99.1509       55.9989  -1.771             0.076737 .  
MSZoning          -638.9891     1998.5190  -0.320             0.749196    
LotFrontage        -58.2773       69.2308  -0.842             0.399981    
LotArea              0.6477        0.1718   3.771             0.000166 ***
Street            1802.1608    18122.1220   0.099             0.920792    
Alley             2280.7768     4755.3433   0.480             0.631532    
LotShape          1396.0191      864.9681   1.614             0.106648    
LandContour       3533.0687     1739.6144   2.031             0.042353 *  
Utilities        -2892.3579    34933.2501  -0.083             0.934019    
LotConfig           42.7621      714.5343   0.060             0.952282    
LandSlope         1604.5019     5262.7967   0.305             0.760483    
Neighborhood       -98.4338      205.4008  -0.479             0.631813    
Condition1        -964.8769     1302.5380  -0.741             0.458896    
Condition2       -9214.4203     5311.1434  -1.735             0.082863 .  
BldgType           880.9432     1904.6308   0.463             0.643739    
HouseStyle        -396.1718      823.8014  -0.481             0.630620    
OverallQual       2732.3806     1491.6811   1.832             0.067094 .  
OverallCond       4906.7340     1331.6985   3.685             0.000233 ***
YearBuilt          161.0116       99.3473   1.621             0.105194    
YearRemodAdd       -57.6466       86.7031  -0.665             0.506185    
RoofStyle         2387.5280     1489.5507   1.603             0.109079    
RoofMatl          4821.2942     2117.9832   2.276             0.022899 *  
Exterior1st      -1453.9450      677.0457  -2.147             0.031839 *  
Exterior2nd        487.1283      614.6554   0.793             0.428122    
MasVnrType        8994.9221     2067.4849   4.351          0.000014052 ***
MasVnrArea          12.1114        8.0248   1.509             0.131346    
ExterQual        -6186.5877     2545.5040  -2.430             0.015144 *  
ExterCond         2320.0081     1548.4240   1.498             0.134166    
Foundation        1156.4107     2092.5292   0.553             0.580555    
BsmtQual           321.2134     1843.1842   0.174             0.861665    
BsmtCond           852.8989     1710.5098   0.499             0.618084    
BsmtExposure     -4210.3795     1191.0151  -3.535             0.000414 ***
BsmtFinType1      -226.2377      670.3411  -0.337             0.735768    
BsmtFinSF1           2.5333        4.2992   0.589             0.555741    
BsmtFinType2      2623.7115     1675.0834   1.566             0.117386    
BsmtFinSF2           8.7123       10.1631   0.857             0.391380    
BsmtUnfSF            1.9076        3.6458   0.523             0.600851    
TotalBsmtSF         -0.1594        3.6423  -0.044             0.965103    
Heating           -410.3491     4799.4804  -0.085             0.931871    
HeatingQC         -188.1669      794.4694  -0.237             0.812793    
CentralAir       -1862.2153     5594.7107  -0.333             0.739270    
Electrical        2139.9780     1177.1115   1.818             0.069171 .  
X1stFlrSF           26.6512        6.4778   4.114          0.000039947 ***
X2ndFlrSF           32.8083        6.2974   5.210          0.000000203 ***
LowQualFinSF       -24.4420       24.8835  -0.982             0.326058    
GrLivArea                NA            NA      NA                   NA    
BsmtFullBath      2738.4336     3097.7752   0.884             0.376771    
BsmtHalfBath     -2696.5678     4859.3548  -0.555             0.578991    
FullBath           979.0693     3392.0237   0.289             0.772879    
HalfBath         -4553.4320     3256.5044  -1.398             0.162145    
BedroomAbvGr     -6859.6278     2107.6023  -3.255             0.001148 ** 
KitchenAbvGr    -22258.7652     6614.1761  -3.365             0.000775 ***
KitchenQual      -3644.3353     1919.1276  -1.899             0.057672 .  
TotRmsAbvGrd      7313.1565     1496.5119   4.887          0.000001082 ***
Functional        2173.0129     1271.3332   1.709             0.087516 .  
Fireplaces        -809.0308     2153.2498  -0.376             0.707149    
FireplaceQu        612.7479     1028.2691   0.596             0.551288    
GarageType        -595.1318      809.1270  -0.736             0.462082    
GarageYrBlt        -35.0064       85.4057  -0.410             0.681922    
GarageFinish      -946.2367     1176.5642  -0.804             0.421327    
GarageCars        2547.3987     3549.2808   0.718             0.472987    
GarageArea           5.2568       12.4564   0.422             0.673043    
GarageQual       -1387.2355     2016.6005  -0.688             0.491567    
GarageCond        1221.3084     2473.4788   0.494             0.621513    
PavedDrive       -1162.9370     2597.5814  -0.448             0.654404    
WoodDeckSF           5.5216        9.7444   0.567             0.570997    
OpenPorchSF        -21.0658       18.2034  -1.157             0.247268    
EnclosedPorch       -3.9855       18.9468  -0.210             0.833406    
X3SsnPorch          21.0089       43.7402   0.480             0.631043    
ScreenPorch         26.9642       20.3790   1.323             0.185897    
PoolArea            43.1380       43.7491   0.986             0.324201    
PoolQC          -11467.9614    12082.7686  -0.949             0.342642    
Fence             -183.7679     1079.9389  -0.170             0.864892    
MiscFeature      -3026.7022     3140.2472  -0.964             0.335207    
MiscVal             -5.5167        2.0066  -2.749             0.006011 ** 
MoSold             637.8441      411.4522   1.550             0.121199    
YrSold          -14891.2260      884.3017 -16.840 < 0.0000000000000002 ***
SaleType          -851.6868      720.6329  -1.182             0.237360    
SaleCondition     1422.3036     1089.7046   1.305             0.191924    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 58590 on 2839 degrees of freedom
Multiple R-squared:  0.7055,	Adjusted R-squared:  0.6973 
F-statistic: 86.11 on 79 and 2839 DF,  p-value: < 0.00000000000000022
```




##RANDOM FOREST
One thing that I did have trouble with was converting the data from a categorical value to a numerical. When trying to run my random forest model, I kept getting errors that stated that my data could not be read. 

I then had to use the following functions to get it work correctly. This took me awhile to figure out, but then through the help of the professor and used this code to process it.

My first random forest model I used to build very simple variables of Sale Price, then LotArea, YearBuilt, Condition1, # of bathrooms, bedrooms above ground, and total rooms above ground. As I noted, I was running into problems when dealing with the categorical variables, so I ran this one without any of those. 
```{r}
#First we have to make it so the the columns in R don't start with numbers, so I'll change
names(clean) <- make.names(names(clean))
#Then we have to change the # of categorial bc RF cannot hanlde over 53
clean <- clean %>% mutate_if(is.character,as.factor)
```

```
> fit <- rpart(SalePrice ~ LotArea + YearBuilt + Condition1 + FullBath + BedroomAbvGr + TotRmsAbvGrd
+              ,data = clean)
> plot(fit, uniform = TRUE)
> text(fit, cex=.6)
> model <- rpart(SalePrice ~., data = clean, method = "anova")
> #Changing Characters into Factors as it Random Forest won't work with characters
> clean <- clean %>% mutate_if(is.character,as.factor)
> #Random Forest
> #First we have to make it so the the columns in R don't start with numbers, so I'll change
> names(clean) <- make.names(names(clean))
> #Then we have to change the # of categorial bc RF cannot hanlde over 53
> clean <- clean %>% mutate_if(is.character,as.factor)
> #This didn't work, so I'll try to change them into integers
> clean <- clean %>% mutate_if(is.factor,as.integer)
> rf1 <- randomForest(SalePrice~.,data=clean, ntree=1000,proximity=TRUE)
> varImpPlot(rf1)
> predict_rf<-predict(rf1, clean) #Prediction
> head(predict_rf)
       1        2        3        4        5        6 
208209.9 176575.1 221001.4 159083.8 267835.5 148094.2 
> summary(predict_rf)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
      0       0   51084   90535  163760  651943
 ```
 
So I was able to have what I think was a little bit more success in my 2nd try with the random forest. I had a couple factors in my dataset that had over 53 levels, so I changed those values from factors with over 53 levels to integers and ran the model. 

My concern though is the low mean and median that this model is popping out. This doesn't seem consistent with what the rest of the data should be. 
 
 ```
 > rf2 <- randomForest(SalePrice ~., data = mydata2, method = "anova")
> varImpPlot(rf2)
> prediction<-predict(rf2, clean) #Prediction
> head(prediction)
       1        2        3        4        5        6 
209200.7 175361.8 220819.7 157523.4 266305.5 147388.0 
> summary(prediction)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
      0       0   50982   90538  163656  642897 
 ```
 Here is the graph for the 2nd RandomForest. 
 ![random forest 2](https://user-images.githubusercontent.com/25735405/41887820-4071b9ac-78b7-11e8-9a49-fb4154df9bc8.png)
 
 
 
 



## CONCLUSIONS
The biggest hurdle I had in this project was figuring out how to handle the missing data. This took the majority of my time to figure out how to first of all find what was missing, then repalce that data, and figure out what to replace that data with. 

Once I was able to get that portion done, my next set of challenges was getting the newly cleaned data to work propertly in basic linear, rpart, and randomForest models. I was hoping to get an adaboost model in there, but I ran out of time. As I expected, the linear model performed the worst, followed by the rpart model, then finally the random forest model. 

