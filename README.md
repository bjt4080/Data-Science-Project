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

After cleaning the data I ran a couple different models. The first was a very simple linear regression model that used nothing but sale price  


```{r}
> linearModel <- lm(SalePrice ~ YrSold + MoSold + LotArea + BedroomAbvGr, data=df)
> linearPreds <- data.frame(Id = df$Id, SalePrice= predict(linearModel, df))
> str(linearPreds)
'data.frame':	2919 obs. of  2 variables:
 $ Id       : int  1 2 3 4 5 6 7 8 9 10 ...
 $ SalePrice: num  173686 180162 186931 177646 209445 ...
> head(linearPreds)
  Id SalePrice
1  1  173686.1
2  2  180161.7
3  3  186930.9
4  4  177646.3
5  5  209445.2
6  6  166224.7
> summary(linearModel)

Call:
lm(formula = SalePrice ~ YrSold + MoSold + LotArea + BedroomAbvGr, 
    data = df)

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
  (1459 observations deleted due to missingness)
Multiple R-squared:  0.09035,	Adjusted R-squared:  0.08785 
F-statistic: 36.13 on 4 and 1455 DF,  p-value: < 0.00000000000000022

```
The result I focused on here was R-Squared. R – squared is a statistical measure of how close the data are to the fitted regression line. Typically, the higher the R-squared, the better the model fits your data. So in this case my R-squared value was: 

The Adjusted R-Squared of . is the data I’m concered with. It should be noted that just because an R-squared value is not high,that does not mean that the model is bad. You can also have a high R-squared value, and the model does not fit the data 


The 2nd time I ran the linear model was with all the data and I was able to get a better R-squared result: 

