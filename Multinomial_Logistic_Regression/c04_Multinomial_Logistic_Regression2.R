# Multinomial Logistic Regression with Iris Data
# R에서는 multinom()을 사용해 모델을 작성할 수 있다.
# multinom은 nnet패키지의 함수이다.
# http://rstudio-pubs-static.s3.amazonaws.com/14459_af8466cb23844215b74c03a471bf8e3c.html

library(nnet)

(m <- multinom(Species ~ ., data = iris))

# 작성한 모델이 주어진 훈련데이터를 어떻게 분류하고 있는지는 fitted()를 사용해 구할 수 있다.
head(fitted(m))

# fitted()의 결과는 각 행의 데이터가 각 분류에 속할 확률을 뜻한다.
# 어떤 분류로 예측되었는지를 알아보기 위해 각 행에서 가장 큰 값이 속하는 열을 뽑을 수도 있겠지만, 
# 더 간단하게 predict()를 사용해도 된다. 특히, predict()에는 newdata에 새로운 데이터를 지정할 수 있다.

apply(fitted(m), 1, max)


a <- apply(fitted(m), 1, max)
ifelse(a == 1, "setosa", ifelse(a == 2, "versicolor", "virginica"))

predict(m)
# [1] setosa     setosa     setosa     setosa     setosa     setosa     setosa     setosa     setosa     setosa    
# [51] versicolor versicolor versicolor versicolor versicolor versicolor versicolor versicolor versicolor versicolor
# [141] virginica  virginica  virginica  virginica  virginica  virginica  virginica  virginica  virginica  virginica 


predict(m, newdata = iris[c(1, 51, 101), ], type = "class")

# 분류를 얻을때는 type=“class"를 지정해야하지만, 기본 값이 class이므로 생략해도 된다.
# 각 분류에 속할 확률을 예측하고자한다면 type="probs"를 지정한다.

predict(m, newdata = iris[c(1, 51, 101), ], type = "probs")


# 모델의 정확도는 예측된 Species와 실제 Species를 비교한다.
predicted <- predict(m, newdata = iris)
sum(predicted == iris$Species)/NROW(iris)

# 분류 대상이 2개 이상인 경우 분할표를 그린다.
xtabs(~predicted + iris$Species)


