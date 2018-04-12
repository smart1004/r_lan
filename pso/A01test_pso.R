# https://m.blog.naver.com/PostView.nhn?blogId=kimmingul&logNo=220728839623&proxyReferer=https%3A%2F%2Fwww.google.co.kr%2F

library(pso)

## Not run: 
## Some examples of using the functions in the package

fn <- function(x){  
    20+sum(x^2-10*cos(2*pi*x))
}

## Using basic "optim" interface to minimize a function
set.seed(1)
psoptim(rep(NA,2),fn, 
        lower=-5,upper=5, control=list(abstol=1e-8))

## Parabola
p <- test.problem("parabola",10) # one local=global minimum
set.seed(1)
o1 <- psoptim(p,control=list(trace=1,REPORT=50))
show(o1)

set.seed(1)
o2 <- psoptim(p,control=list(trace=1,REPORT=50,w=c(.7,.1))) 
show(o2)

set.seed(1)
o3 <- psoptim(p,control=list(trace=1,REPORT=1,hybrid=TRUE)) 
show(o3) ## hybrid much faster

## Griewank
set.seed(2)
p <- test.problem("griewank",10) # lots of local minima
o1 <- psoptim(p,control=list(trace=1,REPORT=50))
show(o1)

## The above sometimes get stuck in a local minima.
## Adding a restart to increase robustness.
set.seed(2)
o2 <- psoptim(p,control=list(trace=1,REPORT=50,reltol=1e-4))
show(o2)

## An then adding the hybrid
set.seed(2)
o3 <- psoptim(p,control=list(trace=1,REPORT=50,reltol=1e-4,
                             hybrid=TRUE,hybrid.control=list(maxit=10)))
show(o3)

## Rosenbrock
set.seed(1)
p <- test.problem("rosenbrock",1)
o1 <- psoptim(p,control=list(trace=1,REPORT=50))
show(o1)

## Change to fully informed
set.seed(1)
o2 <- psoptim(p,control=list(trace=1,REPORT=50,p=1))
show(o2)

## Rastrigin
p <- test.problem("rastrigin",10)
set.seed(1)
o1 <- psoptim(p,control=list(trace=1,REPORT=50))
show(o1)

set.seed(1)
o2 <- psoptim(p,control=list(trace=1,REPORT=50,hybrid=TRUE,
                             hybrid.control=list(maxit=10)))
show(o2) # better
plot(o1,xlim=c(0,p@maxf),ylim=c(0,100))
lines(o2,col=2) # and much faster convergence

## Ackley
set.seed(1)
p <- test.problem("ackley",10)
o1 <- psoptim(p,control=list(trace=1,REPORT=50))
show(o1)

## End(Not run)