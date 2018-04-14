# https://m.blog.naver.com/PostView.nhn?blogId=kimmingul&logNo=220728839623&proxyReferer=https%3A%2F%2Fwww.google.co.kr%2F

library(pso)

## Not run: 
# Some examples of using the functions in the package
fn <- function(x){  
    x1 <- x[1]; x2 <- x[2]
    z <- x1 - x2
}

# print(fn(c(1,2)))

## Using basic "optim" interface to minimize a function
set.seed(1)
rs = psoptim(rep(NA,2),fn, lower=c(-2.0,-3.0) ,upper=c(2.0,3.1))
set.seed(1)
show(rs)
