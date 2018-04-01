
set.seed(1000)
ind = sample(1:nrow(iris),
             nrow(iris)*0.7,
             replace = F)
train = iris[ind, ]
test = iris[-ind, ]
library(nnet)

(m <- multinom(Species~., data=train))

m$fitted.values
m_class <- max.col(m$fitted.values)

table(m_class)
table(train$Species, m_class)

pred3 = predict(m, newdata = test, type = 'class')
# class는 factor 결과값을 구해준다.
table(pred3)
table(test$Species, pred3)
