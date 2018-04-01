# https://m.blog.naver.com/PostView.nhn?blogId=kimmingul&logNo=220728839623&proxyReferer=https%3A%2F%2Fwww.google.co.kr%2F

# PSO 1
# install.packages("psoptim")
library(psoptim)
n <- 50
m.l <- 50
w <- 0.95
c1 <- 0.2
c2 <- 0.2
xmin <- c(-5.12, -5.12)
xmax <- c(5.12, 5.12)
vmax <- c(4, 4)
g <- function(x){
  -(20 + x[,1]^2 + x[,2]^2 - 10*(cos(2*pi*x[,1]) + cos(2*pi*x[,2])))
}
psoptim(FUN=g, n=n, max.loop=m.l, w=w, c1=c1, c2=c2, xmin=xmin, xmax=xmax, vmax=vmax, seed=5, anim=FALSE)

psoptim(FUN=g, n=n, max.loop=m.l, w=w, c1=c1, c2=c2, xmin=xmin, xmax=xmax, vmax=vmax, seed=5, anim=TRUE)

# PSO 2
# install.packages("pso")
library(pso)
set.seed(1)
psoptim(rep(NA,2),function(x) 20+sum(x^2-10*cos(2*pi*x)), lower=-5, upper=5, control=list(abstol=1e-8))


## 
#DEoptimR
# install.packages("DEoptimR")
library(DEoptimR)
griewank <- function(x) {
  1 + crossprod(x)/4000 - prod( cos(x/sqrt(seq_along(x))) )
}

JDEoptim(rep(-600, 10), rep(600, 10), griewank,
         tol = 1e-7, trace = TRUE, triter = 50)

fcn <-
  list(obj = function(x) {
    35*x[1]^0.6 + 35*x[2]^0.6
  },
  eq = 2,
  con = function(x) {
    x1 <- x[1]; x3 <- x[3]
    c(600*x1 - 50*x3 - x1*x3 + 5000,
      600*x[2] + 50*x3 - 15000)
  })
JDEoptim(c(0, 0, 100), c(34, 17, 300),
         fn = fcn$obj, constr = fcn$con, meq = fcn$eq,
         tol = 1e-7, trace = TRUE, triter = 50)
