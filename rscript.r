#ACP ----------------------------------------------------------------------------------------------------
## Loading the necessary libraries
library(FactoMineR)
library("factoextra")

## Loading the data
data <- read.csv("ready_for_pca.csv",stringsAsFactors = FALSE)
## We must imputate the target variable
data <- data[, -1]

## PCA
data.pca <- PCA(data, scale.unit = TRUE, graph = F)
## PCA Variables Graph
fviz_pca_var(data.pca, col.var = "cos2",gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), repel = TRUE)

## PCA Eigenvalues
eigenvalue <- get_eigenvalue (data.pca)
eigenvalue

## The new data after reducing the number of dimensions
View(data.pca$ind$coord)

## Total inertia description
fviz_eig(data.pca, addlabels = TRUE, ylim = c(0, 70), title='Description de l\'inertie totale')



#REGRESSION ---------------------------------------------------------------------------------------------

## We only took the 1st 100 observations
X <- seq(0,99)
data <- head(data, 100)
score <- data.frame(X,head(data.pca$ind$coord,100))

##Let's take the target variable
sale <- read.csv("data.csv",stringsAsFactors = FALSE)
sale <- head(sale, 100)
sale <- data.frame(X,sale$SalePrice)


ss <- merge(score , sale)
ss <- ss[, -1]
mod <- lm(formula = sale.SalePrice~. , data=ss  )

## Applying multiple linear regression
plot(mod$fitted.values, ss$sale.SalePrice, abline(0, 1), ylab="SalePrice")
plot(mod$fitted.values, mod$residuals, abline(h = 0, col = "red"),xlab="Fitted Values", ylab="Residuals")

summary(mod)
##   Call:
##     lm(formula = sale.SalePrice ~ ., data = ss)
##
##   Residuals:
##     Min     1Q Median     3Q    Max 
##   -92213 -19096    282  16918 121217 
##
##   Coefficients:
##     Estimate  Std. Error          t   value Pr(>|t|)    
##   (Intercept)     178805       3295  54.265  < 2e-16 ***
##     Dim.1          32732       1831  17.872  < 2e-16 ***
##     Dim.2          -7840       2750  -2.851  0.00535 ** 
##     Dim.3          -5118       3740  -1.369  0.17441    
##     Dim.4          10902       4107   2.655  0.00932 ** 
##     Dim.5           1083       4975   0.218  0.82810    
##---
##     Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
##
##   Residual standard error: 32620 on 94 degrees of freedom
##   Multiple R-squared:  0.8064,	Adjusted R-squared:  0.7961 
##   F-statistic: 78.31 on 5 and 94 DF,  p-value: < 2.2e-16
sigma(mod)/mean(ss$sale.SalePrice)
##   [1] 0.1876575



