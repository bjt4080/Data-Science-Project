nrow(missing_row)
[1] 1460
names(train)
## show all variable names
var_name <- names(train)
var_name
#Here, we select these important variables by creating a vector that contains variable names
selec_var <- c('Id', 'MSZoning', 'Utlities', 'Neighborhood', 'OverallCond', 'SaleCondition', 'SalePrice')
> select_train <- train[,selec_var]
Error in `[.data.frame`(train, , selec_var) : undefined columns selected
> select_var <- c('Id','MSZoning','Utilities', 'Neighborhood','BldgType','HouseStyle',
                  +                 'OverallQual','OverallCond','YearBuilt', 'ExterQual','ExterCond',
                  +                 'BsmtQual','BsmtCond','TotalBsmtSF','Heating','HeatingQC', 
                  +                 'CentralAir','Electrical','GrLivArea','BedroomAbvGr','KitchenAbvGr',
                  +                 'KitchenQual','TotRmsAbvGrd','Functional','Fireplaces','FireplaceQu',
                  +                 'GarageArea','GarageQual','GarageCond','OpenPorchSF','PoolArea',
                  +                 'Fence','MoSold','YrSold','SaleType','SaleCondition','SalePrice')
select_train <- train[,select_var]
iophead(select_train)
Id MSZoning Utilities Neighborhood BldgType HouseStyle OverallQual
1  1       RL    AllPub      CollgCr     1Fam     2Story           7
2  2       RL    AllPub      Veenker     1Fam     1Story           6
3  3       RL    AllPub      CollgCr     1Fam     2Story           7
4  4       RL    AllPub      Crawfor     1Fam     2Story           7
5  5       RL    AllPub      NoRidge     1Fam     2Story           8
6  6       RL    AllPub      Mitchel     1Fam     1.5Fin           5
OverallCond YearBuilt ExterQual ExterCond BsmtQual BsmtCond
1           5      2003        Gd        TA       Gd       TA
2           8      1976        TA        TA       Gd       TA
3           5      2001        Gd        TA       Gd       TA
4           5      1915        TA        TA       TA       Gd
5           5      2000        Gd        TA       Gd       TA
6           5      1993        TA        TA       Gd       TA
TotalBsmtSF Heating HeatingQC CentralAir Electrical GrLivArea
1         856    GasA        Ex          Y      SBrkr      1710
2        1262    GasA        Ex          Y      SBrkr      1262
3         920    GasA        Ex          Y      SBrkr      1786
4         756    GasA        Gd          Y      SBrkr      1717
5        1145    GasA        Ex          Y      SBrkr      2198
6         796    GasA        Ex          Y      SBrkr      1362
BedroomAbvGr KitchenAbvGr KitchenQual TotRmsAbvGrd Functional
1            3            1          Gd            8        Typ
2            3            1          TA            6        Typ
3            3            1          Gd            6        Typ
4            3            1          Gd            7        Typ
5            4            1          Gd            9        Typ
6            1            1          TA            5        Typ
Fireplaces FireplaceQu GarageArea GarageQual GarageCond OpenPorchSF
1          0        <NA>        548         TA         TA          61
2          1          TA        460         TA         TA           0
3          1          TA        608         TA         TA          42
4          1          Gd        642         TA         TA          35
5          1          TA        836         TA         TA          84
6          0        <NA>        480         TA         TA          30
PoolArea Fence MoSold YrSold SaleType SaleCondition SalePrice
1        0  <NA>      2   2008       WD        Normal    208500
2        0  <NA>      5   2007       WD        Normal    181500
3        0  <NA>      9   2008       WD        Normal    223500
4        0  <NA>      2   2006       WD       Abnorml    140000
5        0  <NA>     12   2008       WD        Normal    250000
6        0 MnPrv     10   2009       WD        Normal    143000
summary(select_train$SalePrice)
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
34900  129975  163000  180921  214000  755000 
summary(select_train$HouseStyle)
1.5Fin 1.5Unf 1Story 2.5Fin 2.5Unf 2Story SFoyer   SLvl 
154     14    726      8     11    445     37     65 
summary(select_train$Neighborhood)
Blmngtn Blueste  BrDale BrkSide ClearCr CollgCr Crawfor Edwards 
17       2      16      58      28     150      51     100 
Gilbert  IDOTRR MeadowV Mitchel   NAmes NoRidge NPkVill NridgHt 
79      37      17      49     225      41       9      77 
NWAmes OldTown  Sawyer SawyerW Somerst StoneBr   SWISU  Timber 
73     113      74      59      86      25      25      38 
Veenker 
11 
options(scipen=10000)
options(scipen=10000)
ggplot(select_train, aes(x = SalePrice, fill = ..count..)) +
  +     geom_histogram(binwidth = 5000) +
  +     ggtitle("Histogram of SalePrice") +
  +     ylab("# of Houses") +
  +     xlab("Housing Price") + 
  +     theme(plot.title = element_text(hjust = 0.5))