```
lm(formula = SalePrice ~ ., data = clean)

Residuals:
    Min      1Q  Median      3Q     Max 
-118577   -6221       0    5912  118577 

Coefficients: (236 not defined because of singularities)
                             Estimate       Std. Error t value             Pr(>|t|)    
(Intercept)           1164216785.4293   538384358.0602   2.162               0.0309 *  
V1                           -82.8075           2.0041 -41.319 < 0.0000000000000002 ***
Id                                 NA               NA      NA                   NA    
MSSubClass                     0.1044         198.8921   0.001               0.9996    
MSZoningFV                -10617.3665       31325.3579  -0.339               0.7348    
MSZoningRH                -24678.6745       27181.6366  -0.908               0.3642    
MSZoningRL                -14723.3311       22104.7801  -0.666               0.5056    
MSZoningRM                -25838.4083       20187.7555  -1.280               0.2010    
LotFrontage                  -51.4765         133.3043  -0.386               0.6995    
LotArea                        0.6451           0.5885   1.096               0.2733    
StreetPave                  7385.5740       25515.8856   0.289               0.7723    
AlleyNone                   7706.9297        8805.1317   0.875               0.3817    
AlleyPave                   2650.6978       15719.8815   0.169               0.8661    
LotShapeIR2                17873.8286       11532.2747   1.550               0.1216    
LotShapeIR3                53072.7219       30457.5635   1.743               0.0819 .  
LotShapeReg                 1287.5956        4464.7641   0.288               0.7731    
LandContourHLS             -7983.9429       14102.6656  -0.566               0.5715    
LandContourLow             11892.3204       17301.7462   0.687               0.4921    
LandContourLvl              2961.2140        9213.5524   0.321               0.7480    
UtilitiesAllPub           -17272.8471       45867.3678  -0.377               0.7066    
UtilitiesNoSeWa        -33556838.5227    15807623.5116  -2.123               0.0341 *  
LotConfigCulDSac            4985.4118        9581.7688   0.520               0.6030    
LotConfigFR2               -7761.1473       11881.8112  -0.653               0.5138    
LotConfigFR3              -49349.5668       32451.3853  -1.521               0.1288    
LotConfigInside            -6772.5410        4623.4876  -1.465               0.1434    
LandSlopeMod               -4382.8643       10926.7009  -0.401               0.6885    
LandSlopeSev              -17179.1659       41874.7000  -0.410               0.6817    
NeighborhoodBlueste       -68034.4315       78225.5593  -0.870               0.3847    
NeighborhoodBrDale        -41660.5064       58669.4354  -0.710               0.4779    
NeighborhoodBrkSide       -35685.8981       54757.7243  -0.652               0.5148    
NeighborhoodClearCr       -92390.0710       56862.6723  -1.625               0.1047    
NeighborhoodCollgCr       -47614.8060       52447.0766  -0.908               0.3643    
NeighborhoodCrawfor       -31944.8667       55698.7957  -0.574               0.5665    
NeighborhoodEdwards       -39612.9742       54036.5637  -0.733               0.4638    
NeighborhoodGilbert       -55993.3896       52707.0328  -1.062               0.2884    
NeighborhoodIDOTRR        -41346.1235       54805.8424  -0.754               0.4509    
NeighborhoodMeadowV       -33875.6942       60538.2197  -0.560               0.5759    
NeighborhoodMitchel       -37272.3556       53921.9454  -0.691               0.4896    
NeighborhoodNAmes         -60078.9334       53859.0037  -1.115               0.2650    
NeighborhoodNoRidge       -17924.0873       55669.4850  -0.322               0.7476    
NeighborhoodNPkVill         3025.2816       83086.1408   0.036               0.9710    
NeighborhoodNridgHt       -65725.7277       52373.4609  -1.255               0.2099    
NeighborhoodNWAmes        -50152.3138       54121.5372  -0.927               0.3544    
NeighborhoodOldTown       -44097.4300       54968.1215  -0.802               0.4227    
NeighborhoodSawyer        -47668.1502       54156.7509  -0.880               0.3791    
NeighborhoodSawyerW       -47173.7293       53013.5279  -0.890               0.3739    
NeighborhoodSomerst       -30111.3266       55682.5285  -0.541               0.5888    
NeighborhoodStoneBr         7461.8993       56334.9390   0.132               0.8947    
NeighborhoodSWISU         -28153.6418       55339.8306  -0.509               0.6111    
NeighborhoodTimber        -53311.1227       54023.9606  -0.987               0.3241    
NeighborhoodVeenker       -87102.8633       60158.1530  -1.448               0.1481    
Condition1Feedr            16059.1340       11547.2432   1.391               0.1647    
Condition1Norm              8166.5046        9191.2330   0.889               0.3746    
Condition1PosA             -7680.2092       23972.7793  -0.320               0.7488    
Condition1PosN              5293.9235       18557.8575   0.285               0.7755    
Condition1RRAe             24565.3938       18475.5459   1.330               0.1841    
Condition1RRAn             -1167.1212       15462.0458  -0.075               0.9399    
Condition1RRNe            -10578.6499       37679.4257  -0.281               0.7790    
Condition1RRNn            -26758.5261       31274.8125  -0.856               0.3925    
Condition2Feedr           -21418.5901       41158.2757  -0.520               0.6030    
Condition2Norm              3433.4548       34686.9257   0.099               0.9212    
Condition2PosA             29900.3269       63573.3496   0.470               0.6383    
Condition2PosN           -429562.2318      101878.5944  -4.216             0.000028 ***
Condition2RRAe          67462576.7580    31949879.7265   2.112               0.0351 *  
Condition2RRAn             19643.7897       76008.2728   0.258               0.7961    
Condition2RRNn            -69656.6182       59073.7832  -1.179               0.2387    
BldgType2fmCon            -12472.9611       29066.0957  -0.429               0.6680    
BldgTypeDuplex              3198.9819       17377.7548   0.184               0.8540    
BldgTypeTwnhs             -27989.2109       25243.0317  -1.109               0.2679    
BldgTypeTwnhsE            -11947.1529       23071.8841  -0.518               0.6047    
HouseStyle1.5Unf          -33141.8881       18927.7058  -1.751               0.0804 .  
HouseStyle1Story             601.1175       10627.5369   0.057               0.9549    
HouseStyle2.5Fin           45702.5201       39620.4296   1.154               0.2491    
HouseStyle2.5Unf          -19410.9237       19932.0178  -0.974               0.3305    
HouseStyle2Story           -2402.9209        8768.9081  -0.274               0.7841    
HouseStyleSFoyer          -19636.9166       15217.8696  -1.290               0.1973    
HouseStyleSLvl             13724.3974       14668.6724   0.936               0.3498    
OverallQual                 4319.6679        2614.8978   1.652               0.0990 .  
OverallCond                 3807.6912        2036.8390   1.869               0.0620 .  
YearBuilt                      3.4009         184.5513   0.018               0.9853    
YearRemodAdd                  55.6391         132.1857   0.421               0.6739    
RoofStyleGable             25773.1549       67619.1264   0.381               0.7032    
RoofStyleGambrel           30665.8630       70639.7838   0.434               0.6643    
RoofStyleHip               37237.7926       68097.4638   0.547               0.5847    
RoofStyleMansard           25460.6468       74785.3188   0.340               0.7336    
RoofStyleShed              28551.5134       95391.3254   0.299               0.7648    
RoofMatlCompShg       -952946134.0674   450416818.4687  -2.116               0.0347 *  
RoofMatlMembran       -880796389.4894   416347915.5020  -2.116               0.0347 *  
RoofMatlMetal         -952810600.7390   450413213.9633  -2.115               0.0347 *  
RoofMatlRoll         -1084999040.0417   512804721.5731  -2.116               0.0347 *  
RoofMatlTar&Grv       -952902253.4954   450415713.4401  -2.116               0.0347 *  
RoofMatlWdShake       -953031615.8603   450417209.6204  -2.116               0.0347 *  
RoofMatlWdShngl       -952871640.9807   450415244.9863  -2.116               0.0347 *  
Exterior1stAsphShn         62530.6896      105696.2889   0.592               0.5543    
Exterior1stBrkComm         41829.6565       55043.9109   0.760               0.4475    
Exterior1stBrkFace          4383.4808       30754.1907   0.143               0.8867    
Exterior1stCBlock          91827.3304       53935.3508   1.703               0.0891 .  
Exterior1stCemntBd         21226.4337       70225.4884   0.302               0.7625    
Exterior1stHdBoard        -15899.0680       29049.2028  -0.547               0.5843    
Exterior1stImStucc     116646665.3149    55127753.6071   2.116               0.0347 *  
Exterior1stMetalSd         11548.1228       32725.4667   0.353               0.7243    
Exterior1stPlywood         -8368.3916       28341.4899  -0.295               0.7679    
Exterior1stStone       105750223.7299    49927039.2877   2.118               0.0345 *  
Exterior1stStucco         -13527.1818       31252.4665  -0.433               0.6653    
Exterior1stVinylSd         14522.3085       33039.5903   0.440               0.6604    
Exterior1stWd Sdng         -4926.3874       28411.0329  -0.173               0.8624    
Exterior1stWdShing         12917.3695       29701.1279   0.435               0.6638    
Exterior2ndAsphShn        -65724.0508       98733.1885  -0.666               0.5058    
Exterior2ndBrk Cmn       -107084.8991       64266.9862  -1.666               0.0961 .  
Exterior2ndBrkFace          9574.0650       36492.0495   0.262               0.7931    
Exterior2ndCBlock         -45210.3186       57755.7594  -0.783               0.4340    
Exterior2ndCmentBd        -55304.1212       71463.1418  -0.774               0.4393    
Exterior2ndHdBoard         10945.0082       30981.0321   0.353               0.7240    
Exterior2ndImStucc        -10597.8574       41157.4529  -0.257               0.7969    
Exterior2ndMetalSd         -9946.1829       34895.7041  -0.285               0.7757    
Exterior2ndOther       152139124.4370    71867969.6824   2.117               0.0346 *  
Exterior2ndPlywood         11378.8219       29469.6228   0.386               0.6995    
Exterior2ndStone           57381.5648       43181.9814   1.329               0.1843    
Exterior2ndStucco          19032.7176       33635.9358   0.566               0.5717    
Exterior2ndVinylSd        -23619.2951       34826.6562  -0.678               0.4979    
Exterior2ndWd Sdng          2413.2181       30041.6112   0.080               0.9360    
Exterior2ndWd Shng         -8282.8355       30584.8946  -0.271               0.7866    
MasVnrTypeBrkFace           4799.8273       18744.6208   0.256               0.7980    
MasVnrTypeNone             10460.2382       18690.1870   0.560               0.5759    
MasVnrTypeStone            16497.4966       20438.7556   0.807               0.4198    
MasVnrArea                     2.7837          18.6911   0.149               0.8816    
ExterQualFa                -3327.0696       27254.2708  -0.122               0.9029    
ExterQualGd                -3923.8495       20784.3755  -0.189               0.8503    
ExterQualTA                 2218.5994       21701.5458   0.102               0.9186    
ExterCondFa                31014.2939       25738.7549   1.205               0.2286    
ExterCondGd                34972.3985       23369.0616   1.497               0.1350    
ExterCondPo                -7107.1452       52127.2663  -0.136               0.8916    
ExterCondTA                36396.6554       23114.5323   1.575               0.1158    
FoundationCBlock           11188.9564        7516.3038   1.489               0.1370    
FoundationPConc            -4975.7737        7875.7679  -0.632               0.5277    
FoundationSlab             25575.4342       15046.6133   1.700               0.0896 .  
FoundationStone           -51135.2053       32093.6629  -1.593               0.1115    
FoundationWood            -15205.2422       35717.7354  -0.426               0.6705    
BsmtQualFa                -15402.1230       16095.4592  -0.957               0.3389    
BsmtQualGd                 -2986.0714       12308.4538  -0.243               0.8084    
BsmtQualTA                -14926.9416       13797.4930  -1.082               0.2797    
BsmtCondGd                 -7894.1414       13171.1495  -0.599               0.5491    
BsmtCondPo                -15855.4030       40506.5602  -0.391               0.6956    
BsmtCondTA                  2435.7646        9763.6902   0.249               0.8031    
BsmtExposureGd            -15164.9942        9474.4605  -1.601               0.1099    
BsmtExposureMn             -9820.2935        8432.3737  -1.165               0.2446    
BsmtExposureNo             -5354.2403        6648.7661  -0.805               0.4209    
BsmtFinType1BLQ             2113.5043        7792.3843   0.271               0.7863    
BsmtFinType1GLQ             6420.9048        7275.5580   0.883               0.3778    
BsmtFinType1LwQ              322.9165        9917.4537   0.033               0.9740    
BsmtFinType1None      -186293892.5764    87975096.9926  -2.118               0.0346 *  
BsmtFinType1Rec            -6791.5853        7430.9157  -0.914               0.3610    
BsmtFinType1Unf            18444.3294       11478.1338   1.607               0.1085    
BsmtFinSF1               -186492.0768       88116.6583  -2.116               0.0347 *  
BsmtFinType2BLQ           -11458.4811       16590.7542  -0.691               0.4900    
BsmtFinType2GLQ           -24463.1703       21296.2276  -1.149               0.2511    
BsmtFinType2LwQ             9552.6182       16238.3565   0.588               0.5565    
BsmtFinType2Rec             1020.9162       16499.2350   0.062               0.9507    
BsmtFinType2Unf             -424.3592       17366.6962  -0.024               0.9805    
BsmtFinSF2               -186478.6163       88116.5714  -2.116               0.0347 *  
BsmtUnfSF100           -18663768.1730     8811726.8560  -2.118               0.0345 *  
BsmtUnfSF1005         -187408337.3779    88556040.2841  -2.116               0.0347 *  
BsmtUnfSF1007         -186296951.0595    87975956.3637  -2.118               0.0346 *  
BsmtUnfSF1008         -188016661.3513    88821368.8741  -2.117               0.0346 *  
BsmtUnfSF1010         -188448777.6843    88998928.5763  -2.117               0.0346 *  
BsmtUnfSF1012         -188736257.3180    89173456.5911  -2.117               0.0347 *  
BsmtUnfSF1013         -189082853.7897    89263980.5765  -2.118               0.0345 *  
BsmtUnfSF1017         -189548303.7368    89615372.8304  -2.115               0.0348 *  
BsmtUnfSF1018         -189902056.3487    89703056.3257  -2.117               0.0346 *  
BsmtUnfSF102           -19037358.4322     8988638.0599  -2.118               0.0345 *  
BsmtUnfSF1020         -217715960.8248   102866332.5324  -2.116               0.0347 *  
BsmtUnfSF1022         -190675363.1085    90052308.4518  -2.117               0.0346 *  
BsmtUnfSF1026         -191258983.9583    90407435.4003  -2.116               0.0347 *  
BsmtUnfSF1028         -191981566.4502    90585295.2863  -2.119               0.0344 *  
BsmtUnfSF103           -19168251.9942     9075537.8515  -2.112               0.0350 *  
BsmtUnfSF1030         -186199192.9715    87973146.2279  -2.117               0.0346 *  
BsmtUnfSF1032         -192384501.2641    90935721.9938  -2.116               0.0347 *  
BsmtUnfSF1035          -16167728.9039     7611963.6659  -2.124               0.0340 *  
BsmtUnfSF104           -19417722.6190     9165473.9617  -2.119               0.0345 *  
BsmtUnfSF1040         -193995683.7465    91641284.9552  -2.117               0.0346 *  
BsmtUnfSF1041         -194106175.5555    91728968.2323  -2.116               0.0347 *  
BsmtUnfSF1042         -194394079.7524    91818741.5868  -2.117               0.0346 *  
BsmtUnfSF1043         -258527845.9919   122079653.8324  -2.118               0.0345 *  
BsmtUnfSF1045           12484957.4430     5868473.9496   2.127               0.0337 *  
BsmtUnfSF1046         -195033247.0370    92172298.3435  -2.116               0.0347 *  
BsmtUnfSF1048         -195608151.8548    92345480.0335  -2.118               0.0345 *  
BsmtUnfSF105           -19441645.9678     9251691.9467  -2.101               0.0360 *  
BsmtUnfSF1050         -195872223.8409    92521870.0670  -2.117               0.0346 *  
BsmtUnfSF1052         -196280426.5007    92697925.8616  -2.117               0.0346 *  
BsmtUnfSF1053         -196464832.0286    92787919.7502  -2.117               0.0346 *  
BsmtUnfSF1054         -196541852.5350    92874267.6700  -2.116               0.0347 *  
BsmtUnfSF1055         -256714682.5495   121282235.1483  -2.117               0.0346 *  
BsmtUnfSF1057         -197188332.5895    93139400.6456  -2.117               0.0346 *  
BsmtUnfSF1058         -197328504.4629    93229115.1321  -2.117               0.0346 *  
BsmtUnfSF106           -19796658.8315     9341853.2875  -2.119               0.0344 *  
BsmtUnfSF1063         -261770208.0044   123659247.1006  -2.117               0.0346 *  
BsmtUnfSF1064         -198425672.6499    93755825.3823  -2.116               0.0347 *  
BsmtUnfSF1065         -198717122.4848    93844045.4308  -2.118               0.0346 *  
BsmtUnfSF1066         -186357155.1981    87974819.3517  -2.118               0.0345 *  
BsmtUnfSF1068         -199119032.1902    94109829.4447  -2.116               0.0347 *  
 [ reached getOption("max.print") -- omitted 2247 rows ]
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 43390 on 708 degrees of freedom
Multiple R-squared:  0.9597,	Adjusted R-squared:  0.834 
F-statistic: 7.635 on 2210 and 708 DF,  p-value: < 0.00000000000000022
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
 Here is the graph for the 2nd RandomForest
![random forest 2](https://user-images.githubusercontent.com/25735405/41887820-4071b9ac-78b7-11e8-9a49-fb4154df9bc8.png)
 
 
 
 



## CONCLUSIONS
The biggest hurdle I had in this project was figuring out how to handle the missing data. This took the majority of my time to figure out how to first of all find what was missing, then repalce that data, and figure out what to replace that data with. 

Once I was able to get that portion done, my next set of challenges was getting the newly cleaned data to work propertly in basic linear, rpart, and randomForest models. I was hoping to get an adaboost model in there, but I ran out of time. As I expected, the linear model performed the worst, followed by the rpart model, then finally the random forest model. 

