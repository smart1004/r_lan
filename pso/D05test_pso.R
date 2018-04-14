
library(psoptim)

n <- 2 # number of particles
m.l <- 1000
w <- 0.95
c1 <- 0.2
c2 <- 0.2
xmin <- c(-5.12, -5.12)
xmax <- c(5.12, -3.12)
vmax <- c(4, 4)

# g <- function(x){  
#   -(20 + x[,1]^2 + x[,2]^2 - 10*(cos(2*pi*x[,1]) + cos(2*pi*x[,2])))
# }
g <- function(x){  
    x1 <- x[1]; x2 <- x[2]
    z <- x1 + x2
}
# psoptim(FUN=g, n=n, max.loop=m.l, w=w, c1=c1, c2=c2,
#         xmin=xmin, xmax=xmax, vmax=vmax, seed=5, anim=FALSE)
psoptim(FUN=g, n=n, max.loop=m.l, 
        xmin=xmin, xmax=xmax, anim=FALSE)

