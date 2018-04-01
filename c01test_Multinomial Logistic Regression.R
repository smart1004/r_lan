#Multinomial Logistic Regression with Iris Data

iris 

library(psych) #Load package psych to use function describeBy

describeBy(iris$Sepal.Length, iris$Species) 


library(stats4) #Load package stats
library(splines) #Load package splines
#To load package VGAM, need to load package stats4 and splines.


library(VGAM) #Load package VGAM

fit.MLR <- vglm( Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, family=multinomial, iris)

summary(fit.MLR)
