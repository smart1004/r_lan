# https://m.blog.naver.com/PostView.nhn?blogId=kimmingul&logNo=220728839623&proxyReferer=https%3A%2F%2Fwww.google.co.kr%2F

library(pso)

## Not run: 
## Some examples of using the functions in the package

fn <- function(x){  
    20+sum(x^2-10*cos(2*pi*x))
}

## Using basic "optim" interface to minimize a function
set.seed(1)
rs = psoptim(rep(NA,2),fn, 
        lower=-5,upper=5, control=list(abstol=1e-8))
set.seed(1)
show(rs)


# ## Parabola
# p <- test.problem("parabola",10) # one local=global minimum
# set.seed(1)
# o1 <- psoptim(p,control=list(trace=1,REPORT=50))
# show(o1)
# 
# 
